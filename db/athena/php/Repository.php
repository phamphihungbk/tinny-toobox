<?php

namespace Athena;

use Aws\Athena\AthenaClient;
use Psr\Log\LoggerInterface;

class Repository
{
    const MAX_RESULT = 1000;

    /**
     * @var string
     */
    private $database;

    /**
     * @var AthenaClient
     */
    private $client;

    /**
     * @var int
     */
    private $waitTimeInMicroSecond;

    /**
     * @var string
     */
    private $outputS3Location;

    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * Repository constructor.
     * @param string $database
     * @param AthenaClient $client
     * @param string $outputS3Location
     * @param LoggerInterface $logger
     * @param int $waitTimeInMicroSecond
     */
    public function __construct(
        string $database,
        AthenaClient $client,
        string $outputS3Location,
        LoggerInterface $logger,
        int $waitTimeInMicroSecond = 200000
    ) {
        $this->client = $client;
        $this->database = $database;
        $this->outputS3Location = $outputS3Location;
        $this->waitTimeInMicroSecond = $waitTimeInMicroSecond;
        $this->logger = $logger;
    }

    /**
     * @param string $query
     * @return \Generator
     */
    public function getData(string $query): \Generator
    {
        $result = [];
        try {
            $queryExecutionId = $this->submitAthenaQuery($query);
            $status = $this->waitForQueryToComplete($queryExecutionId);
            $result = $status ? $this->getResults($queryExecutionId) : [];
        } catch (\Exception $exception) {
            $context = [
                'message' => $exception->getMessage(),
            ];
            $this->logger->error('Athena query failed', $context);
        }
        return $result;
    }

    private function submitAthenaQuery($query)
    {
        $params = $this->getAthenaQuery($query);
        $queryResponse = $this->client->startQueryExecution($params);

        return $queryResponse->get('QueryExecutionId');
    }

    /**
     * @param string $query
     * @return array
     */
    private function getAthenaQuery(string $query): array
    {
        return [
            'QueryExecutionContext' => ['Database' => $this->database],
            'QueryString' => $query,
            'ResultConfiguration' => [
                'EncryptionConfiguration' => ['EncryptionOption' => 'SSE_S3'],
                'OutputLocation' => 's3://' . $this->outputS3Location,
            ]
        ];
    }


    /**
     * Wait for fetch result from query
     *
     * @param string $queryExecutionId
     * @return bool
     * @throws \Exception
     */
    private function waitForQueryToComplete(string $queryExecutionId): bool
    {
        $queryExecutionResponse = $this->client->getQueryExecution(['QueryExecutionId' => $queryExecutionId]);
        $status = $queryExecutionResponse->get('QueryExecution')['Status']['State'];
        switch ($status) {
            case 'SUCCEEDED':
                return true;
            case 'QUEUED':
            case 'RUNNING':
                usleep($this->waitTimeInMicroSecond);
                break;
            default:
                throw new \Exception($status);
        }

        return $this->waitForQueryToComplete($queryExecutionId);
    }

    /**
     * @param string $queryExecutionId
     * @return \Generator
     */
    private function getResults(string $queryExecutionId)
    {
        $params = [
            'QueryExecutionId' => $queryExecutionId,
            'MaxResults' => self::MAX_RESULT,
        ];
        $queryResults = $this->client->getQueryResults($params);
        $data = $queryResults->get('ResultSet')['Rows'];
        $header = $this->getHeader($data[0]);
        yield $this->transformData($header, array_slice($data, 1));

        while ($queryResults->get('NextToken') !== null) {
            $params = array_merge(
                $params,
                ['NextToken' => $queryResults->get('NextToken')]
            );
            $queryResults = $this->client->getQueryResults($params);
            $data = $queryResults->get('ResultSet')['Rows'];
            yield $this->transformData($header, $data);
        }
    }

    /**
     * @param array $header
     * @param array $rawData
     * @return array
     */
    private static function transformData(array $header, array $rawData): array
    {
        $transformedData = [];

        for ($i = 0; $i < count($rawData); $i++) {
            for ($n = 0; $n < count($rawData[$i]['Data']); $n++) {
                $transformedData[$i][$header[$n]] = $rawData[$i]['Data'][$n]['VarCharValue'];
            }
        }

        return $transformedData;
    }

    /**
     * @param array $rawData
     * @return array
     */
    private function getHeader(array $rawData): array
    {
        $header = [];
        for ($i = 0; $i < count($rawData['Data']); $i++) {
            $header[] = $rawData['Data'][$i]['VarCharValue'];
        }
        return $header;
    }
}

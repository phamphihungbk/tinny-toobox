<?php

namespace Athena;

use Aws\Athena\AthenaClient;

class Factory
{
    /**
     * @param string $clientVersion
     * @param string $region
     * @return AthenaClient
     */
    public static function createClient(string $clientVersion, string $region)
    {
        return new AthenaClient([
            'version' => $clientVersion,
            'region' => $region,
        ]);
    }
}

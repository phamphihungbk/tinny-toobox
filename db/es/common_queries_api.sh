# Like count and group by in SQL statement
GET /my-index-000001/_search
{
  "aggs": {
    "my-agg-name": {
      "terms": {
        "field": "my-field"
      },
      "aggs": {
        "my-sub-agg-name": {
          "avg": {
            "field": "my-other-field"
          }
        }
      }
    }
  }
}

# Using terms to query bunch of data
GET /my-index-000001/_search
{
  "query": {
    "bool": {
      "must": {
        "terms": {
          "url" : ["url1", "url2"]
        }
      }
    }
  }
}
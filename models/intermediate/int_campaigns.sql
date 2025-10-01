SELECT*
from {{ref("raw_gz_adwords")}}
UNION ALL
SELECT*
from {{ref("raw_gz_bing")}}
UNION ALL
SELECT*
from {{ref("raw_gz_criteo")}}
UNION ALL
SELECT*
from {{ref("raw_gz_facebook")}}
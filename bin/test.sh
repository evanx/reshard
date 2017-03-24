
set -u -e

  pattern=reshard:* command=del rescan
  redis-cli del reshard:req:q
  redis-cli del reshard:busy:q
  redis-cli del reshard:1:req:h
  redis-cli hset reshard:1:req:h text 'another test message'
  redis-cli lpush reshard:req:q 1
  redis-cli lpush reshard:req:q exit

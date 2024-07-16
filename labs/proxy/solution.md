# Parts
### First
set up the proxy to accept incoming connections, read and parse requests, forward requests to web servers, read the servers’ responses, and forward those responses to the corresponding clien
### Second
upgrade your proxy to deal with multiple concurrent connection
### Third
add caching to your proxy using a simple main memory cache of recently accessed web content

# Main
## part one
refer to `proxy_part1.c`

## part two & three
refer to `cache.h`, `mync.h` and `proxy.c`.

## test 
```bash
# basic correntness
bash ./driver.sh

# large file will not be cached 
bash ./my_test/test_script.sh &
./proxy 15213 &
curl -v --proxy 127.0.0.1:15213 127.0.0.1:15214

```

# Reflection
dont think my solution is graceful, would refer to some high performance http server in Rust and C to read.

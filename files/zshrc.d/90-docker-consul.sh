function docker_consul {
docker run \
  --rm \
  -p 8400:8400 \
  -p 8500:8500/tcp \
  -p 8600:53/udp \
  -e 'CONSUL_LOCAL_CONFIG={"bootstrap_expect":1,"datacenter":"dc1","data_dir":"/usr/local/bin/consul.d/data","server":true}' \
  consul agent -server -bind=127.0.0.1 -client=0.0.0.0 -ui
}

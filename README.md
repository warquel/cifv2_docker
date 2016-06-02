Yet another dockerized instance of the Collective Intelligence Framework (v2)

## Usage

```
docker run --name cifv2 -d -v esdata:/usr/share/elasticsearch/data -p 8080:80 -p 8443:443  warquel/cifv2_docker
```

If you're starting from scratch you'll need to initialize elasticsearch indexes and generate keys for cif-smrt and cif-worker.

```
docker exec cifv2 /opt/cif/bin/cif.ops init
```

If you receive an error that means elasticsearch has not started up yet, try again in a few seconds.

Next generate keys

```
docker exec cifv2 /opt/cif/bin/cif.ops generate-keys
```

Now you should be able to access your cif container with a browser at http://<docker-ip>:8080

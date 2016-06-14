Yet another dockerized instance of the Collective Intelligence Framework (v2)

## Usage

```
docker run --name cifv2 -d -v ~/cif/esdata:/usr/share/elasticsearch/data -v ~/cif/etc:/opt/cif/etc -p 8080:80 -p 8443:443  warquel/cifv2_docker
```

If you're starting from scratch you'll need to initialize elasticsearch indexes and generate keys for cif-smrt and cif-worker.


```
docker exec cifv2 /opt/cif/bin/cif.ops init
```

The rules folder also does not exist so that will need to be created in your container at /opt/cif/etc/rules/default/ or in your local folder that's being mounted (~/cif/etc/rules/default in the usage example above). cif-smrt will need to be restarted once you've set up your rules.

```
docker exec cifv2 supervisortctl restart cif-smrt
```

If you receive an error that means elasticsearch has not started up yet, try again in a few seconds.

Next generate keys

```
docker exec cifv2 /opt/cif/bin/cif.ops generate-keys
```

Now you should be able to access your cif container with a browser at http://\<docker-ip\>:8080

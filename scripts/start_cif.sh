#!/bin/sh

IMAGE="warquel/cifv2"
ESVOL="esdata"

MACHINE_ID="$(docker run -d -v esdata:/usr/share/elasticsearch/data -p 8443:443 -p 5000:5000 -p 9200:9200 warquel/cifv2)"

echo "      Machine ID: ${MACHINE_ID}"
echo "Short Machine ID: ${MACHINE_ID:0:12}"
echo "    Command Line: docker exec -ti ${MACHINE_ID:0:12} /bin/bash"
echo "Run the following commands shortly after starting the container for the first time"
echo "   Initialize ES: docker exec -ti ${MACHINE_ID:0:12} /opt/cif/bin/cif.ops init"
echo "   Initialize ES: docker exec -ti ${MACHINE_ID:0:12} /opt/cif/bin/cif.ops generate-tokens"

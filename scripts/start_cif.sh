#!/bin/sh

IMAGE="warquel/cifv2_docker:latest"
BASEDIR=${HOME}
ESVOL="-v ${BASEDIR}/cif/esdata:/usr/share/elasticsearch/data"
CONFVOL="-v ${BASEDIR}/cif/conf:/opt/cif/etc"
NAME="cifv2"
IP="$(docker-machine ip)"

CMD="docker run --name ${NAME} -d ${ESVOL} ${CONFVOL} -p 8080:80 -p 8443:443 -p 5000:5000 -p 9200:9200 ${IMAGE}"

echo "Running: ${CMD}"
MACHINE_ID="$(${CMD})"

echo "      Machine ID: ${MACHINE_ID}"
echo "Short Machine ID: ${MACHINE_ID:0:12}"
echo "    Command Line: docker exec -ti ${NAME} /bin/bash"
echo "Run the following commands shortly after starting the container for the first time"
echo "   Initialize ES: docker exec -ti ${NAME} /opt/cif/bin/cif.ops init"
echo "   Initialize ES: docker exec -ti ${NAME} /opt/cif/bin/cif.ops generate-tokens"
echo ""
echo "CIFv2: http://${IP}:8080" 

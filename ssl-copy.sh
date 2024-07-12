#!/bin/sh

docker-compose exec -it nexus keytool -printcert -sslserver localhost:8443 -rfc | tee nexus.crt

docker-compose exec -u root jenkins-docker mkdir -p /etc/docker/certs.d/nexus.wemade.com\:5443/
docker-compose cp ./nexus.crt jenkins-docker:/etc/docker/certs.d/nexus.wemade.com\:5443/ca.crt
docker-compose exec -u root jenkins-docker chown root:root /etc/docker/certs.d/nexus.wemade.com\:5443/ca.crt

rm ./nexus.crt
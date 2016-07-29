FROM centos:centos7

MAINTAINER Warren Raquel <warquel@gmail.com>

ENV CIF_ES_HOST localhost:9200
ENV CIF_USER root
ENV CIF_GROUP root

EXPOSE 53
EXPOSE 53/udp
EXPOSE 4961
EXPOSE 4963
EXPOSE 5000
EXPOSE 9200

RUN echo "Building CIFv2 CentOS 7 Container" \
    yum -y update

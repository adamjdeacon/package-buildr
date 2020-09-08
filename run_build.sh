#!/usr/bin/env bash

for CENTOS in 7 8; do
  for R_VERSION in 3.5.2 3.6.3 4.0.2; do
	  docker build -t adamdeacon/packagebuildr:centos${CENTOS}-${R_VERSION}  --build-arg CENTOS=${CENTOS} --build-arg R_VERSION=${R_VERSION} .
  	  docker push adamdeacon/packagebuildr:centos${CENTOS}-${R_VERSION}
  done
done



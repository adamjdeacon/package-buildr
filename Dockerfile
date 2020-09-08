ARG CENTOS=8
FROM centos:$CENTOS
MAINTAINER Adam Deacon <adeacon@mango-solutions.com>
ARG CENTOS=8
ARG R_VERSION=3.5.2

RUN yum install -y epel-release 
#RUN yum install -y  --enablerepo=PowerTools https://cdn.rstudio.com/r/centos-${CENTOS}/pkgs/R-${R_VERSION}-1-1.x86_64.rpm gcc gcc-c++ libcurl-devel openssl-devel libxml2-devel libjpeg-turbo-devel glibc-locale-source glibc-langpack-en libssh-devel 
RUN yum install -y https://cdn.rstudio.com/r/centos-${CENTOS}/pkgs/R-${R_VERSION}-1-1.x86_64.rpm gcc gcc-c++ libcurl-devel openssl-devel libxml2-devel libjpeg-turbo-devel glibc-locale-source glibc-langpack-en libssh-devel 

COPY rpms/*.rpm /local-rpms/
RUN yum install -y /local-rpms/*.rpm && rm -Rfv /local-rpms

RUN ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R && ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript

COPY install_packages.R /
RUN /usr/local/bin/Rscript install_packages.R

VOLUME /build
WORKDIR /build

COPY build.sh /

CMD ["/build.sh"]


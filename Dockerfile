FROM ubuntu:14.04

MAINTAINER Tao Xu <649223152@qq.com> 

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

#COPY sources.list /etc/apt/sources.list
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#RUN echo Asia/Shanghai | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get -y update && apt-get upgrade -y 

ADD provision.sh /provision.sh
ADD run.sh /run.sh
RUN chmod 755 /provision.sh && chmod 755 /run.sh

RUN ./provision.sh

EXPOSE 80

CMD ["/bin/bash", "/run.sh"]

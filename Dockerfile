FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q && apt-get install -y netbase python python-pip \
	&& apt-get clean -y && rm -rf /var/lib/apt/lists/*
ADD ["https://raw.github.com/pypa/pip/master/contrib/get-pip.py", "/"]
ADD requirements.txt /
RUN pip install -r requirements.txt
VOLUME /mnt
EXPOSE 3141
ADD run.sh /
CMD ["/run.sh"]

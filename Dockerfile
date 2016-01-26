FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q && apt-get install -y netbase python-pip fuse \
	&& apt-get clean -y && rm -rf /var/lib/apt/lists/*
ADD requirements.txt /
RUN pip install -r requirements.txt
RUN sed -i'' 's/^# *user_allow_other/user_allow_other/' /etc/fuse.conf # uncomment user_allow_other
RUN chmod a+r /etc/fuse.conf
VOLUME /mnt
EXPOSE 3141
ADD run.sh /
CMD ["/run.sh"]

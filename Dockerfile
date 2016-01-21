FROM python:3
ADD requirements.txt /
RUN pip install -r requirements.txt
VOLUME /mnt
EXPOSE 3141
ADD run.sh /
CMD ["/run.sh"]

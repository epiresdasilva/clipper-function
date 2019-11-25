FROM elmarit/harbour

ENV FLASK_PROXY_PORT 8080
RUN apt-get -y install python-pip
RUN pip install --no-cache-dir gevent==1.1.2 flask==0.11.1 

ADD main.prg /action/main.prg
RUN cd /action/ && hbmk2 /action/main.prg
ADD actionproxy.py /actionProxy/
ADD exec /action/exec
RUN chmod +x /action/exec

CMD ["/bin/bash", "-c", "cd actionProxy && python -u actionproxy.py"]
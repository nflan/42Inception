# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt update && apt -y full-upgrade; \
	apt-get install -y software-properties-common make wget git tar gcc
RUN apt update
RUN wget https://go.dev/dl/go1.19.linux-amd64.tar.gz; \
	tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile; \
	echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
RUN mkdir -p /go;
ENV GOPATH /go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
RUN cd /usr/local/go/src; \
	git clone https://github.com/google/cadvisor.git cadvisor; \
	cd cadvisor; \
	make -j build; \
	cp _output/cadvisor /usr/local/bin; \
	chmod 0777 /usr/local/bin/cadvisor
RUN echo "Stating Cadvisor"
CMD ["cadvisor"]

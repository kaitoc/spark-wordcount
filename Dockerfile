# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN apt-get update && apt-get -y install wget openjdk-8-jdk-headless python2

RUN wget https://archive.apache.org/dist/spark/spark-1.5.2/spark-1.5.2-bin-hadoop2.6.tgz
RUN tar -xvf spark-1.5.2-bin-hadoop2.6.tgz
RUN mv spark-1.5.2-bin-hadoop2.6 /opt/spark
RUN rm spark-1.5.2-bin-hadoop2.6.tgz

RUN ln -s /usr/bin/python2 /usr/bin/python

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

COPY WordCount.py /opt/spark/WordCount.py

CMD ["spark-submit", "--master", "local", "/opt/spark/WordCount.py"]

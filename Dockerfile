FROM openjdk:8u181-jre

ENV KAFKA_HOME=/opt/kafka
ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY kafka_2.11-2.1.0.tgz /tmp/

RUN tar xfz /tmp/kafka_2.11-2.1.0.tgz -C /opt
RUN rm /tmp/kafka_2.11-2.1.0.tgz
RUN ln -s /opt/kafka_2.11-2.1.0 /opt/kafka

COPY server.properties.template /opt/kafka/config
COPY start.sh /start.sh

WORKDIR /opt/kafka

VOLUME ["/kafka"]

CMD ["/start.sh"]


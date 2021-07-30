FROM openjdk:11

RUN apt-get -y update && \
    apt-get install -y build-essential && \
    apt-get install -y python3-pip

RUN pip3 install dxpy

WORKDIR /home/action

COPY entrypoint.sh .
COPY cromwell-65.jar /tmp/.
COPY dxCompiler-2.4.7.jar /tmp/.

RUN chmod -R a+x /tmp/cromwell-65.jar
RUN chmod -R a+x /tmp/dxCompiler-2.4.7.jar

ENTRYPOINT ["entrypoint.sh"]
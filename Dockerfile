
FROM t10471/java7:latest

MAINTAINER t10471 <t104711202@gmail.com>


ENV SCALA_TARBALL http://www.scala-lang.org/files/archive/scala-2.11.2.deb
ENV SBT_TARBALL   http://dl.bintray.com/sbt/debian/sbt-0.13.5.deb


# install from Typesafe repo (contains old versions but they have all dependencies we need later on)
RUN DEBIAN_FRONTEND=noninteractive  && \
    apt-get install -y --force-yes wget  && \
    wget http://apt.typesafe.com/repo-deb-build-0002.deb  && \
    dpkg -i repo-deb-build-0002.deb  && \
    apt-get update  && \
    \
    apt-get install -y --force-yes libjansi-java  && \
    wget $SCALA_TARBALL  && \
    wget $SBT_TARBALL    && \
    dpkg -i scala-*.deb  sbt-*.deb  && \
    \
    rm -f *.deb  && \
    apt-get clean



# create an empty sbt project;
# then fetch all sbt jars from Maven repo so that your sbt will be ready to be used when you launch the image
COPY test-sbt.sh /tmp/
WORKDIR /tmp
RUN bash test-sbt.sh  && \
    rm -rf *

# print versions
RUN java -version

# scala -version returns code 1 instead of 0 thus "|| true"
RUN scala -version || true


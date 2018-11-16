FROM streamsets/datacollector:latest

# Build time argument to install packages
ENV PACKAGES_TO_INSTALL=streamsets-datacollector-apache-kafka_0_10-lib,streamsets-datacollector-apache-kafka_0_11-lib,streamsets-datacollector-apache-kafka_1_0-lib,streamsets-datacollector-groovy_2_4-lib,streamsets-datacollector-jython_2_7-lib,streamsets-datacollector-cassandra_3-lib,streamsets-datacollector-jdbc-lib

# Install the packages
RUN if [[ ! -z $PACKAGES_TO_INSTALL ]]; then $SDC_DIST/bin/streamsets stagelibs -install=$PACKAGES_TO_INSTALL ; fi
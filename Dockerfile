# command to build: docker build --tag janusgraph:0.2.0 .
# http://docs.janusgraph.org/latest/server.html
FROM openjdk

# Download and unzip the janusgraph file.
WORKDIR /tmp/janusgraph/

# Download and unzip janusgraph.
RUN curl --location --output janus.zip https://github.com/JanusGraph/janusgraph/releases/download/v0.2.0/janusgraph-0.2.0-hadoop2.zip ; \
    unzip janus.zip ; \
    rm janus.zip ; \
    mv janusgraph-0.2.0-hadoop2 /app ; \
    rm -Rf /tmp/janusgraph

# Copy from file
# COPY janusgraph-0.2.0-hadoop2/ /app/

# Continue here.
WORKDIR /app

# Default port for janusgraph-gremlin
EXPOSE 8182

# Default config settings.
ENV JANUS_SERVER_CONFIG="conf/gremlin-server/gremlin-server.yaml"


# Add volumes for configuration
VOLUME [ "/app/conf" ]

# Start the server.
ENTRYPOINT [ "bin/gremlin-server.sh" ]
# Set the config file in cmd.
CMD ["${JANUS_SERVER_CONFIG}"]

# command to build: docker build --tag janusgraph:0.3.0 .
# http://docs.janusgraph.org/latest/server.html
FROM openjdk:11.0.1-jre-sid

# Copy from file
COPY tmp/janusgraph-0.3.0-hadoop2/ /app/

# Continue here.
WORKDIR /app

# Default port for janusgraph-gremlin
EXPOSE 8182

# Default config settings.
ENV JANUS_SERVER_CONFIG="conf/gremlin-server/gremlin-server.yaml"
ENV JANUS_SERVER_PROPERTIES="conf/gremlin-server/janusgraph-cql-es-server.properties"


# Add volumes for configuration
VOLUME [ "/app/conf" ]

# Start the server.
ENTRYPOINT [ "bin/gremlin-server.sh" ]
# Set the config file in cmd.
CMD ["${JANUS_SERVER_CONFIG}"]

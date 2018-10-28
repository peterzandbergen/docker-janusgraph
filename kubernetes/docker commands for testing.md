docker run --rm -it -e JANUS_SERVER_CONFIG="/app/conf/gremlin-server/gremlin-server.yaml" peterzandbergen/janusgraph:0.3.0 

docker run --rm -it -e JANUS_SERVER_CONFIG="conf/gremlin-server/gremlin-server.yaml" peterzandbergen/janusgraph:0.3.0 bin/gremlin-server.sh conf/gremlin-server/gremlin-server.yaml

docker run --rm -it -e JANUS_SERVER_CONFIG="conf/gremlin-server/gremlin-server.yaml" peterzandbergen/janusgraph:0.3.0 conf/gremlin-server/gremlin-server.yaml

docker run --rm -it -e JANUS_SERVER_CONFIG="conf/gremlin-server/gremlin-server.yaml"  --entrypoint "/bin/sh" peterzandbergen/janusgraph:0.3.0

docker run --rm -it --entrypoint "/bin/sh" peterzandbergen/janusgraph:0.3.0

docker run --rm -it peterzandbergen/janusgraph:0.3.0 /app/bin/gremlin-server.sh

docker run --rm -it peterzandbergen/janusgraph:0.3.0 bin/gremlin-server.sh ${JANUS_SERVER_CONFIG}


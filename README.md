# docker-janusgraph
Docker image for Janusgraph


# To play with the graph

Connect to the backend:
```
graph = JanusGraphFactory.open('conf/gremlin-server/janusgraph-cql-es-server.properties')
```

Get a traversal object:
```
g = graph.traversal()
```

Load a demo graph:
```
GraphOfTheGodsFactory.load(graph)
```

```
curl -XPOST -Hcontent-type:application/json -d '{"gremlin":"<replace this"}' http://localhost:8182
```

```
curl -XPOST -Hcontent-type:application/json -d '{"gremlin":"g.V().count()"}' http://localhost:8182
```

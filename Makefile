janus: tmp/janusgraph-0.3.0-hadoop2
	curl --location --output tmp/janusgraph.zip https://github.com/JanusGraph/janusgraph/releases/download/v0.3.0/janusgraph-0.3.0-hadoop2.zip
	unzip tmp/janusgraph.zip -d tmp
	# rm tmp/janusgraph.zip
	# mv tmp/janus /app
	# rm -Rf tmp/janusgraph
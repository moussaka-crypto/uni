mkdir /home/itsadmin/Elastic/ncedc-earthquakes-dataset
cd /home/itsadmin/Elastic/ncedc-earthquakes-dataset

wget https://raw.githubusercontent.com/elastic/examples/master/Exploring%20Public%20Datasets/earthquakes/ncedc-earthquakes-dataset.tar.gz

wget https://raw.githubusercontent.com/elastic/examples/master/Exploring%20Public%20Datasets/earthquakes/ncedc-earthquakes-template.json

wget https://raw.githubusercontent.com/elastic/examples/master/Exploring%20Public%20Datasets/earthquakes/ncedc-earthquakes-pipeline.json

wget https://raw.githubusercontent.com/elastic/examples/master/Exploring%20Public%20Datasets/earthquakes/ncedc-earthquakes-dashboards.json

wget https://raw.githubusercontent.com/elastic/examples/master/Exploring%20Public%20Datasets/earthquakes/ncedc-earthquakes-filebeat.yml

tar -zxf ncedc-earthquakes-dataset.tar.gz

cp ncedc-earthquakes-filebeat.yml ncedc-earthquakes-filebeat.yml.orig

sed -i "s&./ncedc-earthquakes-dataset&/es_data/ncedc-earthquakes-dataset&g" ncedc-earthquakes-filebeat.yml

curl -XPUT -H 'Content-Type: application/json' 'localhost:9200/_ingest/pipeline/ncedc-earthquakes' -d @ncedc-earthquakes-pipeline.json

curl -XPUT -H 'Content-Type: application/json' 'localhost:9200/_template/ncedc-earthquakes' -d @ncedc-earthquakes-template.json

docker exec es1 /bin/bash -c "/bin/cp /es_data/ncedc-earthquakes-dataset/ncedc-earthquakes-filebeat.yml /usr/share/filebeat/bin/"

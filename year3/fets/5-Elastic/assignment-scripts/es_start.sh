#! /bin/bash

zz_es_cfg_dir=/etc/elasticsearch

cp ${zz_es_cfg_dir}/elasticsearch.yml \
    ${zz_es_cfg_dir}/elasticsearch.yml.orig

sed -i "/node.name/s/#node.name.*/node.name: ${es_node_name}/g" \
    ${zz_es_cfg_dir}/elasticsearch.yml

echo -e "http.host: 0.0.0.0 \n" | \
    tee -a ${zz_es_cfg_dir}/elasticsearch.yml

echo -e "transport.host: 0.0.0.0 \n" | \
    tee -a ${zz_es_cfg_dir}/elasticsearch.yml

echo -e "discovery.zen.minimum_master_nodes: 1 \n" | \
    tee -a ${zz_es_cfg_dir}/elasticsearch.yml

echo -e "discovery.zen.ping.unicast.hosts: [ ${es_hosts} ] \n" | \
    tee -a ${zz_es_cfg_dir}/elasticsearch.yml

rm -f /usr/lib/sysctl.d/elasticsearch.conf

service elasticsearch start

# Keep running forever so that the container doesn't stop ...
tail -f /dev/null

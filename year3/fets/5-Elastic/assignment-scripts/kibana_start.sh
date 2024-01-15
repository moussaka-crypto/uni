#! /bin/bash

zz_kibana_cfg_dir=/etc/kibana

cp ${zz_kibana_cfg_dir}/kibana.yml     ${zz_kibana_cfg_dir}/kibana.yml.orig

sed -ri "s!^(\#\s*)?(server\.host:).*!\2 '0.0.0.0'!"     ${zz_kibana_cfg_dir}/kibana.yml

sed -ri "s!^(\#\s*)?(elasticsearch\.hosts:).*!\2 ['http://es1:9200']!"     ${zz_kibana_cfg_dir}/kibana.yml

sed -i "s/es1:/${es_host}:/g" ${zz_kibana_cfg_dir}/kibana.yml

service kibana start

# Keep running forever so that the container doesn't stop ...
tail -f /dev/null

#!/bin/bash
echo $1
docker exec demootrs_mail add-account $1 otrs

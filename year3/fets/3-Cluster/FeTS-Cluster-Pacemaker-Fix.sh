#!/bin/bash
echo "--------------------------------------------------------"
echo "FeTS CLUSTER PRAKTIKUM 3 - PACEMAKER FIX, REVERT VERSION"
echo "--------------------------------------------------------"
echo "v2020-11-16_1445"
echo "Skript muss als root ausgefuehrt werden."
# see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=974563

echo "-------------------------"
echo "- Installation Pacemaker"
apt install libcib4=1.1.16-1 libcrmcluster4=1.1.16-1 libcrmcommon3=1.1.16-1 libcrmservice3=1.1.16-1 liblrmd1=1.1.16-1 libpe-rules2=1.1.16-1 libpe-status10=1.1.16-1 libpengine10=1.1.16-1 libstonithd2=1.1.16-1 libtransitioner2=1.1.16-1 pacemaker=1.1.16-1 pacemaker-cli-utils=1.1.16-1 pacemaker-common=1.1.16-1 pacemaker-resource-agents=1.1.16-1 -y
echo "-------------------------"
echo "- Installation PCS"
apt install pcs -y
echo "-------------------------"
echo "- Installation Apache2"
apt install apache2 -y
echo "-------------------------"
echo "Installation abgeschlossen"

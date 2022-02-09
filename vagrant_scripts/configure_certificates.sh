#!/usr/bin/env bash


cp /vagrant/certificates/fullchain.pem /var/tmp/fullchain.pem
cp /vagrant/certificates/privkey.pem /var/tmp/privkey.pem

chmod 600 /var/tmp/fullchain.pem
chmod 600 /var/tmp/privkey.pem
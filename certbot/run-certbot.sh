#!/bin/bash

array=(${CN//,/ })
for i in "${!array[@]}"
do
  letsencrypt certonly --webroot -w /var/www/letsencrypt -d "${array[i]}" --agree-tos --email "$EMAIL" --non-interactive --text

  mkdir -p /var/certs/"${array[i]}"
  cp /etc/letsencrypt/archive/"${array[i]}"/cert1.pem /var/certs/"${array[i]}"/cert.pem
  cp /etc/letsencrypt/archive/"${array[i]}"/chain1.pem /var/certs/"${array[i]}"/chain.pem
  cp /etc/letsencrypt/archive/"${array[i]}"/fullchain1.pem /var/certs/"${array[i]}"/fullchain.pem
  cp /etc/letsencrypt/archive/"${array[i]}"/privkey1.pem /var/certs/"${array[i]}"/privkey.pem
done

#!/usr/bin/env sh

AWSREGION=$(curl -s $ECS_CONTAINER_METADATA_URI/task | jq -r .AvailabilityZone | sed 's/.$//')

aws acm get-certificate --region $AWSREGION --certificate-arn $KOLIDE_CERTIFICATE_ARN | jq -r .CertificateChain > /certs/kolide.crt
aws ssm get-parameters --region $AWSREGION --names $KOLIDE_SSL_PRIVKEY_SSM_PARAM --with-decryption | jq -r .Parameters[0].Value > /certs/kolide.key
fleet prepare db
fleet serve

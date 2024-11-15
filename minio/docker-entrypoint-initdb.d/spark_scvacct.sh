#!/bin/bash
sleep 3;

/usr/local/bin/mc alias set myminio http://minio:9000 minio minio123
# /usr/bin/mc mb myminio/test;
/usr/local/bin/mc admin user svcacct remove myminio test
/usr/local/bin/mc admin user svcacct add --access-key 'test' --secret-key 'minio123' myminio minio
#/usr/local/bin/mc admin policy set myminio readwrite user=svcacct

exit 0;
#!/usr/bin/env bash

E_OWNED_DIRS="
 ./cmd/apiserver_receive_adapter 
 ./cmd/cronjob_receive_adapter 
 ./cmd/ping 
 ./cmd/mtping 
 ./cmd/sources_controller 
 ./pkg/adapter 
 ./pkg/kncloudevents 
 ./pkg/reconciler/apiserversource 
 ./pkg/reconciler/containersource 
 ./pkg/reconciler/cronjobsource 
 ./pkg/reconciler/sinkbinding 
 ./pkg/reconciler/apiserversource 
 ./pkg/reconciler/sinkbinding 
 ./pkg/reconciler/pingsource 
 ./pkg/apis/sources
"

DATE=2020-09-24
KN_SANDBOX_PATH=.

# Clone the repos first...
git clone https://github.com/knative/eventing.git
pushd eventing
E_LOGS=`git log --after=$DATE -- \
  $E_OWNED_DIRS `
popd

# Knative-Sandbox repos

git clone https://github.com/knative-sandbox/discovery.git
pushd $KN_SANDBOX_PATH/discovery
ES_DISCOVERY_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/sample-source.git
pushd $KN_SANDBOX_PATH/sample-source
ES_SAMPLE_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-ceph.git
pushd $KN_SANDBOX_PATH/eventing-ceph
ES_CEPH_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-awssqs.git
pushd $KN_SANDBOX_PATH/eventing-awssqs
ES_SQS_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-prometheus.git
pushd $KN_SANDBOX_PATH/eventing-prometheus
ES_PROM_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-gitlab.git
pushd $KN_SANDBOX_PATH/eventing-gitlab
ES_GITLAB_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-github.git
pushd $KN_SANDBOX_PATH/eventing-github
ES_GITHUB_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-couchdb.git
pushd $KN_SANDBOX_PATH/eventing-couchdb
ES_COUCHDB_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-camel.git
pushd $KN_SANDBOX_PATH/eventing-camel
ES_CAMEL_LOGS=`git log --after=$DATE -- \
  . `
popd

git clone https://github.com/knative-sandbox/eventing-rabbitmq.git
pushd $KN_SANDBOX_PATH/eventing-rabbitmq
ES_RABBITMQ_LOGS=`git log --after=$DATE -- \
  . `
popd

echo "$E_LOGS \n $EC_LOGS \n $ES_DISCOVERY_LOGS \n $ES_SAMPLE_LOGS \n $ES_CEPH_LOGS \n $ES_SQS_LOGS \n $ES_PROM_LOGS \n $ES_GITLAB_LOGS \n $ES_GITHUB_LOGS \n $ES_COUCHDB_LOGS \n $ES_CAMEL_LOGS \n $ES_RABBITMQ_LOGS" \
   | grep Author | cut -f2 -d: | sort | uniq -c | sort -k1 -n -r  | head -n 25




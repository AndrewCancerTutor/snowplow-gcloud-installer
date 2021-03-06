
# config file for Google Snow Plow setup scripts.
# prefix is GSP, for easy grepping. Source with . ./0-set-environment.sh
#

# change this:
export GSP_RANDOM_UUID="2075C649-5DF8-4BC2-8D04-F6B4C3418E47"
#
# or uncomment
# export GSP_RANDOM_UUID=$(uuidgen)


# directory of your scripts and files
# needs 2 dirs: ./templates and ./output-dir
export GSP_ROOTDIR=~/git/snowplow-gcloud-installer

# GCE project name (create it first) and credential file
export GSP_PROJECT_NAME="your-project-name-123"

# make sure the credentials file exists (and has safe permissions)
export GSP_KEYFILE=./credentials.json

export GSP_SERVICE_ACCOUNT=$(grep client_email ${GSP_KEYFILE} | cut -d\" -f4)


# region - all 
# note: enter the ZONE here, including the "-a", "-b", or "-c". - TODO: fix naming convention
# example: "europe-west3-c"
export GSP_REGION="europe-west3-c"


# region dataflow - is not available everywhere
export GSP_DATAFLOW_REGION="europe-west1"

######################
# storage buckets

# main storage. Script also creates a bucket with -tmp appended
export GSP_STORAGE_BUCKET="sp-storage-random123"

######################
# iglu resolve with google?
# y = "_google"
# n = ""
#export GSP_RESOLVE_GOOGLE="_google"
export GSP_RESOLVE_GOOGLE=""

######################
# collector 

# hostname - change to your domain and hostname
export GSP_TRACKER_DOMAIN="datadatadata.nl"
export GSP_TRACKER_HOSTNAME="stats"

export GSP_TRACKER_HOST=${GSP_TRACKER_HOSTNAME}.${GSP_TRACKER_DOMAIN}

# collector instance template and group

export GSP_COLLECTOR_INSTANCE_NAME="sp-coll"
# f1-micro g1-small n1-standard-1
export GSP_COLLECTOR_INSTANCE_TYPE="g1-small"

# config
export GSP_COLLECTOR_VERSION="0.14.0"
export GSP_COLLECTOR_PORT="8080"
export GSP_DOMAIN_LISTEN='[ "*" , "127.0.0.1" ]'

# group
export GSP_COLLECTOR_INSTANCE_GROUP_NAME="sp-collector-group"

# health check
export GSP_COLLECTOR_HEALTH='sp-collector-healthcheck'


######################
# ETL instance
export GSP_ETL_INSTANCE_NAME="sp-etl"
# f1-micro g1-small n1-standard-1
export GSP_ETL_INSTANCE_TYPE="n1-standard-1"

# config
export GSP_ETL_VERSION="0.1.0"
export GSP_ETL_BQ_VERSION="0.1.0"
export GSP_DOMAIN_LISTEN='[ "*" , "127.0.0.1" ]'

######################
# pubsub

# subscriptions will append -sub to the sink

# collector sinks
export GSP_PUBSUB_GOOD="sp-coll-good"
export GSP_PUBSUB_BAD="sp-coll-bad"

# enriched
export GSP_PUBSUB_GOOD_ENRICHED="sp-enriched-good"
export GSP_PUBSUB_BAD_ENRICHED="sp-enriched-bad"

# BQ sinks
export GSP_PUBSUB_BQ_BAD="bq-bad-rows"
export GSP_PUBSUB_BQ_FAILED="bq-failed-inserts"
export GSP_PUBSUB_BQ_TYPES="bq-types"


######################
# bigquery

export GSP_BQ_DATASET_NAME="snowplow_dataset"
export GSP_BQ_DATA_LOCATION="EU"


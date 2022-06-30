#!/bin/bash

project=$(oc project --short=true)

while [ $# -gt 0 ]; do
  case "$1" in
    --app-prefix=*)
      app_prefix="${1#*=}"
      ;;
    --project=*)
      project="${1#*=}"
      ;;
    *)
  esac
  shift
done

if [ -n "$project" ]; then
    echo "This script will execute against project "$project
fi


project_prefix=$project

oc delete $(oc get jobs -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get cronjobs -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get pods -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get secrets -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get routes -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get deploy -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get imagestreams -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get services -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get configmaps -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get bc -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get builds -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get dc -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get pvc -n "$project" -o name | grep "$app_prefix")
oc delete $(oc get akc -n "$project" -o name | grep "$app_prefix")


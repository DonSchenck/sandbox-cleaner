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


oc delete $(oc get pods -o name | grep "$project_prefix")
oc delete $(oc get secrets -o name | grep "$project_prefix")
oc delete $(oc get routes -o name | grep "$project_prefix")
oc delete $(oc get deploy -o name | grep "$project_prefix")
oc delete $(oc get imagestreams -o name | grep "$project_prefix")
oc delete $(oc get services -o name | grep "$project_prefix")
oc delete $(oc get configmaps -o name | grep "$project_prefix")
oc delete $(oc get bc -o name | grep "$project_prefix")
oc delete $(oc get builds -o name | grep "$project_prefix")
oc delete $(oc get dc -o name | grep "$project_prefix")
oc delete $(oc get pvc -o name | grep "$project_prefix")


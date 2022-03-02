$PROJECT_NAME=oc project --short=true

# if [ $# -eq 0 ]; then
#    echo "This script will execute against your current project"PROJECT_NAME
#else
#    echo "The app prefix must be supplied as a command-line parameter, e.g. ./sandbox-cleaner.sh myproject"
#fi


project_prefix=$(1:-$DEFAULT_VALUE)
app_prefix="post"

oc delete $(oc get pods -o name | grep "$app_prefix")
oc delete $(oc get secrets -o name | grep "$app_prefix")
oc delete $(oc get routes -o name | grep "$app_prefix")
oc delete $(oc get deploy -o name | grep "$app_prefix")
oc delete $(oc get imagestreams -o name | grep "$app_prefix")
oc delete $(oc get services -o name | grep "$app_prefix")
oc delete $(oc get configmaps -o name | grep "$app_prefix")
oc delete $(oc get bc -o name | grep "$app_prefix")
oc delete $(oc get builds -o name | grep "$app_prefix")
oc delete $(oc get dc -o name | grep "$app_prefix")
oc delete $(oc get pvc -o name | grep "$app_prefix")
oc delete $(oc get akc -o name | grep "$app_prefix")


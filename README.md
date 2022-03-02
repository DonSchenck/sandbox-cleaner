# sandbox-cleaner
Given an app prefix, goes through your OpenShift project and deletes all related objects.

Was created with the Developer Sandbox for Red Hat OpenShift in mind, since you will probably have all your ojects in one project.

For example:

`./sandbox-cleaner.sh --app-prefix=myappprefix`

You can optionally provide a project name:

`./sandbox-cleaner.sh --project=myproject --app-prefix=myappprefix`  




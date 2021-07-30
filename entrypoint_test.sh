#!/bin/sh -l
set -e
export JAVA_HOME=/usr/local/openjdk-18/bin/java

echo "Project id: $1"
echo "Overwrite: $2"
echo "Workflow directory: $3"
echo "Workflow Name: $4"
echo "Input Json Name: $5"
echo "Destination Path: $6"

echo "Logging into dnanexus"
dx login --token $DX_TOKEN --noprojects
echo "Logged into dnanexus"
dx select $1
echo "Changing into workspace directory & listing contents"
cd /github/workspace
ls -alh
echo listing directory: $(ls)
echo "Changing into applet directory & listing contents"
cd $3
ls -alh

echo "Selecting dnanexus project: $1"
dx select $1
echo "Compiling workflow applet"

if [ "$2" = 'true' ]; then
    /usr/local/openjdk-18/bin/java -jar /tmp/dxCompiler-2.4.7.jar compile $4 --inputs $5 --project $1 --destination $6
else
    /usr/local/openjdk-18/bin/java -jar /tmp/dxCompiler-2.4.7.jar compile $4 --inputs $5 --project $1 --destination $6
fi

echo ::set-output name=project-id::$1
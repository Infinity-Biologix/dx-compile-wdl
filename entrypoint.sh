#!/bin/sh -l
set -e

echo "Project id: $1"
echo "Overwrite: $2"
echo "Workflow directory: $3"
echo "Workflow Name: $4"
echo "Input Json Name: $5"
echo "Destination Path: $6"

echo "Logging into dnanexus"
dx login --token $DX_TOKEN --noprojects
echo "Logged into dnanexus"

echo "Changing into applet directory & listing contents"
cd $3
ls -alh

echo "Selecting dnanexus project: $1"
dx select $1
echo "Selected dnanexus project: $1"

echo "Compiling workflow applet"

if [ "$2" = 'true' ]; then
    java -jar /tmp/dxCompiler-2.4.7.jar compile $4 --inputs $5 --project $1 --destination $6
else
    java -jar /tmp/dxCompiler-2.4.7.jar compile $4 --inputs $5 --project $1 --destination $6
fi

echo ::set-output name=project-id::$1
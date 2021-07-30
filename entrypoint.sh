#!/bin/sh -l
set -e

echo "Project id: $1"
echo "Overwrite: $2"
echo "Workflow directory: $3"
echo "Workflow Name: $4"
echo "Destination Path: $5"

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
    java -jar /tmp/dxCompiler-2.4.7.jar compile $WDL_FILE_NAME --inputs $INPUT_JSON_NAME --project $1 --destination $5
else
    java -jar /tmp/dxCompiler-2.4.7.jar compile $WDL_FILE_NAME --inputs $INPUT_JSON_NAME --project $1 --destination $5
fi

echo ::set-output name=project-id::$1
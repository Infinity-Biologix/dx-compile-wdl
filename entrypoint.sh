#!/bin/bash
set -uex

echo "Project id: $1"
echo "Workflow directory: $3"
echo "Workflow Name: $4"
echo "Input Json Name: $5"
echo "Destination Path: $6"

echo "Changing into workspace directory & listing contents"
cd /github/workspace
echo listing directory: $(ls)
echo "Changing into applet directory & listing contents"
cd $3
ls -alh
CMD="java -jar /tmp/dxCompiler-2.4.7.jar compile $4 --inputs $5 --project $1 --destination $6"
workflow_id=$(eval "$CMD")
echo ::set-output name=workflow_id::"$workflow_id"
#!/bin/bash
set -uex

echo "Project id: $1"
echo "Workflow directory: $2"
echo "Workflow Name: $3"
echo "Input Json Name: $4"
echo "Destination Path: $5"

echo "Changing into workspace directory & listing contents"
cd /github/workspace
echo listing directory: $(ls)
echo "Changing into applet directory & listing contents"
cd $2
ls -alh
CMD="java -jar /dxCompiler.jar compile $3 --inputs $4 --project $1 --destination $5"
workflow_id=$(eval "$CMD")
echo ::set-output name=workflow_id::"$workflow_id"
# dx-compile-wdl

## About Infinity Biologix

The mission of IBX is to understand the genetic causes of common, complex diseases and to discover diagnoses, treatments and, eventually, cures for these diseases. To this end, we collaborate with researchers in the public and private sectors throughout the world, providing the highest quality biobanking services and biomaterials, as well as scientific and technical support.

## Description

This repository houses a github actions workflow that helps compile a DNA Nexus WDL workflow to the platform:

```
java -jar /tmp/dxCompiler-2.4.7.jar compile $WDL_FILE_NAME --inputs $INPUT_JSON_NAME --project $PROJECT_NAME --destination $DESTINATION_NAME
```

This task is run in a public docker container hosted on docker hub: [infinitybiologix/dx-compile-wdl](https://hub.docker.com/r/infinitybiologix/dx-compile-wdl)

## Getting Started

### Testing

The wdl can be tested locally by launching it with cromwell:
```
java -jar ~/cromwell-65.jar run fastqc-agg.wdl --inputs input-json.json --options options.json
```
### Deployment
Simply feature this in your github actions as follows:

```
name: Push Applet to DNA Nexus
on: workflow_dispatch
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: dxCompile DNAnexus WDL Workflow
        uses: Infinity-Biologix/dx-compile-wdl@1.0.5
        with:
          project-id: ${{ secrets.PROJECT_ID }}
          workflow-directory: 'workflow'
          workflow-name: 'imputation.wdl'
          input-json-name: 'input-json.dnanexus.json'
          destination-path: '/workflow'
          api_token: ${{ secrets.DX_TOKEN }}
```

## Help

Always appreciated.

## Authors

Contributors names and contact info

    Alexander Bogdanowicz[@akbog]

## Acknowledgments

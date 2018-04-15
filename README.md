# Drone Coralogix Versioning plugin
A Drone plugin that reports versions to coralogix API

### Prerequisites
In order to use the SSM functionality to load secrets from AWS, you need to install and configure [Chamber](https://github.com/segmentio/chamber).

The process takes literally 5 minutes and is very usefull.

When it's ready, run Chamber from your chosen location to store the key: `chamber write global coralogix_key`.

Chamber will be downloaded to the plugin and used when the plugin runs based on the IAM Role given in the environment.

If you wish to provide the key directly to the plugin by yourself, you can do that using `dckey` parameter below.



### Build
Build the binary with the following commands:
```bash
crystal build --static --release
```


### Docker
Build the Docker image with the follwing commands:
```bash
docker build --rm=true -t omerxx/drone-coralogix-version-plugin .
```


### Usage
The plugin uses AWS Systems Manager (SSM) in order to pull secrets, using [Chmber](https://github.com/segmentio/chamber).
This behavior is default and can be overridden using the `dskey` parameter.

```yaml
  coralogix-version-tag:
    image: omerxx/drone-coralogix-version-plugin
    pull: true
    dcapplication: ${DRONE_BRANCH}
    dcsubsystem: my-application
    dcname: ${DRONE_REPO_NAME}-${DRONE_BRANCH}-${DRONE_BUILD_NUMBER}
    when:
      branch: master 
      event: push 

```


### Parameter Reference
All parameters are prefixed with `dc` (Drone Coralogix) for conflict prevention and convention.

#### Mandatory

`dcaplication`

Application name of the tag - in coralogix this is usually the environment of deployment, can be set to `${DRONE_BRANCH}`


`dcsubsystem`

The actual application name e.g "my-micro-service"


`dcname`

The name that will be given to the tag by the system and will be presented in the Coralogix tags section

#### Optional

`dckey`

The API key to call Coralogix's API. Only mandatory if Chamber and SSM are not set like described in the Prerequisites section.


`dctimestamp` - Optional

A timestamp in the format `yyyy-mm-dd:HH:mm`




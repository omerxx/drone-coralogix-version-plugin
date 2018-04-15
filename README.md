# Drone Coralogix Versioning plugin
A Drone plugin that reports versions to coralogix API

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

##### Mandatory

`dcaplication`

Application name of the tag - in coralogix this is usually the environment of deployment, can be set to `${DRONE_BRANCH}`

`dcsubsystem`

The actual application name e.g "my-micro-service"


`dcname`

The name that will be given to the tag by the system and will be presented in the Coralogix tags section

##### Optional

`dctimestamp` - Optional

A timestamp in the format `yyyy-mm-dd:HH:mm`




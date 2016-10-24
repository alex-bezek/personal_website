# README

## Overview
This rails app is meant to host my personal website along with show off and store any configuration and setup I have learned and like to implement in my own setup. From a technical standpoint, its meant to be a point of reference for any setup I wish to copy to a new project in the future.

### Assets
###### Webpack
dev/production

###### Transpiling
transpiling/scss

###### Modules + Framework
Modules and bourbon

### Docker
Containers are the way of the future and make deploying to the cloud even easier. I have used alpine to minimize size and for security concerns. It takes a bit more effort having to add particular packages and build dependencies. Build the docker container with

`docker build -t personal_website .`

### Continuous Integration
N/A

### Development
guard

### Testing

Unit Testing and Linting, all in 1 build file

###### Unit Testing
Rspec

###### Linting
Rubocop

###### All in 1 build file
build.sh

### Environment Variables
* RAILS_ENV : used to set the rails environment to production mode when deploying
* SECRET_KEY_BASE : required when running in production mode

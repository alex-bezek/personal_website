# README

## Overview
This rails app is meant to host my personal website along with show off and store any configuration and setup I have learned and like to implement in my own setup. From a technical standpoint, its meant to be a point of reference for any setup I wish to copy to a new project in the future.

### Assets
Assets are not managed in the traditional rails way of sprockets. Instead I'm using webpack along with asset:precompile for all assets.

###### Webpack
In dev mode, assets are watched by webpack and served out of the devserver on port 8080. Asset paths are set to pull from 8080 in development.rb. In production mode you can run `npm run webpack` to generate bundles, then `bundle exec rake assets:precompile` to save the fingerprinted files to public.

###### Transpiling
Wepack watchs our stylesheets and javascript files. It allows us to use special loaders as well. So the stylesheets are written in scss, and the javascript is ES6. Webpack handles transpiling these assets and bundling them up.

###### Framework
The css framework I went with is bourbon. Its not a true framework but rather is a grid system with a lot of sass mixins. The point is to not rely on pre-built templates and instead be forced to write a lot of my own frontend.

### Docker
Containers are the way of the future and make deploying to the cloud even easier. I have used alpine to minimize size and for security concerns. It takes a bit more effort having to add particular packages and build dependencies. Build the docker container with

`docker build -t personal_website .`

### Continuous Integration
N/A

### Development
After running `bin/setup` just run `bundle exec guard` to launch guard and it will take care of everything. The rails server and webpack server start. All files are watched, and you get terminal notifications.

### Environment Variables
* RAILS_ENV : used to set the rails environment to production mode when deploying
* SECRET_KEY_BASE : required when running in production mode
* RAILS_SERVE_STATIC_FILES : Configures when in production mode if rails should serve the static assets from its public folder

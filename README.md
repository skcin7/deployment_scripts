# deployment_scripts

Scripts I use for deployment of my apps (web apps, PHP APIs, Swift iOS apps, etc) to deploy from my local development environment to a production environment.

...and yes, I use this for deployment for these deployment scripts as well. :)

## Usage

`$ deploy.sh`

## Add to .bash_profile

I place these scripts in `~/.sh/` and add the directory to my `.bash_profile` with `export PATH=${PATH}:$HOME/.sh/deployment_scripts` so that I can simply call `deploy.sh` for no matter what project I happen to be working on. The deployment script is designed to support all sorts of various projects, even projects for completely different platforms (such as PHP web applications or Swift iOS apps).
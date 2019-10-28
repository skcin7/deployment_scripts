# deployment_scripts

Scripts I use for deployment of my apps from my local development environment to a production environment.

My deployment script is designed to support all sorts of various projects, even projects for completely different types and platforms (such as PHP web applications, Swift iOS apps, etc).

This is my script which works for what I need, which may or may not work for you in your projects. Feel free to examine the code and make modifications as needed, compare to your own deployment (hopefully you're using them!), for your own projects.

...and yes, this is what I use to deploy even this deployment repository. :) (Yo dawg, I heard you like deployment scripts so I made a deployment script for your deployment so that you can deploy when you need your deployment.)

## Usage

`$ deploy.sh`

## Add to .bash_profile

I place these scripts in `~/.sh/` and add the directory to my `.bash_profile` with `export PATH=${PATH}:$HOME/.sh/deployment_scripts`. With this, I can simply call `$ deploy.sh` no matter what project or directory I happen to be working in.
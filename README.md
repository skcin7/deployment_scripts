# deployment_scripts

My deployment scripts that I use for deployment of my apps from local development environment, to a production environment. Designed to support all sorts of various projects, even projects for completely different types and platforms (PHP web applications, Swift iOS apps, etc).

My deployment scripts work perfectly for me, which may or may not work for you as well, to varying degrees. Feel free to examine the code and make modifications as needed to suit your own projects. I encourage you to compare them against your own deployment scripts (hopefully you're using them!) and let me know any suggestions/changes you think might improve my current deployment.

...And yes, this is what I use to deploy even this deployment as well. (Obligatory: "Yo dawg, I heard you like deployment, so I made a deployment repository for your deployment scripts so that you can easily deploy when you need to deploy.") :)

## Usage

`$ deploy.sh`

## Add to .bash_profile

I place these scripts in `~/.sh/` and add the directory to my `.bash_profile` with `export PATH=${PATH}:$HOME/.sh/deployment_scripts`. With this, I can simply call `$ deploy.sh` no matter what project or directory I happen to be working in, and it works great. It's sexy.
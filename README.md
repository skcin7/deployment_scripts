# deployment_scripts

Scripts I use for deployment of my web apps (and various other apps) to become live from my local development environment to a production environment that lives on a server somewhere.

I place these scripts in `~/.sh/` and add the directory to my `.bash_profile` with `export PATH=${PATH}:$HOME/.sh/deployment_scripts` so that I can simply call `deploy.sh` for no matter what project I happen to be working on. The deployment script is designed to support all sorts of various projects, even projects for completely different platforms (such as PHP web applications or Swift iOS apps).
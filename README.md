# deployment_scripts

My deployment scripts that I use for deployment of my apps from local development environment, to a production environment. Designed to support all sorts of various projects, even projects for completely different types and platforms (PHP web applications, Swift iOS apps, etc).

My deployment scripts work perfectly for me, which may or may not work for you as well, to varying degrees. Feel free to examine the code and make modifications as needed to suit your own projects. I encourage you to compare them against your own deployment scripts (hopefully you're using them!) and let me know any suggestions/changes you think might improve my current deployment.

...And yes, this is what I use to deploy even this deployment as well. (Obligatory: "Yo dawg, I heard you like deployment, so I made a deployment repository for your deployment scripts so that you can easily deploy when you need to deploy.") :)

## Usage

`$ deploy.sh`

If you need to alter the default deployment behavior, pass additional input arguments when calling the script.

`$ deploy.sh -commit_message="Custom commit message."`

## Input arguments

The default deployment behavior may be modified by passing input arguments when calling the deployment.

For each input argument, a flag is available as a single character (prefixed by `-`) and a more descriptive textual string (prefixed by `--`) both of which have the same effect and either of which may be used and substituted based on preference/convenience.

| Flags                       | Type    | Description                                                               | Example Usage                              |
| --------------------------- | ------- | ------------------------------------------------------------------------- | ------------------------------------------ |
| -c --commit_message         | String  | Specify the commit message. A default generic one is used if none is set. | `$ deploy.sh -c="Custom commit message."`  |
| -m --minify_assets          | Boolean | Whether to minify the assets or not (defaults to false).                  | `$ deploy.sh -m=true`                      |
| -p --trigger_url_production | String  | Trigger URL to commit the deployment to the production environment.       | `$ deploy.sh -p="http://the_trigger_url"`  |
| -s --trigger_url_sandbox    | String  | Trigger URL to commit the deployment to the sandbox environment.          | `$ deploy.sh -p="http://the_trigger_url"`  |

## Add to .bash_profile

I place these scripts in `~/.sh/` and add the directory to my `.bash_profile` with `export PATH=${PATH}:$HOME/.sh/deployment_scripts`. With this, I can simply call `$ deploy.sh` no matter what project or directory I happen to be working in, and it works great. It's sexy.
**Create a fullstack app with one simple terminal command!!**

This script builds out a basic Express sever with an endpoint at /api and a connected React client all from one terminal command 

**Things To Know**

Name the project whatever you would like, this script takes one argument and that is your project name. If you do not include a project name the command will exit and ask you for a project name.

Secondly this script will create and initialize the app on your home directory. If you would like to change this, find the second command in the script `cd ~/` and put whatever file path you would like. 

Thirdly this script does require you to have a few things already set up locally. 
1. Mongo Installed 
2. Create React App Installed
3. Your Heroku set up on your local machine 
4. NPM Installed 

**To Run Locally**

Fork and clone the repo to your machine. 

CD into the repo 

```cd fullstack-express-react```

CD into bin 

```cd bin```

Give your self execute permissions. 

```chmod 755 express.sh```

Then you will be ready to go!

Run `./express.sh APPNAME` to create your full stack MERN app deployed to heroku!

APPNAME is where you will name your project. 

Once the script is finished, cd into your projects directory `cd APPNAME` and run `heroku open` to test. 

The `/` endpoint will be the React Spinning Logo and the `/api` endpoint will be a hello from the api index message.

Hope yall have fun! 


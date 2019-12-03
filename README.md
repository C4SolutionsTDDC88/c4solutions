# About

## File structure for the project
<img src="./filestructure.png">

## Download of project
1. Clone this repo. ``` git clone https://github.com/C4SolutionsTDDC88/c4solutions.git ```
2. Go into local repo. ``` cd c4solutions ```
3. Clone front-end-repo. ``` git clone https://github.com/C4SolutionsTDDC88/front-end.git ```
4. Clone back-end-repo. ``` git clone https://github.com/C4SolutionsTDDC88/back-end.git ```

## Start development server
**To be able to run the development environment one most have docker server installed and running.**
1. In a terminal see that c4solutions is your current working directory.
2. Run the command  ``` docker-compose up --build ```. *The --build flag is optional and should only be used if you have installed a new module (does not happen regularly).*

**NOTE:** At the first executing docker will need to download a lot of data. Therefore this can take up to five minutes depending on your internet speed.

## The cache in Docker
If the docker environment fails to find modules and crashes, the fault may lie with the caching in docker. To ensure this is not the problem, run the following commands:
1. ```docker-compose down```
2. ```docker-compose kill```
3. ```docker-compose up --build```

# Deployment on a server

## Prerequisite on the server environment
All the prerequisites have been fetch with sudo apt-get <package-name>

1. Docker
2. Docker-compose
3. Node
4. Nginx (For this example we have used nginx for outside port handling)

## Setup environment

1. Copy the config file from ```ngnix``` folder to ```/etc/nginx/sites-enabled``` destination on the server
2. To adjust the ports used in the project adjust variables in ```.env``` in this repository to adjust the backend ports, and ```frontend/src/environments``` to desired ports.
3. Attach wanted database to the folder ```db_data/c4db```, if no database is listed there, the script in the folder `````` 

## Deployment
1. Use git to fetch the frontend, backend, and this repository according the the filestructre above, by using ```git clone```
2. Use ```cd front-end``` and run ````npm install``` and then ```npm run build:prod```, This will package the front-end as a static file.
3. Stand in the ````c4solutions``` folder and run ```docker-compose -f docker-compose.prod.yml up --build```, add the flag ```-d``` to do this dettached. Alternativly run the command npm run deploy from the ```c4solutions```.

# Explanation of the flow
In step 2 for the 




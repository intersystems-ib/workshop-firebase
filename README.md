# workshop-firebase

Example of connectivity between FIREBASE database and InterSystems IRIS.

You can find more in-depth information in https://learning.intersystems.com.


# What do you need to install?

* [Git](https://git-scm.com/downloads)

* [Docker](https://www.docker.com/products/docker-desktop) (if you are using Windows, make sure you set your Docker installation to use "Linux containers").

* [Docker Compose](https://docs.docker.com/compose/install/)

* [Visual Studio Code](https://code.visualstudio.com/download) + [InterSystems ObjectScript VSCode Extension](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript)

  

# Setup

Build the image that we will use during the workshop:
  
```console

$ git clone https://github.com/intersystems-ib/workshop-firebase
$ cd workshop-firebase
$ docker-compose build

```
# Introduction

Firebase is a Google platform for the development of web applications, for this example we are going to create an adapter to connecto with Cloud Firestore, a NoSQL database available in Firebase.

# How to run the container?

Very easy! Just run the following command to start the IRIS instance:

```console
$ docker-compose up -d
```

# What are you going to find in this project?

* An IRIS Community installed and accesible from the [Management Portal](http://localhost:52774/csp/sys/UtilHome.csp) (user: superuser / password: sys).

* A production with a Business Service configured, this BS has a custom adapter configured to connect with a Cloud Firestore database using Embedded Python. There are two parameters to be configured:

	* KeyPath: with the path to the json file wich contains the key to access to your database
	* DocName: the name of the collection that you want to retrieve.

* A requirements.txt with the Python library necessary to connect with Firebase project.

# Attention!

* To run this project you need a Firebase account and a project created with a Cloud Firestore database created to get a json file with the key to connect.
* Check [this article](https://community.intersystems.com/post/connecting-intersystems-iris-and-firebase-cloud-firestore) from the developer community
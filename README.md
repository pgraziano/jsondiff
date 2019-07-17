# Overview

I needed a simple command line JSON diff tool that would work on both Mac and Linux.  Many required node.js which I did not want to install on my systems.  This is a simple solution that utilizes Docker and a simple bash function wrapper.


# SIMPLE EXAMPLE

Here's a basic example of how to use, see **INSTALLATION** below for initial setup.

```
jsondiff a.json b.json 
 {
-  age: 30
+  age: 31
 }
```

The command above is calling the bash function named **jsondiff**, which in turn calls the docker container named jsondiff.


# INSTALLATION

## DOCKER IMAGE

First you build the docker image.

```
docker build -t jsondiff .
```


## BASH FUNCTION

Next you define a small bash function named **jsondiff**, which makes it easy to use the docker image without having to remember all the right arguments to pass.

Place the bash function below into your **~/.bashrc** file if using linux, or in your **~/.bash_profile** file if using mac.

```
function jsondiff {
    a=$1
    b=$2
    dir=$(dirname `readlink -f $a`)
    docker run -v $dir:/f -w /f -it jsondiff $a $b
}
```

For your bash shell to see the new function, you can either source it in the current terminal with something like **source ~/.bashrc**, or simply open a new terminal. Once that is done you are ready to use **jsondiff**.


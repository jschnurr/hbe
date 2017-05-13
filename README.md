# Hydrogen Back-end (HBE)
#### Dockerized "remote kernels" for use with [Hydrogen](https://atom.io/packages/hydrogen).

[Hydrogen](https://atom.io/packages/hydrogen) offers the best of both [Jupyter Notebook](http://jupyter.org/) and [Atom](https://atom.io/). For Hydrogen to work, it
must connect to a ***kernel***, which is the execution environment for your code. Hydrogen supports a variety of kernels for Python, Node.js, and more.

Unfortunately, these kernels are difficult to setup and maintain. HBE simplifies
this task by making the most common kernel environments available with a simple `docker-compose up`.

Once HBE is started, you can use Hydrogen to connect to a ***Connect to Remote Kernel***, and you're set. You have a REPL inside Atom, executing in the environment of your choice.

## Installation

1. Clone the repo, and build the Docker containers:  
`git clone git@github.com:jschnurr/hydrogen-back-end.git`  
`docker-compose build`  
2. Configure the Hydrogen package to use HBE back-ends. The configuration section is called ***Kernel Gateways***, and should be set as follows:
``` json
[{
  "name": "HBE-Python-Data",
  "options": {
    "baseUrl": "http://localhost:8888",
    "token": "hbe_python_data_token"
  }
}]
```

## Usage  
Start the HBE services, and then connect to them with Hydrogen.  
1. From a shell:
  - Start HBE with `docker-compose up` (optionally add -d to run as daemon).
2. In Atom
  - select `Packages` / `Hydrogen` / `Connect to a Remote Kernel`.
  - choose the appropriate Gateway from the list.

`CTRL-C` (or `docker-compose down` if run as daemon) will stop the services.


## Available Kernels
- ***HBE-Python-Data*** - Python for data science and machine learning applications. Includes [Anaconda](https://hub.docker.com/r/continuumio/anaconda/) + [TensorFlow](https://www.tensorflow.org/).

... more kernels coming soon.  Send me a PR!

# Contributing
Updates, additional features or bug fixes are always welcome.

# License
The MIT License (MIT). See LICENCE file for details.

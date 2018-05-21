# MLH Localhost &ndash; Blockchain Basics: An Introduction to J.P. Morgan's Quorum

This repository contains the code for an example Quorum network for the **MLH Localhost &ndash; Blockchain Basics: An Introduction to J.P. Morgan's Quorum**.

This project is **one of two parts** required for the **Quorum** workshop. This repository contains the code to run the [Quorum Network](#quorum-network-docs) which runs the Ethereum network layer. The second part needed is [TechMarketplace](https://github.com/MLH/mlh-localhost-tech-marketplace) which runs the application layer.

### TechMarketplace [[Docs](https://github.com/MLH/mlh-localhost-tech-marketplace)]

TechMarketplace is an example application running on top of the Quorum network and allows users to buy and sell virtual hackathon gear. It demonstrates how to run an simple Ethereum application and how to write simple Smart Contracts that interact with the Ethereum-based network.

### Quorum Network [[Docs](https://github.com/MLH/mlh-localhost-quorum-network)]

[Quorum](https://github.com/jpmorganchase/quorum) is an protocol designed by JP Morgan chase to address the lack of data privacy on Ethereum platforms. With this, Quorum features a couple enhancements including private transactions/contracts, new consensus mechanims, and higher performance. It is a fork of the [go-ethereum](https://github.com/ethereum/go-ethereum) protocol and is updated with go-etherum releases.

We use Quorum as our Ethereum protocol in this project. We use a version of Quorum's [7nodes](https://github.com/jpmorganchase/quorum-examples/tree/master/examples/7nodes) example that runs several Quorum nodes in parallel using a virtual machine.

**Important note** A Quorum network must be running locally in order for the TechMarketplace application to work. This project includes instructions on how to run the Quorum network locally.

## Requirements

* Install [Docker](https://www.vagrantup.com/downloads.html) - Tool for building and managing projects through containers

**Optionally**

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Software for supporting cross-platform virtual machines
* Install [Vagrant](https://www.vagrantup.com/downloads.html) - Tool for building and managing virtual machine environments

## Installation

```sh
$ git clone git@github.com:MLH/mlh-localhost-quorum-network.git
$ cd mlh-localhost-quorum-network
```

## Docker Usage (Recommended)

This example configures several Quorum nodes, each with their own transaction manager. To get your Quorum network up and running, you need to run the Docker instance which initializes the node accounts and keystores and launch the nodes:

```sh
$ docker build -t quorum-image .    # should take 5 or so minutes
$ docker run -ti --name quorum-container -p 22000:22000 -p 22001:22001 -p 22002:22002 quorum-image
```

### Docker terminal

You can access the terminal of the Docker instance for additional control and access to the Quorum network.

```sh
$ docker run -ti --name quorum-container quorum bash
root@4211511c3968:/quorum-network#      # docker terminal
root@4211511c3968:/quorum-network# ./raft-init.sh
root@4211511c3968:/quorum-network# ./raft-start.sh
```

To stop the network you can run the `./stop.sh` script.

### Docker Cloud

You can use the `docker push` command to publish or update an image of the quorum network on Docker Hub for later use.

```sh
$ docker login    # login with your docker account
$ docker push <USERNAME>/mlh-localhost-quorum-network
```

## Vagrant Usage

This project also supports setting up a Vagrant environment containing Quorum, Constellation, and our example Quorum network. This can be used instead of using Docker to run the environment.

```sh
$ cd quorum-network
$ vagrant up 		# should take 5 or so minutes
$ vagrant ssh
```

(_macOS note_: If you get an error saying that the ubuntu/xenial64 image doesn't
exist, please run `sudo rm -r /opt/vagrant/embedded/bin/curl`. This is usually due to
issues with the version of curl bundled with Vagrant.)

To shut down the Vagrant instance, run `vagrant suspend`. To delete it, run
`vagrant destroy`. To start from scratch, run `vagrant up` after destroying the
instance.

## Commands

Inside the Quorum directory, you have access to built-in scripts:

### `raft-init.sh`

Initializes several Ethereum accounts and along with their keystores and stores the data in the `qdata/` directory.

### `raft-start.sh`

Launches the `constellation` and `geth` nodes, which make up the Quorum network. It also sends a private transaction. Once this command executes successfully, the Quorum network is running locally.

### `stop.sh`

Stops all `constellation` and `geth` nodes. When executed, the Quorum network will stop running.

All logs and temporary data will be written to the `qdata` folder. Additionally, you can see whether your nodes are running by running `ps aux | grep geth`.

**Important note**: Any account/encryption keys contained in this repository are for
demonstration and testing purposes only. Before running a real environment, you should
generate new ones using Geth's `account` tool and `constellation-node --generate-keys`.

## Additional Resources

* [Quorum](https://github.com/jpmorganchase/quorum) - Official Quorum repository
* [quorum-examples](https://github.com/jpmorganchase/quorum-examples) - Example quorum clusters
* [go-ethereum](https://github.com/ethereum/go-ethereum) - Implementation of Ethereum protocol
* [Quorum Dapp tutorial](http://truffleframework.com/tutorials/building-dapps-for-quorum-private-enterprise-blockchains) - Additional tutorial on running Quorum-based decentralized applications (dapps)
* [Quorum Wiki](https://github.com/jpmorganchase/quorum/wiki) - Additional documentation of Quorum protocol

## License

Unless otherwise stated, the code in this repo is released under the MIT
License.

```
Copyright (c) 2018 Major League Hacking, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE
```

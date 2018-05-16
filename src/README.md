# Quorum Network
[Quorum](https://github.com/jpmorganchase/quorum) is an protocol designed by JP Morgan chase to address the lack of data privacy on Ethereum platforms. With this, Quorum features a couple enhancements including private transactions/contracts, new consensus mechanims, and higher performance. It is a fork of the [go-ethereum](https://github.com/ethereum/go-ethereum) protocol and is updated with go-etherum releases.

We use Quorum as our Ethereum protocol in this project. We use a version of Quorum's [7nodes](https://github.com/jpmorganchase/quorum-examples/tree/master/examples/7nodes)  example that runs several Quorum nodes in parallel using a virtual machine. The easiest way to get started with running the examples is to use the vagrant environment ([see below](#Vagrant-Usage)).

## Vagrant Usage

This is a complete Vagrant environment containing Quorum, Constellation, and the
Quorum examples.

### Requirements

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Install [Vagrant](https://www.vagrantup.com/downloads.html)

(If you are behind a proxy server, please see https://github.com/jpmorganchase/quorum/issues/23)

### Usage
```sh
$ cd quorum-network
$ vagrant up 		# should take 5 or so minutes
$ vagrant ssh
```

(*macOS note*: If you get an error saying that the ubuntu/xenial64 image doesn't
exist, please run `sudo rm -r /opt/vagrant/embedded/bin/curl`. This is usually due to
issues with the version of curl bundled with Vagrant.)

To shut down the Vagrant instance, run `vagrant suspend`. To delete it, run
`vagrant destroy`. To start from scratch, run `vagrant up` after destroying the
instance.

## Running
This example configures several Quorum nodes, each with their own transaction manager. To get your Quorum network up and running, you need to initialize the node accounts and keystores and launch the nodes:

```sh
$ cd quorum-netork/
$ ./raft-init.sh
$ ./raft-start.sh
```

To stop the network you can run the `./stop.sh` script.

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

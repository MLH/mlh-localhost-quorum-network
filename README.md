# MLH Localhost: Intro to Ethereum apps Powered by Quorum

This repository contains the sample code for CryptoHackers an example Ethereum application built on the Quorum network for the **MLH Localhost: Intro to Ethereum apps Powered by Quorum workshop**.

This project requires two layers to be running in order to work: the Ethereum network layer and the application layer. In this project, our Ethereum network will be provided by the Quorum project by JP Morgan Chase and the application layer we will be running is called CryptoHackers.

## Requirements

  * Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Software for supporting cross-platform virtual machines
  * Install [Vagrant](https://www.vagrantup.com/downloads.html) - Tool for building and managing virtual machine environments
  * Install [NodeJS](https://nodejs.org) - Event-driven Javascript runtime environment
  * Install [NPM](https://www.npmjs.com/) - Popular package manager for JavaScript
  * Install [Truffle](http://truffleframework.com/) - Development framework for Ethereum applications

## Installation
```sh
$ git clone git@github.com:nlaz/mlh-localhost-quorum.git
$ cd mlh-localhost-quorum
```

## Quorum Network [[Docs](quorum-network)]
[Quorum](https://github.com/jpmorganchase/quorum) is an protocol designed by JP Morgan chase to address the lack of data privacy on Ethereum platforms. With this, Quorum features a couple enhancements including private transactions/contracts, new consensus mechanims, and higher performance. It is a fork of the [go-ethereum](https://github.com/ethereum/go-ethereum) protocol and is updated with go-etherum releases.

We use Quorum as our Ethereum protocol in this project. We use a version of Quorum's [7nodes](https://github.com/jpmorganchase/quorum-examples/tree/master/examples/7nodes)  example that runs several Quorum nodes in parallel using a virtual machine.

**Important note** A Quorum network must be running in order for the CryptoHacker application to work. This project includes [instructions](quorum-network/README.md) on how to run the Quorum network locally.

## CryptoHackers [[Docs](cryptohackers)]
CryptoHackers is an example application running on top of the Quorum network and allows users to buy and sell virtual hackathon gear. It demonstrates how to run an simple Ethereum application and how to write simple Smart Contracts that interact with the Ethereum-based network.

This projects also includes [instructions](cryptohackers/README.md) on how to run the CryptoHacker application locally.

## Acknowledgments

* [Quorum](https://github.com/jpmorganchase/quorum) - An Ethereum-based distributed ledger protocol with transaction/contract privacy and new consensus mechanisms.
* [Truffle](http://truffleframework.com/) - A popular development framework for Ethereum-based applications

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

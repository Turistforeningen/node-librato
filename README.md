Librato client for Node [![Build Status](https://drone.io/github.com/Turistforeningen/node-librato/status.png)](https://drone.io/github.com/Turistforeningen/node-librato/latest)
=======================

Minimal Librato client written in CoffeScript for Node.JS application for
posting matrices to Librato.

## Requirements

 * Node.JS >= 0.10

## Features

 * Post gauge update
 * Post counter update

## Install

```
npm install librato --save
```

## Usage

```javascript
librato = new LibratoClient(user, token, options)
```

### Options

* `String` prefix - metrics name prefix
* `String` source - metric source default value

### librato.measure(key, val, opts, cb)

New gauge measurement.

### librato.count(key, val, opts, cb)

New counter increment.

## [MIT license](https://raw.githubusercontent.com/Turistforeningen/node-librato/master/LICENSE)


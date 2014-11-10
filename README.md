Librato client for Node [![Build Status](https://drone.io/github.com/Turistforeningen/node-librato/status.png)](https://drone.io/github.com/Turistforeningen/node-librato/latest)
=======================

Minimal Librato client written in CoffeScript for Node.JS application for
posting matrices to Librato.

## Requirements

 * Node.JS >= 0.10

## Features

 * Gauges metrics
 * Counters metrics

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
* `String` source - default source for metrics

### librato.measure(`string` key, `number` val, `object` opts, `function` cb)

New gauge measurement.

### librato.count(`string` key, `number` val, `object` opts, `function` cb)

New counter increment.

## [MIT license](https://raw.githubusercontent.com/Turistforeningen/node-librato/master/LICENSE)

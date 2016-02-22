# HTTP for NoFlo
[![Build Status](https://secure.travis-ci.org/razueroh/noflo-http.png?branch=master)](http://travis-ci.org/razueroh/noflo-http)

This package provides utility components to create HTTP/HTTPS servers and clients in the NoFlo Node.js runtime. Based on [HTTP](https://nodejs.org/api/http.html) and [HTTPS](https://nodejs.org/api/https.html) for Node.js

## Package Installation

    npm install noflo-http --save

## Component Usage

### ConfigRequest

Create an object with a few request properties

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | href | `string` | String specifying the URL for the request. It should be of the form `'<protocol>://<hostname>:<port>/<path>?<query>'`. Supports `http` and `https` protocols
InPort | method | `string` | String specifying the request method. Defaults to `'GET'`
OutPort | url | `object` | Object with request properties

You can use [noflo-objects](https://www.npmjs.com/package/noflo-objects) to add more properties to the `url` object.

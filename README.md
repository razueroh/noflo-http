# HTTP for NoFlo
[![Build Status](https://secure.travis-ci.org/razueroh/noflo-http.png?branch=master)](http://travis-ci.org/razueroh/noflo-http) [![npm version](https://badge.fury.io/js/noflo-http.svg)](https://badge.fury.io/js/noflo-http)

This package provides utility components to create HTTP/HTTPS clients in the NoFlo Node.js runtime. Based on [HTTP](https://nodejs.org/api/http.html) and [HTTPS](https://nodejs.org/api/https.html) for Node.js

## Package Installation

    npm install noflo-http --save

## Component Usage

### ConfigRequest

Create an object with a few request properties

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | href | `string` | String specifying the URL for the request. It should be of the form `'<protocol>://<hostname>:<port>/<path>?<query>'`. It supports `http` and `https` protocols
InPort | method | `string` | String specifying the request method. Defaults to `'GET'`
OutPort | url | `object` | Object with request properties

You can use [noflo-objects](https://www.npmjs.com/package/noflo-objects) to add more properties to the `url` object.

### Headers

Add Headers to the URL object

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | url | `object` | Object with request properties
InPort | headers | `string` | String specifying the request headers. It should be of the form `'{"<field_name>":"<value>" [, ...]}'` Defaults to `'{}'`
OutPort | out | `object` | Object with request properties and headers

### ReceiveResponse

On response event

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | request | `object` | Object with request parameters
OutPort | response | `string` | Raw data received from the server
OutPort | message | `string` | Payload of the data received from the server

### SendRequest

Send request

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | url | `all` | `object` or `string`. If it is an `object`, this should have the properties described [here](https://nodejs.org/api/http.html#http_http_request_options_callback). (You can use the ConfigRequest component to build an `url` object with a few basic properties). If it is a `string`, this should be of the form `'<protocol>://<hostname>:<port>/<path>?<query>'`. Supports `http` and `https` protocols
InPort | data | `bang` | Data to write in body of the request
InPort | start | `bang` | Signal to send the request
OutPort | request | `object` | Object with request parameters

## Examples

Name | Gist | Flowhub
-----|------|--------
HTTP GET Client | [code](https://gist.github.com/razueroh/4a1c979dcc6c4716ac32) | [example](https://app.flowhub.io/#example/4a1c979dcc6c4716ac32)

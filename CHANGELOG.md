## v0.1.3: Sun Mar 01 2015 20:53:29

Major fixes:

* Request urls send to the server were rewrited


## v0.1.2: Mon Jun 23 2014 23:29:58

Major fixes:

* Universal Module Definition was setting the wrong module name
* Universal Module Definition wasn't giving the good context
* Request body are now JSON parsed when it's needed

Improvements:

* Mocha gets the spec file names via a route instead of setting it with a file process.


## v0.1.1: Tue Jun 10 2014 11:53:22

Major fixes:

* Allow `afterDelete`, `afterPost`, `afterPut` and `afterPatch` keys as parameters in the addMock method.


## v0.1.0: Mon Jun 09 2014 23:22:11

New features:

* Support of PATCH method.
* Real server request can be modified with `afterGet`, `afterDelete`, `afterPost`, `afterPut` and `afterPatch` callbacks.

Improvements:

* Update all dependendices to the latest version.
* Clean up the build process.


## v0.0.1: Thu Mar 06 2014 00:00:32

Minor fixes:

* Fix code exemple rendering in Readme file.
* Default fake request header is empty.


## v0.0.0: Sun Mar 02 2014 23:58:20

Initial version.

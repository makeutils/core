# make: utils core

Central logic for bootstrapping `make:utils` and loading the core logic.

The recommended way is to use the auto loader method which will automatically detect `curl` or `wget` in your system and use it transparently.

It is also possible to request a specific download tool with the downside of builds failing if such tool is not present in the target system.

## `curl` loader

You can either copy the following lines into your own Makefile

```make
include $(or $(wildcard .makeutils._curl),$(shell curl -sO https://raw.githubusercontent.com/makeutils/core/master/.makeutils._curl).makeutils._curl)
```

Or you can download the file [Makeutils.curlloader](./Makeutils.curlloader) into your project and include it from the Makefile

```make
include Makeutils.curlloader
```

## WIP

Starting from this point the document is no longer accurate and must be considered as work in progress.

## importing packages

Packages follow a naming convention using a package name and a version which can be a branch or tag in git.

Example for this very module

```text
https://github.com/makeutils/makeutil-bootstrap/blob/master/makeutil-bootstrap.mak
```

The package name is `bootstrap` and the version is `master`, resulting in the following pattern

```text
https://github.com/makeutils/makeutil-$(NAME)/blob/$(VERSION)/makeutil-$(NAME).mak
```

Could be imported in your make file if you use the following command after the snippet provided above for the manual bootstrap.

```make
include $(call .include,bootstrap,master)
```

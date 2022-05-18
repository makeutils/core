# make: utils core

Core logic for enabling `make:utils` in your project.

## WORK IN PROGRESS

This is work in progress and breaking changes are happening.

## Bootstrapping

You need to choose one of the available loaders. A loader is responsible of properly bootstrapping `make:utils`.

A copy of the loader you choose must be committed as part of your project, either as a separate file or copied inside your Makefile. The examples in this documentation are based on the recommendation of using a separate file for it.

### Auto loader

This is the recommended loader. It will automatically detect `curl` or `wget` in your system and use it transparently.

Download the file [Makeutils.autoloader](./Makeutils.autoloader) into your project and include it from the Makefile.

```make
include Makeutils.autoloader
```

The downside of the auto loader is that it's not a simple one-liner when compared to the specific `curl`/`wget` loaders.

You may opt to use one of the specific loaders if you know that the environment your Makefile will run can guarantee the presence of your HTTP tool of choice.

### `wget` loader

Download the file [Makeutils.wgetloader](./Makeutils.wgetloader) into your project and include it from the Makefile.

```make
include Makeutils.wgetloader
```

### `curl` loader

Download the file [Makeutils.curlloader](./Makeutils.curlloader) into your project and include it from the Makefile.

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

# make:utils core

**ATTENTION: THIS IS WORK IN PROGRESS. BREAKING CHANGES ARE STILL HAPPENING.**

Welcome! Here you will learn how to bootstrap and enable `make:utils` in your project.

The `make:utils` project is about reusability and modular composition for make files. Find out more in [makeutils.github.io](https://makeutils.github.io/).

## Initial considerations and relevant files

Integrating `make:utils` requires the introduction of a few extraneous elements into your own Makefile and project: Basically choosing and including a `make:utils` loader.

The following files in your project are of relevance for achieving this:

| File name | Type | Description |
| --- | --- | --- |
| `Makefile` | file | Your own Makefile which [includes](https://www.gnu.org/software/make/manual/html_node/Include.html) the `make:utils` loader |
| `Makeutils-*loader` | file | One of the `make:utils` loader implementations you choose, see next section. |
| `.makeutils` | folder | Created automatically, cache for storing `make:utils` modules and dependencies, it can be deleted any time |
| `.gitignore` | file | You want to ignore the `/.makeutils/` folder |

## Available loaders

A loader routine is a file you must include in your project for `make:utils` to work. You have a few options to pick from.

The difference between the loaders is which HTTP tools they support and how big they are. The more tools they support the bigger they get.

| Loader file | Lines | Supported tools |
| --- | --: | --- |
| [`Makeutils-autoloader`](./Makeutils-autoloader) | 15 | `wget`, `curl` |
| [`Makeutils-curlloader`](./Makeutils-curlloader) | 4 | `curl` |
| [`Makeutils-wgetloader`](./Makeutils-wgetloader) | 4 | `wget` |

Save the file in the same folder where your Makefile resides, either using the original name or something like `Makeutils-loader` and proceed to include it from your Makefile.

```make
include Makeutils-loader
```

## TODO

- create dependency file
- create example project
- import it
- run and explain result
- explain modules
- explain packages

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

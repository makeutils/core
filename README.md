# makeutil-bootstrap

Central logic for bootstrapping `makeutils` and loading the core logic.

In this very first version you need to manually copy and paste the correct bootstrap script depending on the intended http transfer tool of your preference.

Supported tools are

- `curl`
- `wget` (planned)

## General logic of the template

```make
_:=$(or $(wildcard $(THE_FILE)), $(shell $(FETCH_FILE_COMMAND)))
include $(THE_FILE)
```

## Using curl

```make
_:=$(or $(wildcard makeutils.bootstrap-master), $(shell curl -so makeutils.bootstrap-master https://raw.githubusercontent.com/makeutils/makeutil-bootstrap/master/makeutil-bootstrap.mak))
include makeutils.bootstrap-master
```

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

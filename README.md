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

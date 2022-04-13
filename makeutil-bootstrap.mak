# $(1) source URL
# $(2) target file
__MAKEUTIL_DOWNLOAD=$(shell curl -so "$(2)" "$(1)")

# $(1) package name
# $(2) version/tag/branch
__MAKEUTIL_URL=https://raw.githubusercontent.com/makeutils/makeutil-$(1)/$(2)/makeutil-$(1).mak
__MAKEUTIL_FILENAME=makeutils.$(1)-$(2)

# $(1) package name
# $(2) version/tag/branch
.include=$(or $(wildcard $(call __MAKEUTIL_FILENAME,$(1),$(2))), $(call __MAKEUTIL_DOWNLOAD,$(call __MAKEUTIL_URL,$(1),$(2)),$(call __MAKEUTIL_FILENAME,$(1),$(2)))$(call __MAKEUTIL_FILENAME,$(1),$(2)))


bootstrap.test:
	@echo target: $@


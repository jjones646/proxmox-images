
BUILDR = "$(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))"
IMAGES = debian-8.0-standard-joncjones-base
TARGET = $(IMAGES)
NETSHARE_ROOT = /netshare

.PHONY: $(TARGET)

$(TARGET):
	@echo "Building $@"
	-@mkdir -p run
	@cd "$@" && $(MAKE) TARGET_IMAGE="$@" NETSHARE="$(NETSHARE_ROOT)" PARENTPATH="$(BUILDR)"

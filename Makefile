maDEP := $(shell command -v dep 2> /dev/null)

VERSION := $(shell echo $(shell git describe --tags) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')
CAT := $(if $(filter $(OS),Windows_NT),type,cat)

# process linker flags
ifeq ($(VERSION),)
    VERSION = $(COMMIT)
endif

ldflags = -X github.com/cmdpos/cmapp/vendor/github.com/cosmos/cosmos-sdk/version.Version=$(COMMIT) \
  -X github.com/cmdpos/cmapp/vendor/github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT) \
  -X github.com/cmdpos/cmapp/vendor/github.com/cosmos/cosmos-sdk/version.VendorDirHash=null \
  -X github.com/cmdpos/cmapp/vendor/github.com/cosmos/cosmos-sdk/version.BuildTags=gcc

ldflags += $(LDFLAGS)
ldflags := $(strip $(ldflags))

BUILD_FLAGS := -ldflags '$(ldflags)'

get_tools:
ifndef DEP
	@echo "Installing dep"
	go get -u -v github.com/golang/dep/cmd/dep
else
	@echo "Dep is already installed..."
endif


all: install

install:
	CGO_LDFLAGS="-lsnappy" go install -v $(BUILD_FLAGS) -tags "$(BUILD_TAGS) gcc" ./cmd/gaia/cmd/gaiad
	CGO_LDFLAGS="-lsnappy" go install -v $(BUILD_FLAGS) -tags "$(BUILD_TAGS) gcc" ./cmd/gaia/cmd/gaiacli


installnsd:
	go install ./cmd/nsd
	go install ./cmd/nscli

format:
	find . -name '*.go' -type f -not -path "./vendor*" -not -path "*.git*" -not -path "./client/lcd/statik/statik.go" | xargs gofmt -w -s


.PHONY: build

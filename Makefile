.PHONY: help install build test fmt fmt-check snapshot clean

help:
	@echo "Available commands:"
	@echo "  make install    Initialize Git submodules"
	@echo "  make build      Compile contracts"
	@echo "  make test       Run tests"
	@echo "  make fmt        Format Solidity files"
	@echo "  make fmt-check  Check formatting without changing files"
	@echo "  make snapshot   Record gas usage"
	@echo "  make clean      Remove Foundry build artifacts"

install:
	git submodule update --init --recursive

build:
	forge build --sizes

test:
	forge test -vvv

fmt:
	forge fmt

fmt-check:
	forge fmt --check

snapshot:
	forge snapshot

clean:
	forge clean
bootstrap:
	./build-static-python.sh

build:
	cargo build --target=x86_64-unknown-linux-musl

run:
	cargo run --target=x86_64-unknown-linux-musl

.PHONY: bootstrap build run
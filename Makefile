build:
	cargo build --target=x86_64-unknown-linux-musl

run:
	cargo run --target=x86_64-unknown-linux-musl

.PHONY: build run
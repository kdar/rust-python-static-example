# rust-python-static-example

> Example of using python embedded in rust and compiled statically

This is just a quick example of how to statically compile rust with musl and embed the python interpreter.

## Installation

### Requirements

* Linux
* Rust (tested on rustc 1.25.0-nightly (0c6091fbd 2018-02-04))

```sh
git clone https://github.com/kdar/rust-python-static-example
cd rust-python-static-example
make bootstrap
make run
```

## License

Distributed under the MIT license. See `LICENSE` for more information.

## Contributing

1.  Fork it (<https://github.com/kdar/rust-python-static-example/fork>)
2.  Create your feature branch (`git checkout -b feature/fooBar`)
3.  Commit your changes (`git commit -am 'Add some fooBar'`)
4.  Push to the branch (`git push origin feature/fooBar`)
5.  Create a new Pull Request

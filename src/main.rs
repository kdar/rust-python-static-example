extern crate pyo3;

use pyo3::{PyResult, Python};

fn main() {
  let gil = Python::acquire_gil();
  run(gil.python()).unwrap();
}

fn run(py: Python) -> PyResult<()> {
  match py.run(include_str!("main.py"), None, None) {
    Ok(_) => (),
    Err(e) => {
      e.print(py);
    }
  }

  Ok(())
}

import gleam/iterator
import gleeunit
import gleeunit/should

import programming_problems

pub fn main() {
  gleeunit.main()
}

pub fn neareast_larger_seq_test() {
  let res =
    programming_problems.nearest_larger_value([1, 2, 3, 4, 5])
    |> iterator.from_list
  res |> iterator.at(0) |> should.equal(Ok(2))
  res |> iterator.at(1) |> should.equal(Ok(3))
  res |> iterator.at(6) |> should.be_error
}

pub fn neareast_larger_hoc_test() {
  let res =
    programming_problems.nearest_larger_value([
      9, 2, 4, 7, 5, 1, 8, 9, 6, 3, 5, 8,
    ])
    |> iterator.from_list
  res |> iterator.at(0) |> should.equal(Ok(-1))
  res |> iterator.at(1) |> should.equal(Ok(4))
  res |> iterator.at(2) |> should.equal(Ok(7))
  res |> iterator.at(3) |> should.equal(Ok(8))
  res |> iterator.at(4) |> should.equal(Ok(8))
  res |> iterator.at(5) |> should.equal(Ok(8))
  res |> iterator.at(7) |> should.equal(Ok(-1))
  res |> iterator.at(12) |> should.be_error
}

pub fn neareast_larger_worst_test() {
  let res =
    programming_problems.nearest_larger_value([8, 7, 6, 5, 4, 3, 2, 1, 9])
    |> iterator.from_list
  res |> iterator.at(0) |> should.equal(Ok(9))
  res |> iterator.at(1) |> should.equal(Ok(9))
  res |> iterator.at(2) |> should.equal(Ok(9))
  res |> iterator.at(3) |> should.equal(Ok(9))
  res |> iterator.at(4) |> should.equal(Ok(9))
  res |> iterator.at(5) |> should.equal(Ok(9))
  res |> iterator.at(7) |> should.equal(Ok(9))
  res |> iterator.at(8) |> should.equal(Ok(-1))
  res |> iterator.at(9) |> should.be_error
}

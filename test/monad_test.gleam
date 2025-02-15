//// Test module for cat/monad.gleam

import cat/monad.{Writer, fish, return}
import gleam/string
import gleeunit/should

/// Testing the writer type, fish function (composition) and return (identity).
pub fn writer_test() {
  let up_case = fn(s: String) { Writer(string.uppercase(s), "upCase ") }
  let to_words = fn(s: String) { Writer(string.split(s, " "), "toWords ") }
  let process = fish(up_case, to_words)

  process("Anna has apples")
  |> should.equal(Writer(["ANNA", "HAS", "APPLES"], "upCase toWords "))

  return(27)
  |> should.equal(Writer(27, ""))
}

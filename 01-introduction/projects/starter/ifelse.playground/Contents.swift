/// Sample code from the book, Expert Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!
/// Visit https://www.raywenderlich.com/books/expert-swift

@inlinable
func ifelse<V>(_ condition: Bool,
               _ valueTrue: @autoclosure () throws -> V,
               _ valueFalse: @autoclosure () throws -> V) rethrows -> V {
  condition ? try valueTrue() : try valueFalse()
}

func ifelseTest1() -> Int {
  if .random() {
      return 100
  } else {
      return 200
  }
}

func ifelseTest2() -> Int {
  Bool.random() ? 300 : 400
}

func ifelseTest3() -> Int {
  ifelse(.random(), 500, 600)
}

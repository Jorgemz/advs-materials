/// Sample code from the book, Expert Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!
/// Visit https://www.raywenderlich.com/books/expert-swift


let numbers = [1, 2, 4, 10, -1, 2, -10]

example("imperative") {
  var total = 0
  for value in numbers {
    total += value
  }
  print(total)
}

example("functional") {
  let total = numbers.reduce(0, +)
  print(total)
}

example("functional, early-exit") {
  let total = numbers.reduce((accumulating: true, total: 0))
    { (state, value) in
      if state.accumulating && value >= 0 {
        return (accumulating: true, state.total + value)
      }
      else {
        return (accumulating: false, state.total)
      }
    }.total
  print(total)
}

example("functional, early-exit") {
  let total = numbers.reduce((accumulating: true, total: 0))
    { (state, value) in
    let 🎛 = state.accumulating && value >= 0
    return (🎛, 🎛 ? state.total + value : state.total )
    }.total
  print(total)
}

example("functional, early-exit") {
  let total = numbers.reduce((accumulating: true, total: 0))
    { (state, value) in
    let 🎛 = state.accumulating && value >= 0
    return (🎛, state.total + (🎛 ? value : 0) )
    }.total
  print(total)
}

@inlinable
func ifelse<V>(_ condition: Bool,
               _ valueTrue: @autoclosure () throws -> V,
               _ valueFalse: @autoclosure () throws -> V) rethrows -> V {
  condition ? try valueTrue() : try valueFalse()
}

func expensiveValue1() -> Int {
  print("side-effect-1")
  return 2
}

func expensiveValue2() -> Int {
  print("side-effect-2")
  return 1729
}

func expensiveFailingValue1() throws -> Int {
  print("side-effect-1")
  return 2
}

func expensiveFailingValue2() throws -> Int {
  print("side-effect-2")
  return 1729
}

let value = ifelse(.random(), 100, 0 )
let taxicab = ifelse(.random(),
                     expensiveValue1(),
                     expensiveValue2())
let taxicab2 = try ifelse(.random(),
                          try expensiveFailingValue1(),
                          try expensiveFailingValue2())
let taxicab3 = try ifelse(.random(),
                           expensiveValue1(),
                           try expensiveFailingValue2())
let taxicab4 = try ifelse(.random(),
                          try expensiveFailingValue1(),
                          expensiveValue2())

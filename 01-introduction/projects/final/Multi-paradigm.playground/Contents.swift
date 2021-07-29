
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
  let total = numbers.reduce((accumulating: true, total: 0)) { (state, value) in
    if state.accumulating && value >= 0 {
      return (accumulating: true, state.total + value)
    }
    else {
      return (accumulating: false, state.total)
    }
  }.total
  print(total)
}

example("imperative, early-exit") {
  var total = 0
  for value in numbers {
    guard value >= 0 else { break }
    total += value
  }
  print(total)
}

example("imperative, early-exit with just-in-time mutability") {
  let total: Int = {
    // same-old imperative code
    var total = 0
    for value in numbers {
      guard value >= 0 else { break }
      total += value
    }
    return total
  }()
  print(total)
}

class Magic {
  func number() -> Int { return 0 }
}

final class SpecialMagic: Magic {
  override func number() -> Int { return 42 }
}

public var number: Int = -1

func magicTest() {
  let specialMagic = SpecialMagic()
  let magic: Magic = specialMagic
  number = magic.number()
    print(number)
}
magicTest()

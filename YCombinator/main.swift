//
//  main.swift
//  YCombinator
//
//  Created by k on 2021/11/1.
//

import Foundation

func K<A, B>(_ x: A) -> (B) -> A { return {_ in x}}

func S<A, B, C>
(_ x: @escaping (A) -> (B) -> C) -> (@escaping (A) -> B) -> (A) -> C {
  return { y in
    return { z in
     (x(z)) (y (z))
    }
  }
}

func I<A, B>(_ x: A, _:B) -> A {
  let k: (A) -> (@escaping (B) -> A) -> A = K
  let k1: (A) -> (B) -> A = K
  let s: (@escaping (A) -> (@escaping (B) -> A) -> A) -> (@escaping (A) -> ((B)-> A)) -> (A) -> A = S
  return s(k)(k1)(x)
}


func Y<A>(_ f: @escaping ( @autoclosure () -> A) -> A) -> A {
  return f(Y(f))
}

func Y_<A, B>(_ f: @escaping (@escaping (B) -> A) -> (B) -> A )
-> (B) -> A {
  return { (x:B) in f(Y_(f))(x) }
}

print("hihihi")

let fibonacci = Y_({ f in
  return { (a: Int) in
    return { (b: Int) in
      return { (x: Int) in
        x == 0 ? a : f(b) (a + b) (x - 1)
      }
    }
  }
})(0)(1)

print("fibonacci of 10 is \(fibonacci(10))")

let factorial = Y_({ f in
  return { (acc: Int) in
      return { (x: Int) in
        x == 0 ? acc : f (acc * x) (x - 1)
      }
  }
})(1)
  
print("factorial of 5 is \(factorial(5))")


print(I("12312",0))

print("Hello, World!")


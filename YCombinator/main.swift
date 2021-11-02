//
//  main.swift
//  YCombinator
//
//  Created by k on 2021/11/1.
//

import Foundation

//func K<A, B>(_ x: A) -> (B) -> A { return {_ in x}}
//
//func S<A, B, C>
//(_ x: @escaping (A) -> (B) -> C) -> (@escaping (A) -> B) -> (A) -> C {
//  return { y in
//    return { z in
//     (x(z)) (y (z))
//    }
//  }
//}
//
//func I<A, B>(_ x: A, _:B) -> A {
//  let k: (A) -> (@escaping (B) -> A) -> A = K
//  let k1: (A) -> (B) -> A = K
//  let s: (@escaping (A) -> (@escaping (B) -> A) -> A) -> (@escaping (A) -> ((B)-> A)) -> (A) -> A = S
//  return s(k)(k1)(x)
//}


//func Y<A>(_ f: @escaping ( @autoclosure () -> A) -> A) -> A {
//  return f(Y(f))
//}

//func Y_<A, B>(_ f: @escaping (@escaping (B) -> A) -> (B) -> A )
//-> (B) -> A {
//  return { (x:B) in f(Y_(f))(x) }
//}
//
//func Y<A, B>(_ f: @escaping (@escaping (B) -> A) -> (B) -> A )
//-> (B) -> A {
//  return f(Y(f))
//}
//
//func Y__<A, B>(_ f: @escaping (@escaping @autoclosure () -> (B) -> A) -> (B) -> A )
//-> (B) -> A {
//  return f(Y__(f))
//}
//
//
//
//
//
//print("------------------------")
//
//let factorial__ = Y__({ g in
//  return { (acc: Int) in
//      return { (x: Int) in
//        x == 0 ? acc : g() (acc * x) (x - 1)
//      }
//  }
//})(1)(5)
//
//print("Factorail with Y__ is \(factorial__)")
//
//let fibonacci = Y_({ g in
//  return { (acc: Decimal) in
//    return { (n: Int) in
//      return { (i: Int) in
//        n == 0 ? acc : g() (acc - (  pow(-1, i) / (2 * i - 1)  )) (n - 1) (i + 1)
//      }
//    }
//  }
//})(0)(5)
//
//print("fibonacci of 10 is \(fibonacci(1))")
//
//let factorial = Y_({ g in
//  return { (acc: Int) in
//      return { (x: Int) in
//        x == 0 ? acc : g (acc * x) (x - 1)
//      }
//  }
//})(1)
//
//print("factorial of 5 is \(factorial(5))")
//
//
//print(I("12312",0))
//
//print("Hello, World!")



//func Y1<A>(_ f: @escaping (A) -> A )
//-> A { return f(Y1(f)) }

func Y2<A>(_ f: @escaping (@escaping @autoclosure () -> A) -> A )
-> A { return f(Y2(f)) }


//let factorialY2 = Y2({ g in
//  return { (acc: Int) in
//      return { (x: Int) in
//        x == 0 ? acc : g() (acc * x) (x - 1)
//      }
//  }
//})(1)(5)
//
//print("factorialY2: \(factorialY2)")

let PiY2 = Y2({ g in
  return { (acc: Decimal) in
      return { (n: Decimal) in
        return { (i: Decimal) -> Decimal in
          let numberI = NSDecimalNumber(decimal: i)
          let intI = Int(truncating: numberI)
          let temp: Decimal = pow(-1, intI) / (2 * i - 1)
          let nextN: Decimal = n - 1
          let nextI: Decimal = i + 1
          return n == 0 ? acc : g() (acc - temp) (nextN) (nextI)
        }
      }
  }
})(0)(10)(1)
print("Pi is \(PiY2 * 4)")


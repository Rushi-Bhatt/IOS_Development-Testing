//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//single line comment
/*
 Multiline
 Comment
 */
var a = 5
print(a)

var b:[String] = ["1","2","3","4","5"]
b+=["6"]

var scores = [1,2,3,4,5]
var ms = scores.map { (each) -> Int in
    return each+1
}

var sm = scores.map({$0 + 2})
print(sm)

var sf = scores.filter ({$0 != 3})
print(sf)

var sr = scores.reduce (0, {$0+$1})
print(sr)

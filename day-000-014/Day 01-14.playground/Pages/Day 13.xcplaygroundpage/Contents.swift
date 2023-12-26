//: [Previous](@previous)

import Cocoa

// Protocols

class Vehicle {
    
}

class Car {
    
}

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

func commute(distance: Int, using vehicle: Car) {
    // lots of code here
}

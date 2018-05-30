//: Playground - noun: a place where people can play

import UIKit

// https://stackoverflow.com/questions/37170203/swift-3-for-loop-with-increment
// for(int i=0;i<=10;i+=2)
let first = 40
let last = 20
let interval = -2
var n = 0
for f in stride(from: first, through: last, by: interval) {      // <= : through, < : to
    print(f,terminator:" ")
} // 0 2 4 6 8 10

print("\n")


// 함수
print("------  함수 설명 (입출력 없는 기본형태)-----")
func showHello1(){
    print("Hello")
}
showHello1()

print("\n")
print("------  함수 설명 (입력만 있는 형태)-----")
func showHello2(name:String) {
    
    let message = "\(name)씨 안녕하세요!"
    print(message)
}

showHello2(name: "홍길동")

print("\n")
print("------  함수 설명 (출력만 있는 형태)-----")
func showHello3() -> String {
    
    let name = "OOO"
    
    return "\(name)씨 안녕하세요!"
}

let msgFromFunction = showHello3()
print(msgFromFunction)

print("\n")
print("------  함수 설명 (입출력이 모두 있는 형태)-----")
func showHello4(name:String) -> String {
    
    
    return "\(name)씨 안녕하세요!"
}
// let aaa = showHello4(name:"홍길동"); print(aaa)
print(showHello4(name:"홍길동"))


print("\n")
print("------  함수 설명 (입력 파라미터가 복수인 경우)-----")
func calcBMI(name:String, height:Double, weight:Double){
    let heightM  = height / 100.0
    let BMI:Double = weight / (heightM * heightM)
    print("\(name)의 BMI는 \(BMI)입니다.")
}

calcBMI(name:"홍길동", height:176.0, weight:53.0)

print("\n")
print("------  Swap 함수 -----")
// swap 함수 구현하기 call by value
func myswap(a:Int, b:Int)->(Int,Int){
    print("my swap function called")
    
    return (b,a)
}
var a=1
var b=2

(a,b) = myswap(a: a, b: b)
print("a=\(a), b=\(b)") // changed

// swap 함수 구현하기 call by reference
//swap(&a, &b) // https://developer.apple.com/documentation/swift/1540890-swap
//print("a=\(a), b=\(b)") // changed


print("\n")
print("------  재귀 함수 설명 (1~100합)-----")

func recursiveCall(n:Int)->Int{
    //print("recursiveCall received \(n)")
    if ( n == 0){
        return 0
    }else if ( n >= 100 ){
        return 100
    }else{
        return n + recursiveCall(n: n+1)
    }
}

var recursiveResult = recursiveCall(n:1)
print(recursiveResult)


print("\n")
print("------  클래스 -----")

class Car  {
    
    var number:String
    var Color:String
    var maxSpeed:Int
    var type:String
    var distance:Double
    var fuelGauge:Double
    
    init() {
        self.number = "0000"
        self.Color = "white"
        self.maxSpeed = 300
        self.type = "SUV"
        self.fuelGauge = 0
        self.distance = 0
    }
    
    func increaseDistance(dist:Double){
        self.distance += dist
    }
    
    func putFuel(fuel:Double){
        self.fuelGauge += fuel
    }
    
    func getFuelEfficiency() -> Double{
        return distance / fuelGauge
    }
}

 let myCar = Car()
 myCar.increaseDistance(dist: 100)
 myCar.putFuel(fuel: 10)

 print("\(myCar.getFuelEfficiency()) Km/l")


print("\n")
print("------  클래스 상속 -----")

class Santafe : Car{
    
    override init() {
        super.init() // must call
        self.Color = "Black"
    }
    
    override func putFuel(fuel: Double) {
        self.fuelGauge = (self.fuelGauge + fuel) * 0.8
    }
}

let mySantafe = Santafe()
mySantafe.increaseDistance(dist: 100)
mySantafe.putFuel(fuel: 10)
print("\(mySantafe.getFuelEfficiency()) Km/l")

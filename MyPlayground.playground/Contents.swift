//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//switch문
var dice = 4
switch dice {
case 1:
    print("1111")
case 2, 5, 6 :
    print("2 or 5 or 6")
default:
    var tempStr:String = String(dice)
    print("number is " + tempStr)
    print("number is \(dice) ")
}



//while 문

//var aa = 0
//var bb = 0
//while (aa < 100 && bb < 100) {
//    aa += 10
//    bb += 10
//    print("\(aa) \(bb)")
//}


//for 문
for i in 0...3{
    print (i)
}
for i in 0..<3 {
    print (i)
}
for _ in 0..<3{
    print("\n")
} //세줄 뛰우는 것


// 문제 : 1부터 100까지의 합 while 문
var a = 1
var sum = 0
while (a<=100){
    sum = sum + a
    a += 1
   // print("\(a)")
}
print("while문으로 1부터 100까지의 합은 \(sum)")


//문제 : 1부터 100까지의 합 for 문
var sum1 = 0
for i in 1...100 {
   sum1 = sum1 + i //sum1 += i
}
print("for문으로 1부터 100까지의 합은 \(sum1)")




//******************************
for _ in 1...30 { //  = for(int i=1;i<=4;i++)

    print("*", terminator:"")
}
print("")


//***
//***
//***
//***
//***
//***
//***
//**

for i in 1...30 {
    if i%4 == 0{
        print()
    }else {
        print("*", terminator:"")
    }
}


print("")
print("=====")


//*
//**
//***
//****


for i in 1...4{
    
    for _ in 1...i {
    print("*",terminator:"")
    }
    print("")
}


print("=======")


//****
//***
//**
//*
for i in (1...4).reversed(){
    
    for _ in 1...i {
        print("*",terminator:"")
    }
    print("")
}



print("")

//문제 : for문으로 구구단만들기
for i in 2...5 {
    print("\(i)단 입니다.")
    for a in 1...9{
        print("\(i) * \(a) = \(i*a)")
    }
}


// 숫자 거꾸로 프린트 하는 법
for i in (-3..<3).reversed(){ //for(int i=2;i>=-3;i--)
    print(i)
}



//03.21
//함수
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
func showHello21(num:Int) {
    print("\(num)은 숫자입니다!")
}
showHello21(num:4)



print("\n")
print("------  함수 설명 (출력만 있는 형태)-----")
func showHello3() -> String {
    
    let name = "OOO"
    
    return "\(name)씨 안녕하세요!"
}

//let msgFromFunction = showHello3()
//print(msgFromFunction)
print(showHello3())


print("\n")
print("------  함수 설명 (입출력이 모두 있는 형태)-----")
func showHello4(name:String) -> String {
    
    
    return "\(name)씨 안녕하세요!"
}
// let aaa = showHello4(name:"홍길동"); print(aaa)
print(showHello4(name:"홍길동"))



print("\n")
print("------  숫자덧셈 형태1 -----")

//return을 사용하려면 ->를 꼭 사용해야 return이 된다.

func addEx1() -> Int{
    let a = 3, b = 4
    return a+b
}
print(addEx1())


print("\n")
print("------  숫자 덧셈 형태2 -----")

func addEx2(a:Int, b:Int){
    let sum = a + b
    print(sum)
}
addEx2(a:3, b:4)

print("\n")
print("------  숫자 덧셈 형태3 -----")

func addEx3(a:Int, b:Int) -> Int {
    return a+b
}
var myresult = addEx3(a:3, b:4)
print(myresult)


print("\n")
print("------ For Loop 더하기 -----")

func myForloop(a:Int,b:Int) -> Int {
    var sum = 0
    for i in a...b {
        sum += i
    }
    return(sum)
}
print(myForloop(a: 1, b: 10))



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
a=1
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
print("------  5!을 재귀함수로 출력 ------")

//func recursiveCall1(n:Int)->Int{
//    if ( n == 0){
//        return 0
//    }else if (n >= 5){
//        return 5
//    }else{
//        return n*recursiveCall1(n: n+1)
//    }
//}
//var recursiveResult1 = recursiveCall1(n:1)
//print(recursiveResult1)

func factorial(n:Int)->Int{
    if(n == 1 ){
        return 1
    }else {
        return n*factorial(n:n-1)
    }
}
print(factorial(n:5))





print("\n")
print("------ 100~200합-----")

//func recursiveCall2(n:Int)->Int{
//    //print("recursiveCall received \(n)")
//    if ( n < 100){
//        return 0
//    }else if ( n >= 200 ){
//        return 200
//    }else{
//        return n + recursiveCall2(n: n+1)
//    }
//}
//
//var recursiveResult2 = recursiveCall2(n:100)
//print(recursiveResult2)

func recursiveCall2(start:Int,end:Int) -> Int{
    if( start == 0){
        return 0
    }else if (start >= end){
        return end
    }else{
        return start + recursiveCall2(start: start+1, end :end)
    }
}
var recursiveResult2 = recursiveCall2(start:100, end:200)
print(recursiveResult2)

print("\n")
print("------  피보나치수열 -----")

func fibo(n:Int) ->Int{
    if(n==0){
        return 0
    }else if(n==1){
        return 1
    }else {
        return fibo(n:n-1) + fibo(n:n-2)
    }
}
var fiboResult = fibo(n:10)
print(fiboResult)


print("\n")
print("------  클래스 -----")

class Car  {
    
    var number:String
    var Color:String
    var maxSpeed:Int
    var type:String
    var distance:Double
    var fuelGauge:Double
    
    init() { //초기화 함수 호출
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
    
    override init() { //재정의 함수 override
        super.init() // must call 모에서 반드시 가져와라
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

class Genesis : Car{
//    var aPrice :Int
//    self.aPrice = 0
    override init() {
        super.init()
        self.Color = "silver"
        self.number = "0001"
    }
    override func increaseDistance(dist: Double) {
        self.distance = (self.distance + dist) * 1.1
    }
//    func putPrice(price:Int){
//        self.aPrice
//    }
}

print("\n")
print("------  클래스 상속 -----")

let myGenesis = Genesis()
myGenesis.increaseDistance(dist: 100)
myGenesis.putFuel(fuel: 10)
print("\(myGenesis.getFuelEfficiency()) Km/l")
print(myGenesis.Color, myGenesis.number)



//
//  main.swift
//  swiftSyntax
//
//  Created by Terry on 15/7/29.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import Foundation

println("Hello, World!")

//储值属性和算值属性
/*
储值属性和原来OC属性一样
算值属性可以通过其它储值属性算出来


*/

class Vehicle {
    //变量给默认值 或者初始化给值，或者声明为可选类型
    var numberOfWheels = 0
    //制度属性，省略get
    var description : String {
//        get {
//        
//        return "\(numberOfWheels)"
//        }
//       
//        set {
//        
//        //通过newvalue变量返回新制
//        
//        }
        return "\(numberOfWheels)个轮子"
    }
}

let someVehicle = Vehicle()
println(someVehicle.description)


//初始化

class Bicycle: Vehicle {
   override init() {
        //父类初始化 OC 必须super init ，而swiftsuper.init()只是初始化 没必要非要调用
        super.init();
        numberOfWheels = 2
    
    }
}

let myBicycle = Bicycle()
println(myBicycle.description)


//属性覆盖
//覆盖算值属性
class Car: Vehicle {
    var speed = 0.0
    
   override init(){
    super.init()
        numberOfWheels = 4
    
    }
    override var description : String {
    
    return super.description + ", 每小时\(speed)英里"
    
    }
}

let myCar = Car()
println(myCar.description)


//属性观察
//有问题
//class ParentCar: Car {
//   override var speed = Double {
//    
//        willSet {
//        //在这里可以通过 newValue 变量返回新制
//            
//            if newValue > 65.0 {
//            println("请小心")
//            
//            }
//        
//        }
//        
//        didSet {
//        //在这里可以通过 oldValue变量返回旧值
//        
//        
//        }
//    
//    }
//}


class Conter {
    var count = 0;
    func incrementBy(amount: Int) {
    //该count 即为 self.count
    count += amount
        println(count)
    }
    
    func resetToCount(count: Int) {
    //当冲突时可以这么使用
        self.count = count;
    }
}

let myCount = Conter()
myCount.incrementBy(3)


//结构体

struct Point {
    var x, y: Double
   //修改结构体
    mutating func moveToTheRightBy(dx: Double) {
    
    x = x+dx
    }
}

struct Size {
    var width, height: Double
}

struct Rect {
    var origin:Point
    var size: Size
    //定义算值属性
    var area: Double {
    return size.width * size.height
    
    }
    
    //增加方法
    func isBiggerThanRection(other: Rect) -> Bool {
        return self.area > other.area
    
    }
    
    //也可以增加属性观察
   
    
    
}

//结构体和类的区别 类可以继承，而结构体不可以继承。结构体值传递，类 引用传递，传递对象地址

//枚举

enum Day: Int {

case Moday = 1
case TuesDay = 2

case wednesday = 3, Thursday, Friday

}

let day = Day.Friday
println(day.rawValue)
 var day1 = Day.Moday
day1 = .TuesDay

enum TrainStatus {

    //关键之
case OnTime,Delayed(Int)
    
    init(){
    
    self = OnTime
    }
    
    //可以增加算值属性
    
    var description: String {
        switch self {
        
        case .OnTime:
            return "OnTime"
        case .Delayed(let minutes):
            return "\(minutes)"
        
        default:
            return "666"
        }
    
    }
}

var status = TrainStatus()
status = .Delayed(33)
println(status.description)


//类型嵌套 类中可以嵌套枚举 结构体等 枚举 结构体类似

//扩展

extension Size {

    mutating func increaseByFactor(factor: Double) {
     width *= factor
    height *= factor
    
    }

}

extension Int {

    func repetitions(task: () ->()) {
    
        for i in 0...self {
        
        
        task()
        }
    }

}


3.repetitions({
println("sud")

})

//或者
1.repetitions(){  println("sud") }

//或者
1.repetitions{  println("sud") }

//非泛型化得站结构的结构体

//泛型化得站结构的结构体

struct Stack<T> {
    var elements = [T]()
    mutating func push(element: T) {
    elements.append(element)
    }
    
    mutating func pop()->T {
    
    
    return elements.removeLast()
    }
}

//构建一个Int类型站结构体

var intStack = Stack<Int>()
intStack.push(50)
let lastIn = intStack.pop()

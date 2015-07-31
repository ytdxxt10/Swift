//
//  main.swift
//  swiftSyntax
//
//  Created by Terry on 15/7/29.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import Foundation

println("Hello, World!")

/*
1.储值属性和算值属性
储值属性和原来OC属性一样
算值属性可以通过其它储值属性算出来
*/

class Vehicle {
    //变量给默认值 或者初始化给值，或者声明为可选类型
    var numberOfWheels = 0
    //只读属性，省略get
    var description : String {
//        get {
//        
//        return "\(numberOfWheels)"
//        }
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


//2.初始化
class Bicycle: Vehicle {
   override init() {
        //父类初始化 OC 必须super init ，而swiftsuper.init()只是初始化 没必要非要调用
        super.init();
        numberOfWheels = 2
    }
}
let myBicycle = Bicycle()
println(myBicycle.description)


/*
3.属性覆盖
覆盖算值属性
*/
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


//4.属性观察
//有问题
//class ParentCar: Car {
//   override var speed = Double {
//    
//        willSet {
//        //在这里可以通过 newValue 变量返回新制
//            
//            if newValue > 65.0 {
//            println("请小心")
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


//5.结构体

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

//6.枚举

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

//7.扩展

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

//8.非泛型化得站结构的结构体

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


/*

9.可能值类型 表示可能没有值，两种状态 没有值nil（与OC中nil不同）有值

非可能值类型不能为空
*/
var optionalNumber:Int?
optionalNumber = 6

//使用可能值

func findIndexOfString(string: String,array: [String])->Int? {
   
    for (index,value) in enumerate(array) {
    
        if value == string {
             return index
        }
    }

    return nil
}


var fruit = ["apple", "banana","pear"]
let index = findIndexOfString("banana", fruit)
//拆包前 确保 可能值不为空
if (index != nil) {
    println("I like \(fruit[index!])")

} else {
    println("NO Fruit");
}

//可能值绑定

if let indexValue = index {
    println("I like \(fruit[indexValue])")

} else {
    println("No fruit")
}


class Person {
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var buildingNumber: String?
    var streetName: String?
    var apartmentNumber: String?
}

let alex = Person()
let residence = Residence()
alex.residence = residence

let address = Address()
address.buildingNumber = "1121"
address.streetName = "St Marc"
residence.address = address


var addressNumber: Int?

if let residence = alex.residence {
    if let address = residence.address {
        if let buildingNumber = address.buildingNumber {
            if let convertedNumber = buildingNumber.toInt() {
            
                 addressNumber = convertedNumber
            }
        }
    }

}

//上述为了获得buildingNumber 太麻烦，可以使用可能值链  会自动检查是否有值

addressNumber = alex.residence?.address?.buildingNumber?.toInt()
//addressNumber 仍然为一个可能值
println(addressNumber)

//可能值练结合可能值绑定使用

if let addressNumber = alex.residence?.address?.buildingNumber?.toInt() {

 println(addressNumber)
}

enum Optional<T> {
   case None
   case Some(T)

}

/*使用可能值技术，可以安全操作一些可能没有值的便利
如果没有值 即为nil
如果有值，这个值被包装到可能值中


对可能值拆包，才可以返回内部存储的那个不是nil的值
在你确认有值的时候，在使用强制拆包运算符！
使用 if let 可能值绑定技术，可达到同时检测 和拆包的目的
可能值练（？）时一种简洁的方式去应对一串可能值
*/


/*
内存管理
swift 不支持手动内存管理
ARC 不是 垃圾回收机制
ARC时不需要该对象时立即回收，垃圾回收机制类似于定期清理

弱引用 一定是可能值类型
对可能值进行绑定会产生一个强引用

可能值链在绑定时所产生的强引用并不会被保存到下一行代码
weak 弱引用
unowned 非持有引用


对一般对象所属情况值使用强引用 比如 局部变量 对象属性

对不同生命线的对象之间的关系使用弱引用

对同生命线的反向引用使用非持有引用

当引用需要反向指回时，如果还使用强引用会产生引用回路，从而产生内存泄露

此时选择使用弱引用或非持有引用

弱引用可以为空，而飞持有引用不能为空
*/

//if let person = apt.person {
//
//Person.dingdong()
//
//}
//上面代码缩写
//apt.person?.dingdong()


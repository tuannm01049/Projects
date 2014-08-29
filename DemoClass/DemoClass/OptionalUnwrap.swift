//
//  OptionalUnwrap.swift
//  DemoClass
//
//  Created by techmaster on 8/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class Person {
    //var name: String? //non-nill property
    var name: String = ""
    var age: Int = 10 //Default value property
    var numberOfPets: Int? //nillable (optional) property
    var address: Address?
    
   init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Street {
    var buildingNo: Int?
}

class Address {
    var street: Street?
}


class OptionalUnwrap: GenericVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.testPerson()
        self.testLeg()
        //self.inRa("\(self.findIndexOfString("tuan", array: ["ngo", "manh", "tuan"]))")
        if let x = self.findIndexOfString("huy", array: ["ngo", "manh", "tuan"]) {
            self.inRa("\(x)")
        }
        else {
            self.inRa("Nil roi!!!")
        }
        self.testAddress()
        // Do any additional setup after loading the view.
    }
    
    func testPerson() {
        let cuong = Person(name: "Cuong", age: 39)
        self.inRa("\(cuong.name) has number of pets: \(cuong.numberOfPets)")
        cuong.numberOfPets = 2
        
        if let numPet = cuong.numberOfPets {
            self.inRa("\(cuong.name) has number of pets: \(numPet)")
            self.inRa("\(cuong.name) has number of pets: \(cuong.numberOfPets)")
            
        }
        else {
            self.inRa("\(cuong.name) does not have any pet")
        }
    }
    
    func testLeg() {
        let numOfLegs = ["ant" : 8, "human" : 2, "tiger" : 4, "snake" : 0] //dictionary
        
        if let legOfAnt = numOfLegs["human"] {
            self.inRa("Ant has \(legOfAnt)")
            
        }
        
        let legCat = numOfLegs["cat"]
        self.inRa("Ant has \(legCat)")
    }
    
    func findIndexOfString(string: String, array: [String]) -> Int? {
        /*
        for (index,value) in enumerate(array) {
            if value == string {
                return index
            }
            
        }*/
        for (var z = 0; z < array.count; z++) {
            if array[z] == string {
                return z
            }
        }
        return nil
    }
    
    func testAddress() {
        let cuong = Person(name: "Cuong", age: 39)
        //self.inRa("building no \(cuong.address?.street?.buildingNo)") // chaining optional
        //cuong.address?.street?.buildingNo = 10
        if let buildingno = cuong.address?.street?.buildingNo {
            self.inRa("building no = \(buildingno)")
        }
        else {
            self.inRa("hehe, Nil roi!")
        }
    }

}

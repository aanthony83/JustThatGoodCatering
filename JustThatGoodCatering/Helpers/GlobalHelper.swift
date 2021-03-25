//
//  GlobalHelper.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/12/21.
//

import Foundation
import SwiftUI


// Images


//HomeTiles

let hometile1 = HomeTile(image: "Breakfast", name: "Breakfast")
let hometile2 = HomeTile(image: "Lunch", name: "Lunch")
let hometile3 = HomeTile(image: "Dinner", name: "Dinner")
let hometile4 = HomeTile(image: "Dessert", name: "Dessert")


let allHomeTiles: [HomeTile] = [hometile1, hometile2, hometile3, hometile4]

// Services

let service1 = ServicesModal(name: "Wedding")
let service2 = ServicesModal(name: "Corporate Event")
let service3 = ServicesModal(name: "Virtual Consultation")
let service4 = ServicesModal(name: "Party")
let service5 = ServicesModal(name: "Event Catering")
let service6 = ServicesModal(name: "Birthdays")


let allServices: [ServicesModal] = [service1,service2,service3,service4,service5,service6]


// Cater Item Cell  

let sampleItem = Cater(name: "Strawberry Cheesecake", image:"https://picsum.photos/300/107", description: "This is a Description of  delicious cheesecake with strawberry Toppingsflshflerhfioenjfherlfghnelrhgerhgerhfnnewfiuyefhekjfheiufbioufiuwtfiuebiufyeiuofbyeuifybiueyfiuebyfiuebyfuieyfiuyefiuybeiufbyeiufybuieyfuibeyfuiewfoiuewbyfiuyufboiufyiueyfiubfouiyefbeuiyfbriuyfbr", category: Cater.Category.breakfast)


let sampleItem1 = Cater(name: "Sampler Cheesecake on top of strawberry", image: "https://picsum.photos/300/107", description: "These are pancakes", category: Cater.Category.dessert)

let sampleItem3 = Cater(name: "Sampler Cheesecake on top of strawberry", image: "https://picsum.photos/300/109", description: "These are pancakes", category: Cater.Category.dessert)

var allSamples = [sampleItem,sampleItem1,sampleItem3]

let array = [Cater(name: "Sampler Cheesecake", image: "Dessert", description: "This is a Description of  delicious cheesekae with strawberry Toppings", category: Cater.Category.dessert),
             Cater(name: "Pancakes", image: "https://picsum.photos/300/107", description: "Thse are pancakes", category: Cater.Category.dessert)]

let myTest = array

let groupByCategory = Dictionary(grouping:myTest) { (Cater) -> String in
    return Cater.category.rawValue
}

//Linear Gradient Ext...

extension LinearGradient {
    static let blackOpacity = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
    static let blackOpacityV2 = LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.0), Color.black.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
    static let orangeOpacityV2 = LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.75), Color.orange.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
    static let blueOpacity = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.75), Color.green.opacity(0.95)]), startPoint: .top , endPoint: .bottom)
}

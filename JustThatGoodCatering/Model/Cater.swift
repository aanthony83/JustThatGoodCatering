//
//  Cater.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/12/21.
//

import SwiftUI

struct Cater: Identifiable, Codable , Hashable {
    
    var id: String = UUID().uuidString
    var name: String
    var image: String
    var description: String
    var category:Category
    
    
    enum Category: String, CaseIterable , Codable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
        case brunch = "Brunch"
    }
    
}


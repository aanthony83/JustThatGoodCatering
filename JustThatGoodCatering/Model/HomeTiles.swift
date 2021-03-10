//
//  HomeTiles.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/13/21.
//

import Foundation

//Home Tile 
struct HomeTile: Identifiable{
    var id: String = UUID().uuidString
    var image: String
    var name: String
}

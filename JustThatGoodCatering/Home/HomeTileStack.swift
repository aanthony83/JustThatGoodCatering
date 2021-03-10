//
//  HomeTileStack.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/15/21.
//

import SwiftUI

struct HomeTileStack: View {
    
    var tiles: [HomeTile]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            // Put the Menu Items Here
            ForEach(0..<tiles.count) { index in
                HomeTileView(tiles: tiles[index])
                    .frame(width: screen.width , height: screen.height / 2.5)
                    
                    .onTapGesture {
                        // add action to navigate to another view 
                    }
            }
        }
    }
}

struct HomeTileStack_Previews: PreviewProvider {
    static var previews: some View {
        HomeTileStack(tiles: allHomeTiles)
    }
}

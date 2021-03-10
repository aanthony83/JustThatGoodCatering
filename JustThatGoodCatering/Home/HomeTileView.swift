//
//  HomeTileView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/13/21.
//

import SwiftUI

struct HomeTileView: View {
    
    var tiles: HomeTile
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        // Home Tile  
        Image(tiles.image)
            .resizable()
            .overlay(
                
                VStack{
                    
                    Spacer()
                    
                    HStack{
                        
                        Text(tiles.name).font(.title).foregroundColor(.white)
                        Spacer()
                        
                    }.padding()
                }
                
            )
    }
}




struct HomeTileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTileView(tiles: hometile2)
    }
}

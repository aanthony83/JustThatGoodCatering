//
//  CaterItem.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/14/21.
//

import SwiftUI

struct CaterItem: View {
    
    var caterItem : Cater

    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            let url = URL(string: caterItem.image)
            //Async image  
            AsyncImage(url: url!, placeholder: Text(""))
//                .frame(width: 150, height: 100)
        }
    }
}

struct CaterItem_Previews: PreviewProvider {
    static var previews: some View {
        
        
        CaterItem(caterItem: sampleItem1)
    }
}

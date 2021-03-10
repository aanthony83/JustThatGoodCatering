//
//  CaterItem.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/14/21.
//

import SwiftUI
import Kingfisher

struct CaterItem: View {
    
    var caterItem : Cater

    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            let url = URL(string: caterItem.image)
            //Async image  
//            AsyncImage(url: url!, placeholder: Text(""))
            KFImage(url!)
                .resizable()
                // .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 100)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

struct CaterItem_Previews: PreviewProvider {
    static var previews: some View {
        
        
        CaterItem(caterItem: sampleItem1)
    }
}

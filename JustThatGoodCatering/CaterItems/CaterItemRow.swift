//
//  CaterItemRow.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/14/21.
//

import SwiftUI

struct CaterItemRow: View {
    
    //    var viewModel = CaterViewModel()
    
    var catagoryName: String
    
    var food:[Cater]
    
    @Binding var foodDetailToShow: Cater?

    //Body
    //body 
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(self.catagoryName)
                .font(.callout)
                .foregroundColor(.gray)
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(self.food, id: \.id) { item in
                        CaterItem(caterItem: item)
                            .onTapGesture {
                                foodDetailToShow = item
                            }
                    }
                }
            }
        }
    }
}


struct CaterItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CaterItemRow(catagoryName: "Breakfast", food: allSamples, foodDetailToShow: .constant(nil))
    }
}

//
//  CaterImageHelper.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 3/6/21.
//

import SwiftUI

struct CaterImageHelper: View {
    var cater: Cater
    
    var body: some View {
        Image(cater.image)
            .resizable()
            .scaledToFill()
    }
}

struct CaterImageHelper_Previews: PreviewProvider {
    static var previews: some View {
        CaterImageHelper(cater: sampleItem)
    }
}


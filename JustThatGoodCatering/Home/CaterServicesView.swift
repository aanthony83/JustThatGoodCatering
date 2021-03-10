//
//  CaterServicesView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 2/5/21.
//

import SwiftUI

struct CaterServicesView: View {
    
    var serviceView: ServicesModal
    
    var body: some View {
        HStack {
            Text(serviceView.name)
                .foregroundColor(.white)
                .font(.caption)
            
        }.frame(width: 100 , height: 50)
        .background(LinearGradient.blueOpacity)
        .cornerRadius(10.0)
        .shadow(color: .white, radius: 3, x: 1.0, y: -1)
        //        .overlay(
        //                RoundedRectangle(cornerRadius: 8)
        //                    .stroke(Color.white, lineWidth: 2)
        //            )
          
    }
}

struct CaterServices_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CaterServicesView(serviceView: service1)
        }
    }
}

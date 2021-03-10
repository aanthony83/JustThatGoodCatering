//
//  CaterServiceStack.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 2/5/21.
//

import Foundation
import SwiftUI

struct CaterServiceStack: View {
    
    var service: [ServicesModal]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    
    //let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Services")
                .font(.title3)
                .foregroundColor(.gray)
                .bold()
                .padding(.bottom , 5)
            ScrollView(.horizontal , showsIndicators: false) {
                // Put the Menu Items Here
                HStack {
                    ForEach(0..<service.count) { index in
                        CaterServicesView(serviceView: service[index])
                        
                    }
                }
                
                //                LazyVGrid(columns: columns, spacing: 20) {
                //                    
                //                    ForEach(0..<service.count) { index in
                //                        CaterServicesView(serviceView: service[index])
                //                    }
                //                    
                //                }  
            }
            
        }
    }
    
    struct CaterServiceStack_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    CaterServiceStack(service: allServices)
                }
            }
        }
    }
}


//
//  MainView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 2/27/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TabView {
                HomeView()
                    .tabItem {
                        Label("", systemImage: "homekit")
                    }
                
                AboutView()
                    .tabItem {
                        Label("", systemImage: "person.crop.circle")
                    }
            }
        }
    }
}
  
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
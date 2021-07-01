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
                        Label("", systemImage: "house")
                    }
                
                AboutView()
                    .tabItem {
                        Label("", systemImage: "person.crop.circle")
                    }
                HomeView()
                    .tabItem {
                        Label("", systemImage: "gearshape")
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

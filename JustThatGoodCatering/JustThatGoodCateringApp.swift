//
//  JustThatGoodCateringApp.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/12/21.
//

import SwiftUI
import Firebase

@main
struct JustThatGoodCateringApp: App {
    
    // initialize Firebase 
    init(){
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
//            MainView()
            LoginView()
        }
    }
}

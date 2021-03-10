//
//  HomeView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/12/21.
//

import SwiftUI

struct HomeView: View {
    
    let screen = UIScreen.main.bounds
    
    @StateObject var viewModel = CaterViewModel()
    
    @State private var foodDetailToShow: Cater? = nil
    
    // Group by Category 
    var catagories: [String: [Cater]] {
        Dictionary(grouping: viewModel.caterItems ){$0.category.rawValue}
    }
    
    
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    TopImage()
                        .frame(width: screen.width)
                    
                    // List of Services
                    //                    CaterServiceStack(service: allServices)
                    //                        .padding(.bottom , 8)
                    
                    Text("Menu")
                        .font(.title2)
                    
                    ForEach(catagories.keys.sorted(), id: \String.self) { item in
                        CaterItemRow(catagoryName: item, food: self.catagories[item]!, foodDetailToShow: $foodDetailToShow)
                            .frame(height: 150)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    
                    //                HomeTileStack(tiles: allHomeTiles)
                }.foregroundColor(.white)
                .padding(.top, -110)
                
            }
            
            if foodDetailToShow != nil {
                // Movie Detail View -> Passing in the Movie to show
                DetailView(caterData: foodDetailToShow!, foodDetailToShow:  $foodDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }.onAppear() {
            self.viewModel.fetchData()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


// Top Screen Image 
struct TopImage: View {
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            Image("cater3")
                .resizable()
                .scaledToFit()
                .overlay(
                    Text("Just That Good Catering")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 30)),
                    alignment: .center
                    
                )
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient.blackOpacity)
            
        }
        
        
    }
    
}


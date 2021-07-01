//
//  HomeView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/12/21.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    let screen = UIScreen.main.bounds
    
    @StateObject var viewModel = CaterViewModel()
    
    @State private var foodDetailToShow: Cater? = nil
    @State private var showLoginView = false
    
    let user = Auth.auth().currentUser?.email
    
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
                    /* Display a Welcome Section at the top */
//                    HStack {
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text("Welcome")
//                                . font(.title)
//                                .bold()
//                                .foregroundColor(.white)
//
//                            Text("Lets book your event!")
//                        }
//
//                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
//
//                        Button(action: {} )  {
//                            Image("atl")
//                                .resizable()
//                                .renderingMode(.original)
//                                .frame(width: 50 , height: 50)
//                                .clipShape(Circle())
//                        }
//                    }.padding()
                    
                    Spacer()
                    TopImage()
                        .frame(width: screen.width)
                    
                    VStack {
                        Text("Menu")
                            .font(.title2)
                    }.animation(.spring())
                    
                    /* Log out functionality */
                    
//                    Button(action: {
//                        showLoginView.toggle()
//                    }, label: {
//                        Text("Log Out")
//                    })
//                    .fullScreenCover(isPresented: $showLoginView) {
//                        LoginView()
//                    }
                
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





//
//  DetailView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 2/12/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    var caterData: Cater
    
    let screen = UIScreen.main.bounds
    
    @Binding var foodDetailToShow: Cater?
    
    var body: some View {
        
        let url = URL(string: caterData.image)
        
        
        ZStack {
            Color.black  
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Spacer()
                    
                    Button(action: {
                        foodDetailToShow = nil

                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                            .foregroundColor(.blue)
                    })
                }.padding(5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    //Async Images Version2
//                    AsyncImage2(url: url!, placeholder: Text(""))
                    KFImage(url!)
                        .resizable()
                        // .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 250)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                    VStack {
                        Text(caterData.name)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom ,10)
                        Text(caterData.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }.padding()
                    
                }
            }
        }
    }
}

func performAfter(delay: TimeInterval,completion: @escaping () -> Void) {
DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                  completion()
                  }
                  }



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(caterData: sampleItem, foodDetailToShow: .constant(nil))
    }
}



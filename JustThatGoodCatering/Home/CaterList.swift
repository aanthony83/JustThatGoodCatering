//
//  CaterList.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/14/21.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct CaterList: View {
    
    @ObservedObject var viewModel = CaterViewModel()
    
    @State private var imageURL = URL(string:"")
            
    var body: some View {

        // Cater List 
            List(viewModel.caterItems) { cater in
                let url = URL(string: cater.image)!
                HStack {
                    AsyncImage(url: url, placeholder: Text("Loading ...."))
                    LazyVStack(alignment: .leading) {
                        Text(cater.name)
                            .font(.subheadline)
                        Text("\(cater.category.rawValue)")
                            .font(.subheadline)
                    }
                }
            }.onAppear()
            {
                self.viewModel.fetchData()
            }
    }
}

struct CaterList_Previews: PreviewProvider {
    static var previews: some View {
        CaterList()
    }
}

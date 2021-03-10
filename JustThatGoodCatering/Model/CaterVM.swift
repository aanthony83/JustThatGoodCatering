//
//  CaterVM.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/12/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import Combine


class CaterViewModel: ObservableObject, Identifiable{
    
    @Published var caterItems = [Cater]()
    
    private var db = Firestore.firestore()
    
    @Published var food : [String: [Cater]] = [:]
    
    public var allCategories: [String] {
        food.keys.map({String($0)})
    }
    
    func fetchData() {
        
        
        db.collection("cater").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            
            self.caterItems = documents.map { QueryDocumentSnapshot -> Cater in
                let data = QueryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let category = data["category"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                
                return Cater(name: name, image: image, description: description, category: Cater.Category(rawValue: category)!)
                
            }
            
        }
    }
    
    func getMenuItems() {
        
        db.collection("cater").whereField("category", isEqualTo: "Lunch")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
        
        
    }
}




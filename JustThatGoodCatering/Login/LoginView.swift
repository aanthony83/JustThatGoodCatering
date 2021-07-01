//
//  LoginView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 3/12/21.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct LoginView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        ZStack{
            
            Color.clear.background(LinearGradient.blueOpacity).edgesIgnoringSafeArea(.all)
            
            if UIScreen.main.bounds.height > 800{
                
                Home()
                
            }
            else{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Home()
                }.animation(.spring())
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                        let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                        self.status = status
                        
                    }
                }
                
            }
            
        }
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct Home : View {
    
    @State var index = 0
    
    var body : some View{
        
        VStack{
            
            // Image("logo")
            //            .resizable()
            //            .frame(width: 200, height: 180)
            
            Text("Just That Good Catering")
                .font(.system(size: 30))
                //.bold()
                .padding(.bottom, 50)
                .foregroundColor(.white)
            
            HStack{
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        self.index = 0
                    }
                    
                }) {
                    
                    Text("Existing")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                    
                }.background(self.index == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        self.index = 1
                    }
                    
                }) {
                    
                    Text("New")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                    
                }.background(self.index == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
            }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 25)
            
            if self.index == 0 {
                
                Login()
            }
            else{
                
                SignUp()
            }
            
        }
        .padding()
    }
}

struct Login : View {
    
    @State var user = ""
    @State var pass = ""
    @State var msg = ""
    @State var alert = false
    
    @State private var showingHomeView = false
    @State private var showResetPasswordView = false
    
    @State private var isSecured: Bool = true
    
    
    
    var body : some View{
        
        VStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    
                    TextField("Enter Email Address", text: self.$user).foregroundColor(.gray)
                    
                }.padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    if isSecured {
                        
                        SecureField("Password", text: self.$pass)
                    }
                    else {
                        TextField("Password", text: self.$pass)
                    }
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            
            
            Button(action: {
                
                login(email: user, password: pass) { (verified, status) in
                    if !verified {
                        self.msg = status
                        self.alert.toggle()
                    }
                    else {
                        self.showingHomeView.toggle()
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
                
            }) {
                
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                
            } .fullScreenCover(isPresented: $showingHomeView) {
                MainView()
            }
            .background(
                
                Color.blue.background(LinearGradient.blueOpacity).edgesIgnoringSafeArea(.all)
                
            )
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("OK")))
                
            }
            Button(action: {
                
                self.showResetPasswordView.toggle()
                //                                    resetPassword(email: user) { (error) in
                //                                        if user.isEmpty {
                //                                            print("input email")
                //                                            self.msg = error
                //                                            self.alert.toggle()
                //
                //                                        }
                //                                        else {
                //                                            self.showResetPasswordView.toggle()
                //                                        }
                //                                    }
            }) {
                
                Text("Forget Password?")
                    .foregroundColor(.white)
                
            }
            .fullScreenCover(isPresented: $showResetPasswordView) {
                resetPasswordView()
            }
            //            .alert(isPresented: $alert) {
            //                Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("OK")))
            //
            //            }
            .padding(.top, 20)
            
        }.foregroundColor(.black)
    }
}



struct SignUp : View {
    
    @State var user = ""
    @State var pass = ""
    @State var repass = ""
    @State var msg = ""
    @State var alert = false
    
    @State private var showingHomeView = false
    
    @State private var isSecured: Bool = true
    @State private var isReSecured: Bool = true
    
    
    
    @State var tag:Int? = nil
    
    
    var body : some View {
        
        VStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    
                    TextField("Enter Email Address", text: self.$user)
                    
                }.padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    if isSecured {
                        
                        SecureField("Password", text: self.$pass)
                    }
                    else {
                        TextField("Password", text: self.$pass)
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    if isReSecured {
                        
                        SecureField("Re-Enter", text: self.$repass)
                    }
                    else {
                        TextField("Re-Enter", text: self.$repass)
                    }
                    
                    
                    Button(action: {
                        isReSecured.toggle()
                    }
                    ) {
                        
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            
            
            
            Button(action: {
                
                signup(email: user, password: pass) { verified , status in
                    if !verified {
                        self.msg = status
                        self.alert.toggle()
                        
                    }
                    else {
                        self.showingHomeView.toggle()
                        self.tag = 1
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
                
            })
            {
                
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                
            }.fullScreenCover(isPresented: $showingHomeView) {
                HomeView()
            }
            .background(
                
                Color.blue.background(LinearGradient.blueOpacity).edgesIgnoringSafeArea(.all)
                
            )
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("OK")))
                
            }
        }.onAppear {
            user = ""
            pass = ""
            repass = ""
        }.foregroundColor(.black)
    }
}


struct resetPasswordView : View {
    
    @State var user = ""
    @State var showalert = false
    @State var msg = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body : some View {
        
        ZStack {

            Color.clear.background(LinearGradient.blueOpacity).edgesIgnoringSafeArea(.all)

            VStack {
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        
                        presentationMode.wrappedValue.dismiss()

                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                            .foregroundColor(.blue)
                    })
                }.padding(5)
                
                
                VStack {
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        
                        TextField("Enter Email Address", text: self.$user).autocapitalization(.none).keyboardType(.emailAddress)
                        
                    }.padding(.vertical, 20)
                    
                    Divider()
                    
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 25)

                Button(action: {
                    
                    Auth.auth().sendPasswordReset(withEmail: user) { (error) in
                        if error != nil {
                            self.msg = error?.localizedDescription ?? ""
                            self.showalert.toggle()
                        }
                        else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    
                })
                {
                    
                    Text("Reset Password")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                    
                }
                
                .alert(isPresented: $showalert) {
                    Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("OK")))
                    
                }
                .background(
                    
                    Color.blue.background(LinearGradient.blueOpacity).edgesIgnoringSafeArea(.all)
                    
                )
                .cornerRadius(8)
                .offset(y: -40)
                .padding(.bottom, -40)
                .shadow(radius: 15)
            }.foregroundColor(.black)
        }
    }
}

struct reserPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        resetPasswordView()
    }
}

// Function for Access Work Flow

func login(email: String , password: String, completion: @escaping (Bool, String) -> Void) {
    
    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
        if error != nil {
            completion(false,(error?.localizedDescription)!)
            return
        }
        completion(true,(authResult?.user.email)!)
    }
}

func signup(email: String , password: String, completion: @escaping (Bool, String) -> Void) {
    
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if error != nil {
            completion(false,(error?.localizedDescription)!)
            return
        }
        completion(true,(authResult?.user.email)!)
        return
    }
    
}


func resetPassword(email: String, completion: @escaping (String) -> Void) {
    
    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
        if error != nil {
            completion((error?.localizedDescription)!)
        }
        else {
            return
        }
    }
    
}


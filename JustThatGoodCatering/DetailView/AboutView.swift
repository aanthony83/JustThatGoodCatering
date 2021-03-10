//
//  AboutView.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 2/27/21.
//

import SwiftUI
import MessageUI

struct AboutView: View {
    
    let screen = UIScreen.main.bounds
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    var build = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    
    var body: some View {
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    Image("cater1")
                        .resizable()
                        .scaledToFill()
                        .frame(width:screen.width)
                    
                    Text("My Story")  
                        .font(.headline)
                        .padding(4)
                    
                    Text("Hours by Appointment Only Just That Good Catering is a minority-owned and operated catering service serving Capitol Heights, MD and surrounding towns. Whether you want Breakfast & Brunch Catering, Party Catering, Lunch Catering, a formal plated dinner or Event Catering, we can provide a menu that will be both beautiful and delectable. We specializes in making your event one to remember. Our mission statement is to exhibit God in the mix through our services and ultimately your experience. We aim to achieve happiness from each of our clients based on the manner in which we present ourselves, as well as the esteem we will hold for each event being done. Call or message us today for your consultation.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading) {
                        
                        
                        // Clickable telphone number
                        
                        Text("Call")
                            .bold()
                            .font(.headline)
                        Spacer()
                        
                        Button(action: {
                        }, label: {
                                HStack {
                                    Link("(301)775-9169", destination: URL(string: "tel:3017759169")!)
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                    Spacer()
                                    Image(systemName: "phone.connection")
                                        .font(.system(size: 20))
                                }
                        })
                        
                        Spacer()
                        Spacer()
                        
                        VStack(alignment: .leading){
                            Text("Info")
                                .bold()
                                .font(.title2)
                                .padding(.bottom, 10)
                            
                            Text("Services")
                            
                            Spacer()
                            
                            Text("Breakfast & Brunch Catering,Event Catering, Lunch Catering, Party Catering, Dinner Catering, Holiday Catering,Virtual Consultations")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        
                        
                    }.padding()
                    
                    Button(action: {
                        MailComposeViewController.shared.sendEmail()
                    }, label: {
                        Text("Book")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal, 70)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(radius: 4)
                    })
                    
                    Spacer()
                    
                    HStack {
                        Text("Version:")
                            .font(.footnote)
                        Text("\(appVersion)\(".")\(build)")
                            .font(.footnote)
                    }.padding()
                    
                    
                }.padding(.top, -50)
            }
            
            
            
        }.foregroundColor(.white)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}


// Composing Email Feature

class MailComposeViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    static let shared = MailComposeViewController()
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["daniel_thomas97@aol.com"])
            mail.setSubject("Catering Event")
            mail.setMessageBody("<p>Tell us about your Catering Event:</p>", isHTML: true)
            UIApplication.shared.windows.first?.rootViewController?.present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

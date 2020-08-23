//
//  ContentView.swift
//  wit.ai
//
//  Created by Rachael Wei on 8/18/20.
//  Copyright © 2020 Rachael. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase


//need to ask users
//bugs on device but not simulator
//remember info
struct ContentView: View {
    @State var loggedIn = false
    var body: some View {
        VStack{
            if loggedIn == false{
                VStack{
                    Text("App name here").bold()
                    login(loggedIn: $loggedIn).frame(width: 100, height: 50)
                }
            } else {
                chatbot(messages: [ChatMessage]())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct login : UIViewRepresentable {
    @Binding var loggedIn : Bool
    func makeCoordinator() -> Coordinator {
        
        return login.Coordinator(inst: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<login>) -> FBLoginButton {
        let button = FBLoginButton()
        button.permissions = ["email"]
        button.delegate = context.coordinator
        return button
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<login>) {
        
    }
    
    class Coordinator : NSObject, LoginButtonDelegate{
        var loginInstance : login
        init(inst : login){
            loginInstance = inst
        }
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil{
                print((error?.localizedDescription)!)
                return
            }
            
            if AccessToken.current != nil{
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential){ (res, er) in
                    if er != nil{
                        print((er?.localizedDescription))
                        return
                    }
                    self.loginInstance.loggedIn = true
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
            self.loginInstance.loggedIn = false
        }
        
        
    }
}

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

struct ContentView: View {
    var body: some View {
        //seeing if they appear
        VStack{
            Text("App name here").bold()
            login().frame(width: 100, height: 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct login : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        
        return login.Coordinator()
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
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
        
        
    }
}

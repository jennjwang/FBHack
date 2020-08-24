//
//  chatbot.swift
//  wit.ai
//
//  Created by Rachael Wei on 8/18/20.
//  Copyright © 2020 Rachael. All rights reserved.
//

import SwiftUI

//make space between messages smaller
//make messages and loggIn environment objects
struct chatbot: View {
//    @Binding var loggedIn : Bool
    @State var composedMessage: String = ""
    @State var messages : [ChatMessage]
    
    //change color based on person
    var body: some View {
        return VStack{
            NavigationLink(destination: ContentView()) {
                Text("Sign out!")
            }
            ScrollView {
                ForEach(messages, id: \.self) { msg in
                    chatRow(chatMessage: msg).frame(height: 50)
                }
            }
            HStack {
                TextField("Message...", text: $composedMessage).frame(minHeight: 30)
                Button(action: sendMessage){
                    Text("Send")
                }
            }.padding()
        }.frame(maxHeight: UIScreen.main.bounds.size.height)
    }
    func sendMessage(){
        //fix this later, used for testing purposes
        messages.append(ChatMessage(message: composedMessage, avatar: "A", isMe: true))
        composedMessage = ""
    }
    func recieveMessage(){
        //witai stuff
    }
}

struct chatbot_Previews: PreviewProvider {
    @State static var loggedIn = true
    static var previews: some View {
        chatbot(messages: [ChatMessage(message: "Hello world", avatar: "A", isMe: false), ChatMessage(message: "Hi", avatar: "B", isMe: true)])
    }
}

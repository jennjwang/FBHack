//
//  chatbot.swift
//  wit.ai
//
//  Created by Rachael Wei on 8/18/20.
//  Copyright © 2020 Rachael. All rights reserved.
//

import SwiftUI

struct chatbot: View {
//    @Binding var loggedIn : Bool
        var testing = [
            ChatMessage(message: "Hello world", avatar: "A", isMe: false),
            ChatMessage(message: "Hi", avatar: "B", isMe: true)
    ]
    @State var composedMessage: String = ""
    @State var messages : [ChatMessage]
    
    //change color based on person
    var body: some View {
        return VStack{
            NavigationLink(destination: ContentView()) {
                Text("Sign out!")
            }
            List {
                ForEach(messages, id: \.self) { msg in
                    chatRow(chatMessage: msg)
                }
            }
            HStack {
                TextField("Message...", text: $composedMessage).frame(minHeight: 30)
                Button(action: sendMessage){
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
        }
    }
    func sendMessage(){
        //fix this later, used for testing purposes
        if messages.count == 0{
            messages.append(testing[0])
            messages.append(testing[1])
        }
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

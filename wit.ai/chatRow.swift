//
//  chatRow.swift
//  wit.ai
//
//  Created by Rachael Wei on 8/23/20.
//  Copyright © 2020 Rachael. All rights reserved.
//

import SwiftUI

//change color based on who
//get the avatar picture
struct chatRow: View {
    var chatMessage: ChatMessage
    var body: some View {
        HStack {
            Group {
                if !chatMessage.isMe {
                    HStack {
                        Group {
                            Text(chatMessage.avatar)
                            Text(chatMessage.message)
                                .bold()
                                .padding(10)
                                .foregroundColor(Color.white)
                                //.background(chatMessage.color)
                                .cornerRadius(10)
                        }
                    }
                } else {
                    HStack {
                        Group {
                            Spacer()
                            Text(chatMessage.message)
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(10)
                                //.background(chatMessage.color)
                                .cornerRadius(10)
                            Text(chatMessage.avatar)
                        }
                    }
                }
            }
        }
    }
}

struct chatRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("chatRow")
        
    }
}

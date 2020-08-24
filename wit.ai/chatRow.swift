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
        return HStack {
            Group {
                if !chatMessage.isMe {
                    HStack {
                        Group {
                            Text(chatMessage.message)
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(10)
                                .background(Color(UIColor.lightGray))
                                .cornerRadius(10)
                            Spacer()
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
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }.padding()
    }
}

struct chatRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("chatRow")
        
    }
}

//
//  Message.swift
//  wit.ai
//
//  Created by Rachael Wei on 8/23/20.
//  Copyright © 2020 Rachael. All rights reserved.
//

import Foundation
import UIKit

//one chat message
struct ChatMessage: Hashable{
    static func == (lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        return lhs.message == rhs.message && lhs.avatar == rhs.avatar
    }
    var message: String
    var avatar: String
    var isMe: Bool
}

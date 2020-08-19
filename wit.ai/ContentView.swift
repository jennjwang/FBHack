//
//  ContentView.swift
//  wit.ai
//
//  Created by Rachael Wei on 8/18/20.
//  Copyright © 2020 Rachael. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //seeing if they appear
        VStack{
            login()
            chatbot()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//  MessagesView.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var store: MessagesStore
    
    var body: some View {
        
        VStack(alignment: .leading) {
            List {
                ForEach(store.messages, id: \.self) { msg in
                    MessageView(message: msg)
                        .listRowSeparator(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
        }.padding(0)
    }
}

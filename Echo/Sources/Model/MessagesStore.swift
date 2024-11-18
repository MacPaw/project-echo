//
//  Messages.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import Foundation

final class MessagesStore: ObservableObject {
    
    @Published var messages: [Message] = []
    
    func add(message: Message) {
        messages.append(message)
    }
}

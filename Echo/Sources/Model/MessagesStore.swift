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

extension MessagesStore {
    
    static func buildForPreview() -> MessagesStore {
        let store = MessagesStore()
        store.add(message: .userPrompt("Convert to Objective-C"))
        store.add(message: .thinking("Sure. Updating..."))
        store.add(message: .textAnswer("Done"))
        return store
    }
}

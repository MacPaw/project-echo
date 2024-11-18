//
//  Agent.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import Foundation
import OpenAI

final class Agent {
    
    enum AgentError: Error {
        case emptyResult
    }
    
    private let openAI = OpenAI(apiToken: "")
    private let systemMessage = "You are an assistant that performs text and code operations. Return only the result, without any additional explanations. Do not add language identifiers."
    
    func query(inputString: String, prompt: String, reply: @escaping ((Result<String, Error>) -> Void)) {
        let input = "\(inputString)\n\n---------\n\n\(prompt)"
        openAI.chats(query: .init(messages: [
            .assistant(.init(content: systemMessage)),
            .user(.init(content: .init(string: input)))
        ], model: .gpt4_o)) { result in
            switch result {
            case .success(let chatResult):
                guard let firstMessage = chatResult.choices.first?.message.content?.string else {
                    reply(.failure(AgentError.emptyResult))
                    return
                }
                let trimmed = firstMessage
                    .replacingOccurrences(of: "```swift", with: "")
                    .replacingOccurrences(of: "```", with: "")
                
                reply(.success(trimmed))
            case .failure(let error):
                reply(.failure(error))
            }
        }
    }
}

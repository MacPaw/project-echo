//
//  MessageView.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        
        switch message {
        case .userPrompt(let string):
            HStack {
                Spacer()
                Text(string)
                    .padding(10)
                    .foregroundColor(Color.primary)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
        case .thinking(let string):
            HStack {
                Text(string)
                    .padding(.vertical, 10)
                    .font(.callout)
                    .italic()
                    .foregroundColor(.secondary)
                Spacer()
            }
        case .textAnswer(let string):
            HStack {
                Text(string)
                    .padding(.vertical, 10)
                    .italic()
                    .foregroundColor(.primary)
                Spacer()
            }
        case .appFound(let application):
            
            HStack {
                if let image = application.icon {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                }
                Text("Using \(application.name)")
                        .foregroundColor(Color.primary)
            }
            .padding(8)
            .background(Color.black.opacity(0.2).clipShape(RoundedRectangle(cornerRadius:8)))
        }
    }
}

#Preview {
    MessageView(message: .userPrompt("Convert to Objective-C"))
        .padding(20)
}

//
//  Message.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import SwiftUI

enum Message: Hashable {
    
    case userPrompt(String)
    case thinking(String)
    case textAnswer(String)
    case appFound(Application)
}

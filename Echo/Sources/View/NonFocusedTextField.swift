//
//  NonFocusedTextField.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import AppKit

class NonFocusedTextField: NSTextField {
    
    override var focusRingType: NSFocusRingType {
        get { .none }
        set {}
    }
}


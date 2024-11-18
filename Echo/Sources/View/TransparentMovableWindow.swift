//
//  MovableWindow.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import AppKit

final class TransparentMovableWindow: NSWindow {
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        self.isOpaque = false
        self.backgroundColor = .clear
    }
    
    override var isMovableByWindowBackground: Bool {
        get { true }
        set {}
    }
}

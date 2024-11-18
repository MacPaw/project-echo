//
//  Application.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import AppKit

struct Application: Hashable {
    
    let bundleId: String?
    let name: String
    let pid: Int32
    let icon: NSImage?
    
    init(runningApplication: NSRunningApplication) {
        self.bundleId = runningApplication.bundleIdentifier
        self.name = runningApplication.localizedName ?? "Unknown application"
        self.pid = runningApplication.processIdentifier
        self.icon = runningApplication.icon
    }
}

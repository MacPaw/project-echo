//
//  FrontmostApp.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import AppKit

final class FrontmostApplication: NSObject {
        
    private var observer: NSObjectProtocol?
        
    deinit {
        stopObserving()
    }
    
    func startObserving(onChange: ((Application) -> Void)?) {
        observer = NSWorkspace.shared.notificationCenter.addObserver(
            forName: NSWorkspace.didActivateApplicationNotification,
            object: nil,
            queue: .main
        ) { notification in
            if let userInfo = notification.userInfo, let app = userInfo[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication {
                print("Frontmost application changed to: \(app.localizedName ?? "Unknown")")
                onChange?(Application(runningApplication: app))
            }
        }
    }
    
    func stopObserving() {
        if let observer = observer {
            NSWorkspace.shared.notificationCenter.removeObserver(observer)
        }
    }
}

//
//  AccessibleApplication.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import Foundation
import Accessibility
import ApplicationServices

final class AccessbilableApplication: NSObject {
    
    private let accessibility = Accessibility()
    private let application: Application
    
    init(application: Application) {
        self.application = application
    }
    
    func fetchEditor() -> AccessibilityItem? {
        accessibility.requestAccess()
        
        let app: AXUIElement = .from(pid: application.pid)
        let items = accessibility.searchItem(from: app, criteria: {
            if $0.role == "AXTextArea" {
                return true//$0.isFocused
            }
            return false
        }).filter { $0.value.isEmpty == false && $0.value.replacingOccurrences(of: " ", with: "").isEmpty == false }
        return items.first
    }
}

final class Accessibility {
    
    func requestAccess() {
        // Specify a dialog alert text
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        
        // Ask for permission
        let accessEnabled = AXIsProcessTrustedWithOptions(options)
        
        if accessEnabled == true {
            print("access granted")
        } else {
            print("access denied")
        }
    }
    
    func searchItem(from element: AXUIElement, criteria: (AccessibilityItem) -> Bool) -> [AccessibilityItem] {
        let item = AccessibilityItem(element: element)
        if criteria(item) {
            return [item]
        }
        let swiftChildren = element.children ?? []
        let rr = swiftChildren.map { childElement in
            return searchItem(from: childElement, criteria: criteria)
        }.flatMap{ $0 }
        return rr
    }
}

extension AXUIElement {
    
    static func from(pid: pid_t) -> AXUIElement { AXUIElementCreateApplication(pid) }
    
    var windows: [AXUIElement]? { value(forAttribute: kAXWindowsAttribute) }
    
    var children: [AXUIElement]? { value(forAttribute: kAXChildrenAttribute) }
    
    func value<T>(forAttribute attribute: String) -> T? {
        var attributeValue: CFTypeRef?
        AXUIElementCopyAttributeValue(self, attribute as CFString, &attributeValue)
        return attributeValue as? T
    }
}

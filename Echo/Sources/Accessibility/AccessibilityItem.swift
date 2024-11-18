//
//  AccessibilityElement.swift
//  AIbility
//
//  Created by Sergii Kryvoblotskyi on 06/11/2023.
//

import Foundation
import AppKit
import Accessibility

class AccessibilityItem {
    
    let element: AXUIElement
    let role: String
    let value: String
    let placeholder: String
    let title: String
    let frame: CGRect
    let isFocused: Bool
    let isEditable: Bool
    
    init(element: AXUIElement) {
        self.element = element
        
        var elementRole: AnyObject?
        var elementValue: AnyObject?
        var elementTitle: AnyObject?
        var elementPlaceholder: AnyObject?
        var elementSize: CFTypeRef?
        
        // Get the role/type of the element
        AXUIElementCopyAttributeValue(element, kAXRoleAttribute as CFString, &elementRole)
        
        // Attempt to get the title of the element
        AXUIElementCopyAttributeValue(element, kAXTitleAttribute as CFString, &elementTitle)
        
        // Attempt to get the value of the element
        AXUIElementCopyAttributeValue(element, kAXValueAttribute as CFString, &elementValue)
        
        // Attempt to get the placeholder of the element
        AXUIElementCopyAttributeValue(element, kAXPlaceholderValueAttribute as CFString, &elementPlaceholder)
        
        // Attempt to get the value of the element
        AXUIElementCopyAttributeValue(element, kAXSizeAttribute as CFString, &elementSize)
        
        // Attempt to get the value of the element
        AXUIElementCopyAttributeValue(element, kAXFocusedAttribute as CFString, &elementSize)

            
        // Convert to swift types and print
        let roleString = elementRole as? String ?? "Unknown"
        let valueString = elementValue as? String ?? "No value"
        let valueTitle = elementTitle as? String ?? "No title"
        let valuePlaceholder = elementPlaceholder as? String ?? "No placeholder"

        
        var position: AnyObject? = nil
        var actPoint = CGPoint.zero
        if AXUIElementCopyAttributeValue(element, kAXPositionAttribute as CFString, &position) == .success {
            var actualPoint = CGPoint()
            AXValueGetValue(position as! AXValue, AXValueType.cgPoint, &actualPoint)
            actPoint = actualPoint
        }
        
        var size: AnyObject? = nil
        var actSize = CGSize.zero
        if AXUIElementCopyAttributeValue(element, kAXSizeAttribute as CFString, &size) == .success {
            var actualSize = CGSize()
            AXValueGetValue(size as! AXValue, AXValueType.cgSize, &actualSize)
            actSize = actualSize
        }
        let frame = CGRect(origin: actPoint, size: actSize)
        self.role = roleString
        self.value = valueString
        self.title = valueTitle
        self.frame = frame
        self.placeholder = valuePlaceholder
        self.isFocused = AccessibilityItem.isElementFocused(element)
        self.isEditable = AccessibilityItem.isElementEditable(element)
    }
    
    func updateValue(_ string: String) {
        let cfString: CFString = string as CFString
        AXUIElementSetAttributeValue(self.element, kAXValueAttribute as CFString, cfString)
    }
    
    private class func isElementFocused(_ element: AXUIElement) -> Bool {
        var focused: AnyObject?
        let result = AXUIElementCopyAttributeValue(element, kAXFocusedAttribute as CFString, &focused)
        
        // Check the result and convert the value to a Bool
        if result == .success, let isFocused = focused as? Bool {
            return isFocused
        } else {
            // Handle error or return false if attribute not available
            return false
        }
    }
    
    private class func isElementEditable(_ element: AXUIElement) -> Bool {
        var editable: AnyObject?
        let result = AXUIElementCopyAttributeValue(element, kAXIsEditableAttribute as CFString, &editable)
        // Check the result and convert the value to a Bool
        if result == .success, let isEditable = editable as? Bool {
            return isEditable
        } else {
            // Handle error or return false if attribute not available
            return false
        }
    }
}

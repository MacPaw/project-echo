//
//  AccessibilityObservation.swift
//  AIbility
//
//  Created by Sergii Kryvoblotskyi on 06/11/2023.
//

import Foundation
import AppKit

final class AccessibilityObservation {
    
    let observer: AXObserver
    let observedElement: AXUIElement
    let notificationCenterToken: AnyObject
    
    init(observer: AXObserver, observedElement: AXUIElement, notificationCenterToken: AnyObject) {
        self.observer = observer
        self.observedElement = observedElement
        self.notificationCenterToken = notificationCenterToken
    }
}

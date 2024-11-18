//
//  ViewController.swift
//  Echo
//
//  Created by Sergii Kryvoblotskyi on 11/17/24.
//

import Cocoa
import SwiftUI

final class ViewController: NSViewController {

    @IBOutlet weak var messagesPlaceholderView: NSView!
    @IBOutlet weak var promptPlaceholderView: NSView!
    @IBOutlet weak var promptTextField: NonFocusedTextField!
    
    private let store = MessagesStore()
    private let agent = Agent()
    
    private let frontmostApplication = FrontmostApplication()
    private var currentApplication: Application?
    
    private var currentEditor: AccessibilityItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        frontmostApplication.startObserving { [weak self] application in
            self?.handle(application: application)
        }
    }
    
    @IBAction func sendButtonClicked(_ sender: Any) {
        let prompt = self.promptTextField.stringValue
        guard prompt.isEmpty == false else { return }
        
        let message = Message.userPrompt(prompt)
        store.add(message: message)
        start(prompt)
        
        self.promptTextField.stringValue = ""
    }
}

private extension ViewController {
    
    func setupView() {
        let chatView = ChatView(store: store)
        let hostingViewController = NSHostingController(rootView: chatView)
        addChild(hostingViewController)
        
        self.messagesPlaceholderView.addSubview(hostingViewController.view)
        hostingViewController.view.frame = self.messagesPlaceholderView.bounds
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingViewController.view.leadingAnchor.constraint(equalTo: self.messagesPlaceholderView.leadingAnchor).isActive = true
        hostingViewController.view.trailingAnchor.constraint(equalTo: self.messagesPlaceholderView.trailingAnchor).isActive = true
        hostingViewController.view.topAnchor.constraint(equalTo: self.messagesPlaceholderView.topAnchor).isActive = true
        hostingViewController.view.bottomAnchor.constraint(equalTo: self.messagesPlaceholderView.bottomAnchor).isActive = true
    }
}

private extension ViewController {
    
    func handle(application: Application) {
        guard application.bundleId != Bundle.main.bundleIdentifier else { return }
        
        let message = Message.appFound(application)
        self.store.add(message: message)
        self.currentApplication = application
    }
    
    func start(_ prompt: String) {
        guard let currentApplication = self.currentApplication else {
            print("No application")
            return
        }
        
        let accessbilableApplication = AccessbilableApplication(application: currentApplication)
        guard let editor = accessbilableApplication.fetchEditor() else {
            print("No editor")
            return
        }
        
        self.store.add(message: .thinking("No problem. Updating..."))
        self.agent.query(inputString: editor.value, prompt: prompt) { result in
            switch result {
            case .success(let response):
                editor.updateValue(response)
                DispatchQueue.main.async {
                    self.store.add(message: .textAnswer("Done!"))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

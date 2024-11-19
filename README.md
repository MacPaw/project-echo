# Echo

![EchoIcon-256](https://github.com/user-attachments/assets/5ce1e09e-8413-48cb-a626-99b45dd18717)

**Echo** is a macOS application that demonstrates how to interact with macOS applications using Accessibility and [OpenAI](https://openai.com) APIs. It allows users to send prompts to the frontmost application and receive responses, showcasing a functional chat-like interface.

<img width="1800" alt="Screenshot 2024-11-18 at 2 58 45 PM" src="https://github.com/user-attachments/assets/b7d2a457-d4c6-430b-8fae-c3364ea4c7af">

## Features

- **Real-Time Frontmost Application Detection**: Automatically detects the currently active macOS application.
- **User Prompts**: Send prompts to interact with text area of the detected application.
- **Chat View Interface**: Displays interactions in a chat-like interface

> [!WARNING]  
> Project Echo is an experimental prototype that demonstrates an approach, use in on your own risk

## Requirements

- macOS 14.0 or later
- Xcode 15.0 or later

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/username/Echo.git
   cd Echo
   ```

2. Open the project in Xcode:
   ```bash
   open Echo.xcodeproj
   ```

3. Build and run the project:
   - Select your target device (Mac).
   - Press **Cmd + R** or click the Run button in Xcode.

## Usage

1. Launch **Echo** on macOS.
2. Activate/launch 3rd party application
3. Type your prompt into the text field
4. Click the **Send** button to interact with the frontmost application.
5. View the response in the chat interface.

Note: You should add OpenAI API key to environment variables.
<img width="945" alt="Screenshot 2024-11-18 at 2 43 48 PM" src="https://github.com/user-attachments/assets/ab34b050-2401-4ce1-be4c-3452470d95fa">

## Code Overview

### Key Components

- **`ViewController`**: 
  - Manages the main app logic, including UI setup, handling user prompts, and interacting with applications.
  
- **`MessagesStore`**: 
  - Stores and manages messages displayed in the chat interface.

- **`Agent`**: 
  - Processes user prompts and generates responses based on the content of the frontmost application.

- **`FrontmostApplication`**: 
  - Observes and detects the currently active macOS application.

- **`AccessbilableApplication`**: 
  - Provides Accessibility API integration to fetch and update content in the frontmost application.

### View Hierarchy

- **Chat Interface**:
  - Built using `SwiftUI` and embedded into `NSViewController` via `NSHostingController`.

## Accessibility Permissions

This app requires and asks automatically macOS Accessibility permissions to function correctly. Follow these steps to grant permissions:

1. Open **System Preferences** > **Privacy & Security** > **Accessibility**.
2. Click the lock to make changes and authenticate.
3. Add **Echo** to the list of allowed applications.

## Example Screenshots

### Xcode
![xcode](https://github.com/user-attachments/assets/79fc4d19-fb7a-47d5-b0fd-885f720471ad)

### Safari
![safari](https://github.com/user-attachments/assets/34cc2da5-f30c-4087-ad2f-4fb97b4f2af2)

### TextMate
![textmate](https://github.com/user-attachments/assets/76270d69-1104-42ff-8b4b-4aeb2a17de3c)

## Demo Video

[![Youtube Demo Video](https://img.youtube.com/vi/RmiFfuKhAJQ/0.jpg)](https://www.youtube.com/watch?v=RmiFfuKhAJQ)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

Created by [MacPaw Research](https://research.macpaw.com)

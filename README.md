# Echo

![EchoIcon-256](https://github.com/user-attachments/assets/5ce1e09e-8413-48cb-a626-99b45dd18717)

**Echo** is a macOS application that demonstrates how to interact with macOS applications using Accessibility and [OpenAI](https://openai.com) APIs. It allows users to send prompts to the frontmost application and receive responses, showcasing a functional chat-like interface.

<img width="1800" alt="Screenshot 2024-11-18 at 2 58 45 PM" src="https://github.com/user-attachments/assets/b7d2a457-d4c6-430b-8fae-c3364ea4c7af">

## Features

- **Real-Time Frontmost Application Detection**: Automatically detects the currently active macOS application.
- **User Prompts**: Send prompts to interact with the text area of the detected application.
- **Chat View Interface**: Displays interactions in a chat-like interface.

> [!WARNING]
> Project Echo is an experimental prototype that demonstrates an approach. Use it at your own risk.

## Requirements

- macOS 14.0 or later
- Xcode 15.0 or later
- An [OpenAI API key](https://platform.openai.com/api-keys)

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/MacPaw/project-echo.git
   cd project-echo
   ```

2. Open the project in Xcode:
   ```bash
   open Echo.xcodeproj
   ```

3. Set the `OPEN_AI` environment variable in your Xcode scheme:
   - In Xcode, go to **Product > Scheme > Edit Scheme…**
   - Select **Run** in the left sidebar, then open the **Arguments** tab.
   - Under **Environment Variables**, click **+** and add:
     - Name: `OPEN_AI`
     - Value: your OpenAI API key

   <img width="945" alt="Xcode scheme environment variable setup" src="https://github.com/user-attachments/assets/ab34b050-2401-4ce1-be4c-3452470d95fa">

   Alternatively, when launching from the terminal:
   ```bash
   OPEN_AI=your_api_key_here open Echo.app
   ```

4. Build and run the project:
   - Select your target device (Mac).
   - Press **Cmd + R** or click the Run button in Xcode.

## Usage

1. Launch **Echo** on macOS.
2. Activate or launch a 3rd party application (e.g. Xcode, TextMate, Safari).
3. Type your prompt into the text field (e.g. "Convert to Objective-C", "Fix typos").
4. Click the **Send** button to interact with the frontmost application.
5. View the response in the chat interface — the focused text area will be updated automatically.

## Accessibility Permissions

Echo requires macOS Accessibility permissions and will prompt you automatically on first launch. To grant them manually:

1. Open **System Settings** > **Privacy & Security** > **Accessibility**.
2. Click the lock to make changes and authenticate.
3. Add **Echo** to the list of allowed applications.

## Troubleshooting

**App crashes immediately on launch**
The `OPEN_AI` environment variable is not set. Follow the [Development Setup](#development-setup) steps above to configure it in your Xcode scheme.

**Echo does not detect the frontmost window / "No editor" message**
The target application must expose an `AXTextArea` or `AXTextField` element. This works in most native text editors (Xcode, TextMate, BBEdit) and many text fields. Browser address bars and some web text areas may not be accessible via the Accessibility API.

**Accessibility permission is denied**
Open **System Settings > Privacy & Security > Accessibility** and verify that Echo is listed and toggled on. Re-building from Xcode may require re-granting the permission.

**OpenAI API errors**
Verify your API key is valid and has GPT-4o access. Check your [OpenAI usage dashboard](https://platform.openai.com/usage) for quota issues.

## Code Overview

### Key Components

- **`ViewController`**:
  Manages the main app logic, including UI setup, handling user prompts, and interacting with applications.

- **`MessagesStore`**:
  Stores and manages messages displayed in the chat interface.

- **`Agent`**:
  Processes user prompts and generates responses based on the content of the frontmost application.

- **`FrontmostApplication`**:
  Observes and detects the currently active macOS application.

- **`AccessibleApplication`**:
  Provides Accessibility API integration to fetch and update content in the frontmost application.

### View Hierarchy

- **Chat Interface**:
  Built using `SwiftUI` and embedded into `NSViewController` via `NSHostingController`.

## Example Screenshots

### Xcode
![xcode](https://github.com/user-attachments/assets/79fc4d19-fb7a-47d5-b0fd-885f720471ad)

### Safari
![safari](https://github.com/user-attachments/assets/34cc2da5-f30c-4087-ad2f-4fb97b4f2af2)

### TextMate
![textmate](https://github.com/user-attachments/assets/76270d69-1104-42ff-8b4b-4aeb2a17de3c)

## Demo Video

[![Youtube Demo Video](https://img.youtube.com/vi/RmiFfuKhAJQ/0.jpg)](https://www.youtube.com/watch?v=RmiFfuKhAJQ)

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Created by [MacPaw Research](https://research.macpaw.com)

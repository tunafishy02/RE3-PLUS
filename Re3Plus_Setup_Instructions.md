# Re3Plus Setup Instructions

**Team:** Bitsy

These are the instructions to set up and run the **Re3Plus Flutter
application** locally.



## Prerequisites

Before running the project, ensure the following software is installed into the system:

* **Flutter SDK (Stable Channel)**  
Installation Guide: https://docs.flutter.dev/get-started/install
* **Dart SDK**  
Included with Flutter.
* **IDE (Recommended)**

  * Visual Studio Code with Flutter \& Dart extensions\\
  * OR Android Studio with Flutter plugin
* **Git**  
Required to clone the repository.
* **Android Emulator / Physical Android Device**  
Used for running and testing the application.



## Installation \& Environment Setup

Execute the following commands in the project directory.



Step 1. Clone the Repository
git clone https://github.com/tunafishy02/RE3-PLUS.git


Step 2. Navigate to the Project Directory
cd RE3-PLUS


### Step 3. Install Project Dependencies

Run the following command to download all required packages:
flutter pub get


### Step 4. Verify Flutter Installation

(Optional but recommended)
flutter doctor



Resolve any issues reported before continuing.



## Running the Application

### Step 1. Start an Emulator or Connect a Device

You can start an Android emulator from Android Studio or connect a
physical device with **USB debugging enabled**.

Check available devices with:
flutter devices


### Step 2. Run the App

Execute the following command in the project directory:
flutter run


The application should compile and launch on the selected device.



## Project Structure (Overview)

Key folders in the repository:

&#x20;   lib/
     ├── screens/        # Main UI screens
     ├── widgets/        # Reusable UI components
     ├── services/       # Logic and backend interactions
     └── main.dart       # Application entry point


## Troubleshooting

**Dependencies fail to install:**

&#x20;   flutter clean

then,
    flutter pub get


**Device not detected:**

&#x20;   flutter devices


Ensure emulator or device is running.



## Additional Notes

* The project was developed using the **Flutter stable channel**.
* Recommended Flutter version: **3.x or later**.
* For the best experience, run the app on an **Android device or
emulator**.


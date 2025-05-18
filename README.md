# Zygisk SElinux Permissive (Shell Script Version)

**Module ID:** `Magisk_SElinux_Permissive`

This project provides a Magisk/KernelSU module for rooted Android devices that sets the system's SELinux mode to "Permissive" upon booting.

## How it Works

The module utilizes a simple shell script (`service.sh`) that runs during the boot process. Once the device has finished booting, this script executes the command `setenforce 0` (or `setenforce permissive`) to change the SELinux status from "Enforcing" to "Permissive".

## Features

*   Sets SELinux to Permissive on boot.
*   Lightweight: No native binaries, relies on a simple shell script.
*   Compatible with Magisk, KernelSU and APatch (KSU and APatch need zygisk-next or similar).

## Requirements

*   A rooted Android device.
*   Magisk (v20.4+), KernelSU or APatch installed.
*   If using KSU or APatch then you need some form of zygisk implementation (like zygisk-next for example).

## Building the Module

1.  Clone this repository.
2.  Ensure you have the Android SDK and NDK configured if you intend to modify the Gradle build scripts (though not strictly necessary for just building the existing setup).
3.  Navigate to the project's root directory in your terminal.
4.  Execute the Gradle wrapper command to build the module. For a release version:
    ```bash
    ./gradlew assembleRelease
    ```
    Or, if you want to build and immediately attempt to push and install via KernelSU (assuming `adb` is set up and a device/emulator is connected):
    ```bash
    ./gradlew installKsuRelease 
    ```
    Similarly for Magisk (though the specific task might be `installMagiskRelease` - check `module/build.gradle.kts` for exact task names):
    ```bash
    ./gradlew installMagiskRelease
    ```
5.  The flashable module ZIP file will be located in `module/release/`. The filename will be similar to `Magisk-SElinux-Permissive-vX-Y-commit-release.zip`.

## Installation

1.  Build the module (see above) or download a pre-built ZIP from the releases page.
2.  Transfer the generated `.zip` file to your Android device.
3.  Open your Magisk Manager or KernelSU app.
4.  Navigate to the "Modules" section.
5.  Tap on "Install from storage" (or a similar option) and select the module's ZIP file.
6.  Reboot your device when prompted.

After rebooting, SELinux should be in "Permissive" mode. You can verify this by opening a terminal app on your device and running the command `getenforce`. It should return `Permissive`.
A simpler way is to look inside the Magisk or KSU app. The home page contains the enforcement status of SElinux.

## Disclaimer

Modifying system configurations like SELinux can have security implications. Use this module at your own risk. Ensure you understand what SELinux is and why you need to set it to permissive before using this module.

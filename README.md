# Testing AppDynamics request tracking error 

This is a minimal reproducible example of an error with AppDynamics request tracking.

Steps to reproduce:

First make sure you run flutter version 3.22.0 or higher. (older versions will not break)

1. Run `flutter pub get`
2. Replace the key in the `app_key.dart` file with a valid key
3. Run `pod install` in the `ios` folder
4. Run the app as _production_ build
5. Set a breakpoint on line 108 in the `ManualRequestTracker.swift` file in the `requestTrackerReport` function 
(if that does not work, set it on line 106 and step over once)
6. id is now `Instance of UniqueKey`, while in debug builds it shows as `[#12345]`
# vodth_mobile

<p align="center">
  <img src="assets/vodth/vodth.jpeg" alt="Alt text" width="300" height="300">
</p>

Welcome to **VODTH**, the best voting system in Cambodia utilizing cutting edge technologies such as **Blockchain** and **Machine Learning** to make voting secure, transparent and fraud-proof.

## Installation
- Make sure to clone the project
- Commands
  - Install all the required packages and dependencies 
  ``` dart
    flutter pub get
  ```
   - Run the project 
  ``` dart
    flutter run
  ```

## Generate new View
- Our template follow a clean architecture called **MVVM - Model View ViewModel**
  - Details: https://medium.com/@codemax120/flutter-clean-architecture-mvvm-f8802e3df564
- Go to exec.dart and add 'location' : 'file_name' in the views list.
- Then run this command 
  ``` dart 
    dart scripts/generate_views/exec.dart
  ```
- This project uses AutoRoute which is a package provided by flutter to help generate routes so developer don't have to manually write them.
- Afterward, in order to generate route for navigation run this command
  ``` dart
    flutter pub run build_runner build --delete-conflicting-outputs
  ```
- Lastly, go to ``` routes.dart ``` and add new route that had been generated
- To navigate screen
  ``` dart
    context.router.push([ROUTE NAME])
  ```

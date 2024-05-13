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
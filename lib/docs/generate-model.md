## Generate Model
Add model for the project can be time-consuming and ineffective, because you have to write a fromJson and toJson function for all the fields. To tackle this problem, we use json_serializable to help with generating model.

# Add model

  - Navigate to "lib/model/vodth"
  - Then, Create file for the model (Checkout the sample)
  - Make sure include part of '[file_name].g.dart' (file that will be generated)
  - When done, run builder runner to generate model
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
  - Usage:
    ```dart
    SampleModel? sampleModel = SampleModel(name: 'John',description: '10x Dev',age: '25');
    ```
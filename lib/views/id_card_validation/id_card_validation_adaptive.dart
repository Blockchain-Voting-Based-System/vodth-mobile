part of 'id_card_validation_view.dart';

class _IdCardValidationAdaptive extends StatelessWidget {
  const _IdCardValidationAdaptive(this.viewModel);

  final IdCardValidationViewModel? viewModel;

  Future<void> _pickImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      Uint8List fileBytes;

      if (file.bytes != null) {
        fileBytes = file.bytes!;
      } else {
        // Read the file bytes manually
        File filePath = File(file.path!);
        fileBytes = await filePath.readAsBytes();
      }
      await Provider.of<IdCardValidationViewModel>(context, listen: false)
          .classifyID(fileBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ID Classifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _pickImage(context),
              child: const Text("Pick an Image"),
            ),
            const SizedBox(height: 20),
            Consumer<IdCardValidationViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  children: [
                    if (viewModel.selectedImage != null)
                      Image.memory(viewModel.selectedImage!),
                    const SizedBox(height: 20),
                    Text(viewModel.result),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

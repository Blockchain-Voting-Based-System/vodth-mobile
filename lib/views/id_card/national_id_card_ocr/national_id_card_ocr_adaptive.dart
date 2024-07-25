part of 'national_id_card_ocr_view.dart';

class _NationalIdCardOcrAdaptive extends StatelessWidget {
  const _NationalIdCardOcrAdaptive(this.viewModel);

  final NationalIdCardOcrViewModel? viewModel;

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
        File filePath = File(file.path!);
        fileBytes = await filePath.readAsBytes();
      }
      await Provider.of<NationalIdCardOcrViewModel>(context, listen: false)
          .ocrNationalID(fileBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("National ID OCR"),
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
            Consumer<NationalIdCardOcrViewModel>(
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

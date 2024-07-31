part of 'upload_id_view.dart';

class _UploadIdAdaptive extends StatelessWidget {
  const _UploadIdAdaptive(this.viewModel);

  final UploadIdViewModel viewModel;

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
      if (viewModel.cardType == 'student_id') {
        await Provider.of<UploadIdViewModel>(context, listen: false)
            .classifyID(fileBytes);
      } else if (viewModel.cardType == 'national_id') {
        print('National ID');
        File imageFile = File(file.path!);
        Map<String, String> ocrResults =
            await viewModel.nationalIdOcrService.predict(imageFile);
        print('OCR Results: $ocrResults');
      }

      viewModel.setSelectedImage(fileBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return MorphingAppBar(
      title: const Text(
        'Upload your ID',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      children: [
        Column(
          children: [
            _buildScanFrontOfYourId(context),
            const SizedBox(
              height: 48,
            ),
            _buildTakeAPhotoDescription(context),
            const SizedBox(
              height: 48,
            ),
            _buildIdCardImage(context),
            const SizedBox(
              height: 48,
            ),
            ActionButton(
              buttonTitle: 'Take a photo',
              icon: Icons.camera_alt,
              onTap: () {
                context.router.push(CaptureIdRoute());
              },
            ),
            ConfigConstant.sizedBoxH2,
            ActionButton(
              buttonTitle: 'Upload from gallery',
              icon: Icons.photo_library,
              onTap: () => _pickImage(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIdCardImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: M3Color.of(context).primary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: viewModel.selectedImage != null
                ? Image.memory(viewModel.selectedImage!)
                : Center(
                    child: Icon(
                      Icons.contact_emergency_rounded,
                      size: 50,
                      color: M3Color.of(context).primary,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanFrontOfYourId(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Scan the front of your ID',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTakeAPhotoDescription(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Take a photo of the front of your ID',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

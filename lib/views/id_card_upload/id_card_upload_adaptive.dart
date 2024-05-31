part of 'id_card_upload_view.dart';

class _IdCardUploadAdaptive extends StatefulWidget {
  const _IdCardUploadAdaptive(this.viewModel);

  final IdCardUploadViewModel viewModel;

  @override
  State<_IdCardUploadAdaptive> createState() => _IdCardUploadAdaptiveState();
}

class _IdCardUploadAdaptiveState extends State<_IdCardUploadAdaptive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image to S3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.viewModel.image == null
                ? const Text('No image selected.')
                : Image.file(widget.viewModel.image!),
            ElevatedButton(
              onPressed: widget.viewModel.pickImage,
              child: const Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: widget.viewModel.uploadImage,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}

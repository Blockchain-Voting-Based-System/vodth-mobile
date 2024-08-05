part of 'id_card_ocr_view.dart';

class _IdCardOcrAdaptive extends StatefulWidget {
  const _IdCardOcrAdaptive(this.viewModel);

  final IdCardOcrViewModel viewModel;

  @override
  _IdCardOcrAdaptiveState createState() => _IdCardOcrAdaptiveState();
}

class _IdCardOcrAdaptiveState extends State<_IdCardOcrAdaptive> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? camera;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      camera = cameras![0];
      _controller = CameraController(camera!, ResolutionPreset.high);
      await _controller!.initialize();
      if (!mounted) return;
      setState(() {
        _isInitialized = true;
      });
    }
  }

  Future<void> _takePicture(BuildContext context) async {
    if (!_controller!.value.isInitialized) {
      return;
    }

    try {
      final XFile imageFile = await _controller!.takePicture();
      final imageBytes = await imageFile.readAsBytes();
      bool isValid = await widget.viewModel.classifyID(imageBytes);

      if (isValid) {
        print('is valid');
        await widget.viewModel.extractTextFromImage(imageBytes);
      } else {
        print('is invalid');
      }
    } catch (e) {
      print(e);
    }
  }

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
      bool isValid = await widget.viewModel.classifyID(fileBytes);

      if (isValid) {
        print('is valid');
        await widget.viewModel.extractTextFromImage(fileBytes);
      } else {
        print('is invalid');
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture ID'),
      ),
      body: Stack(
        children: [
          CameraPreview(_controller!),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () => print('take picture'),
                child: const Icon(Icons.camera),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

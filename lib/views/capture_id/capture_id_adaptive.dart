part of 'capture_id_view.dart';

class _CaptureIdAdaptive extends StatefulWidget {
  const _CaptureIdAdaptive(this.viewModel);

  final CaptureIdViewModel viewModel;

  @override
  _CaptureIdAdaptiveState createState() => _CaptureIdAdaptiveState();
}

class _CaptureIdAdaptiveState extends State<_CaptureIdAdaptive> {
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

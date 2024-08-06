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
      _controller = CameraController(
        camera!,
        ResolutionPreset.max,
      );
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
        // await widget.viewModel.extractTextFromImage(imageBytes);
      } else {
        print('is invalid');
      }
    } catch (e) {
      print(e);
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
      bottomNavigationBar: null,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Capture ID',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CameraPreview(
                  _controller!,
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipPath(
              clipper: HoleClipper(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: M3Color.of(context).primary.withOpacity(0.5),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
          const Positioned(
            bottom: 230,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Center your ID',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _takePicture(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height / 2),
              width: 300,
              height: 200),
          const Radius.circular(12)))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

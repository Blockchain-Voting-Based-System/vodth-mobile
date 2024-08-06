part of 'upload_id_view.dart';

class _UploadIdAdaptive extends StatelessWidget {
  const _UploadIdAdaptive(
    this.viewModel,
    this.castingVoteViewModel,
  );

  final UploadIdViewModel viewModel;
  final CastingVoteViewModel castingVoteViewModel;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 2, color: M3Color.of(context).primary),
        const SizedBox(
          height: 25,
        ),
        _buildScanFrontOfYourId(context),
        const SizedBox(
          height: 25,
        ),
        _buildTakeAPhotoDescription(context),
        const SizedBox(
          height: 25,
        ),
        _buildIdCardImage(context),
        ConfigConstant.sizedBoxH2,
        if (viewModel.hasUploaded)
          Text(
            viewModel.isInvalid ? 'Invalid ID' : 'Valid ID',
            style: TextStyle(
              color: viewModel.isInvalid
                  ? Colors.red
                  : M3Color.of(context).primary,
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        UploadIdActionButton(
          buttonTitle: 'Take a photo',
          icon: Icons.camera_alt,
          onTap: () {
            context.router.push(CaptureIdRoute());
          },
        ),
        ConfigConstant.sizedBoxH2,
        UploadIdActionButton(
          buttonTitle: 'Upload from gallery',
          icon: Icons.photo_library,
          onTap: () => viewModel.pickImage(),
        ),
        const SizedBox(
          height: 65,
        ),
        actionCancelNext(castingVoteViewModel.nextStep, context),
      ],
    );
  }

  Widget _buildIdCardImage(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: viewModel.hasUploaded
                  ? (viewModel.isInvalid
                      ? Colors.red
                      : M3Color.of(context).primary)
                  : Colors.grey,
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
    );
  }

  Widget _buildScanFrontOfYourId(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Scan the front of your ID',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: M3Color.of(context).primary,
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

  Widget actionCancelNext(VoidCallback onStepContinue, BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ActionButton(
            text: 'Cancel',
            onPressed: Navigator.of(context).pop,
            color: Colors.grey.shade300,
            textColor: Colors.black,
          ),
        ),
        const SizedBox(width: 16), // Add some space between the buttons
        Expanded(
          child: ActionButton(
            text: 'Continue',
            onPressed: onStepContinue,
            color: M3Color.of(context).primary,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

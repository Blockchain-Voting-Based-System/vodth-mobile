// ignore_for_file: use_build_context_synchronously

part of 'candidate_detail_view.dart';

class _CandidateDetailAdaptive extends StatelessWidget {
  const _CandidateDetailAdaptive(this.viewModel);

  final CandidateDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(),
      backgroundColor: Colors.white,
      body: _buildBody(context),
      bottomNavigationBar: VmBottomNavigationWrapper(
        child: VmButton.filled(
          label: 'Vote',
          onPressed: () async {
            print('event type: ${viewModel.event?.type}');
            print(viewModel.candidate?.suiCandidateId);
            if (viewModel.event?.type == 'private') {
              _showSecretKeyDialog(context);
            } else if (viewModel.event?.type == 'public') {
              MessengerService.of(context).showBlankLoading(
                future: () async {
                  await viewModel.voteCandidate(context);
                  context.router.popForced();
                },
                debugSource: "CandidateDetailViewModel#voteCandidate",
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              buildCandidateProfileImage(context),
              ConfigConstant.sizedBoxH2,
              ConfigConstant.sizedBoxH2,
              buildCandidateDetail(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCandidateProfileImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(viewModel.candidate?.imageName ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCandidateDetail(
    BuildContext context,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              viewModel.candidate != null ? '${viewModel.candidate?.name}' : 'N/A',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        ConfigConstant.sizedBoxH2,
        buildInfoSection(context),
      ],
    );
  }

  Widget buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Presedent of CADT',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ],
        ),
        ConfigConstant.sizedBoxH1,
        Text(
          viewModel.candidate?.bio ?? 'N/A',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ThemeConstant.brandColor,
                fontSize: 20,
              ),
        ),
      ],
    );
  }

  void _showSecretKeyDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Private Vote Secret Key',
            style: M3TextTheme.of(context).titleLarge?.copyWith(
                  color: M3Color.of(context).primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Please enter your secret key to join the voting event:'),
              const SizedBox(height: 8.0),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Secret Key",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: M3Color.of(context).primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: TextButton(
                  child: const Text(
                    'Vote',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    MessengerService.of(context).showBlankLoading(
                      future: () async {
                        bool isValid = await viewModel.validateAndRemoveSecret(controller.text);

                        if (isValid) {
                          await viewModel.voteCandidate(context);

                          context.router.popForced();
                          MessengerService.of(context).showSnackBar(
                            'Vote successfully',
                          );
                        } else {
                          context.router.popForced();
                          MessengerService.of(context).showSnackBar(
                            'Invalid secret key',
                            success: false,
                          );
                        }
                      },
                      debugSource: "CandidateDetailViewModel#voteCandidate",
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

part of 'id_card_options_view.dart';

class _IdCardOptionsAdaptive extends StatelessWidget {
  const _IdCardOptionsAdaptive(this.viewModel);

  final IdCardOptionsViewModel viewModel;

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
        'Verify document',
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
            _buildChooseCardType(context),
            ConfigConstant.sizedBoxH2,
            ConfigConstant.sizedBoxH2,
            ConfigConstant.sizedBoxH2,
            _buildCardOptions(context),
          ],
        ),
      ],
    );
  }

  Widget _buildChooseCardType(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Choose your card type',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCardOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          IdCardTypeTile(
            title: 'Student ID Card',
            onTap: () {
              String cardType = 'student_id';
              context.router.push(UploadIdRoute(cardType: cardType));
            },
          ),
          IdCardTypeTile(
            title: 'National ID Card',
            onTap: () {
              String cardType = 'national_id';
              context.router.push(UploadIdRoute(cardType: cardType));
            },
          ),
        ],
      ),
    );
  }
}

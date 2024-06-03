part of 'private_view.dart';

class _PrivateAdaptive extends StatelessWidget {
  const _PrivateAdaptive(this.viewModel);

  final PrivateViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context, viewModel),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.blue),
        onPressed: () {
          context.router.popForced();
        },
      ),
      title: const Padding(
        padding: EdgeInsets.only(left: 24),
      ),
    );
  }

  Widget buildBody(BuildContext context, PrivateViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(context),
          const SizedBox(height: 40),
          buildCodeBoxList(),
          const SizedBox(height: 40),
          buildConfirmButton(context),
          const SizedBox(height: 60),
          NumberPad(
            viewModel: viewModel,
          )
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ENTER CODE',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Check your email for the verification code',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }

  Widget buildCodeBoxList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: viewModel.controllers.map((controller) {
        return buildCodeBox(controller);
      }).toList(),
    );
  }

  Widget buildConfirmButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 370,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.lightBlue,
          ),
          onPressed: () => viewModel.validateCode(context),
          child: Text(
            'Confirm',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  Widget buildCodeBox(TextEditingController controller) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 3, 204, 174)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: true,
          obscuringCharacter: '•',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 3, 204, 174),
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
        ),
      ),
    );
  }
}

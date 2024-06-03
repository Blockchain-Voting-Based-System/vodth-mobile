part of 'candidates_view.dart';

class _CandidatesAdaptive extends StatelessWidget {
  const _CandidatesAdaptive(this.viewModel);

  final CandidatesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Candidates',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CandidatesGrid(candidates: viewModel.candidates),
    );
  }
}

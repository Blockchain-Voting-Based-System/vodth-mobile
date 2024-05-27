part of vote_result;

class _VoteResultAdaptive extends StatelessWidget {
  const _VoteResultAdaptive(this.viewModel);

  final VoteResultViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Vote Result',
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
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              const ResultPieChart(),
              ConfigConstant.sizedBoxH2,
              ResultBarChart(
                chartDatas: viewModel.votes,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

part of events;

class _EventsAdaptive extends StatelessWidget {
  const _EventsAdaptive(this.viewModel);

  final EventsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    // final tabsRouter = AutoTabsRouter.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/cadt.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () => context.router.popForced(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: M3Color.of(context).primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'CADT CSA Selection 2024',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text('More Detail'),
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Candidates',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildCandidateList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCandidateList() {
    final candidates = [
      {
        'name': 'Vuthy Outhdom',
        'rank': 'No.1',
        'description':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Ipsum passages, and more recently with desktop publishing software.'
      },
      {
        'name': 'Yin Vannthoura',
        'rank': 'No.2',
        'description':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Ipsum passages, and more recently with desktop publishing software.'
      },
      {
        'name': 'Savuth Youvneath',
        'rank': 'No.3',
        'description':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Ipsum passages, and more recently with desktop publishing software.'
      },
      {
        'name': 'Hello world',
        'rank': 'No.4',
        'description':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Ipsum passages, and more recently with desktop publishing software.'
      },
    ];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        final candidate = candidates[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: M3Color.of(context).primary, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Text(candidate['rank']!,
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 32, // Image radius
                      backgroundImage: AssetImage('assets/images/yura.png'),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                title: Text(
                  candidate['name']!,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showCandidateDetails(context, candidate);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCandidateDetails(
      BuildContext context, Map<String, String> candidate) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures the modal takes up more space
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/images/yura.png'), // Add a default profile image or candidate image
                    ),
                    SizedBox(height: 16),
                    Text(
                      candidate['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      candidate['description'] ?? 'No description available.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity, // Makes the button full width
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: M3Color.of(context)
                              .primary, // Set the background color here
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Text(
                          'Vote',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}


// part of events;

// class _EventsAdaptive extends StatelessWidget {
//   const _EventsAdaptive(this.viewModel);

//   final EventsViewModel viewModel;

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';

class NewEventCard extends StatelessWidget {
  const NewEventCard({
    super.key,
    required this.title,
    required this.time,
    required this.thumbnailUrl,
    required this.description,
  });

  final String title;
  final String time;
  final String thumbnailUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: buildEventListTile(),
    );
  }

  Widget buildEventListTile() {
    return ListTile(
      minTileHeight: 100,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10), // Set the corner radius
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(thumbnailUrl),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(description),
      
      contentPadding: const EdgeInsets.all(12),
    );
  }
}

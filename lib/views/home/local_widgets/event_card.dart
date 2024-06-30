import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/theme_constant.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.time,
    required this.type,
    required this.thumbnailUrl,
    required this.description,
  });

  final String title;
  final String time;
  final String type;
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
      child: _buildEventCard(),
    );
  }

  Widget _buildEventCard() {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          _buildEventInformation(),
          _buildEventThumbNail(),
        ],
      ),
    );
  }

  Widget _buildEventThumbNail() {
    return Column(
      children: [
        Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(thumbnailUrl),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventInformation() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.clip,
              maxLines: null, // Add this line
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ThemeConstant.brandColor,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[800],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  'Type: $type', overflow: TextOverflow.clip,
                  maxLines: null, // Add this line
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Date: ${time.split('T').first}',
                  overflow: TextOverflow.clip,
                  maxLines: null, // Add this line
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

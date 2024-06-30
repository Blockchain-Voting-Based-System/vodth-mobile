import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/theme/theme_constant.dart';

class NewEventCardV1 extends StatelessWidget {
  const NewEventCardV1({
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
      child: _buildEventCard(),
    );
  }

  Widget _buildEventCard() {
    return SizedBox(
      height: 150,
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
          width: 100,
          height: 150,
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
        ),
      ),
    );
  }
}

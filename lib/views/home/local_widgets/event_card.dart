import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/theme/theme_constant.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final EventModel event;

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
          width: 120,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(event.imageUrl ?? 'https://api.api-ninjas.com/v1/randomimage?category=nature'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventInformation() {
    String date = time.split('T').first;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.name ?? 'No name',
              overflow: TextOverflow.clip,
              maxLines: null, // Add this line
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ThemeConstant.brandColor,
              ),
            ),
            Text(
              event.description ?? 'No description',
              style: TextStyle(
                color: Colors.grey[800],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  'Start Date: ${event.startDate?.split('T').first}',
                  overflow: TextOverflow.clip,
                  maxLines: null, // Add this line
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'End Date: ${event.endDate?.split('T').first}',
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

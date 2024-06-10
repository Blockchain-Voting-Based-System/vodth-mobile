import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: buuldEventDetail(),
    );
  }

  Widget buuldEventDetail() {
    return Row(
      children: [
        buildEventThumbNail(),
        ConfigConstant.sizedBoxW2,
        buildEventInfos(),
      ],
    );
  }

  Widget buildEventThumbNail() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(thumbnailUrl),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEventInfos() {
    return Expanded(
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
          ConfigConstant.sizedBoxH1,
          Text(
            description,
            overflow: TextOverflow.clip,
            maxLines: null, // Add this line
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          ConfigConstant.sizedBoxH1,
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'Date: ${time.split('T').first}',
              overflow: TextOverflow.clip,
              maxLines: null, // Add this line
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

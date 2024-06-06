// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.time,
    required this.thumbnailUrl,
  });

  final String title;
  final String time;
  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: buildImage(),
      ),
      child: Stack(
        children: [
          buildEventTitle(),
          buildEventTimeLine(),
        ],
      ),
    );
  }

  DecorationImage buildImage() {
    return DecorationImage(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.2),
        BlendMode.multiply,
      ),
      image: NetworkImage(thumbnailUrl),
      fit: BoxFit.cover,
    );
  }

  Widget buildEventTitle() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildEventTimeLine() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.schedule,
                  color: Colors.yellow,
                  size: 18,
                ),
                SizedBox(width: 7),
                Text(
                  time,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

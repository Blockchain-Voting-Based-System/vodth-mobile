import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/views/home/local_widgets/new_event_card_v1.dart';
import 'package:vodth_mobile/views/widgets/vodth_tap_effect.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, required this.events});
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final EventModel event = events[index];
        return VodthTapEffect(
          onTap: () {
            context.router.push(const EventsRoute());
          },
          effects: const [
            VodthTapEffectType.scaleDown,
          ],
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: NewEventCardV1(
              title: event.title ?? 'N/A',
              time: event.startDate!.toIso8601String(),
              thumbnailUrl: event.bannerUrl ?? '',
              description: event.description ?? 'N/A',
            ),
          ),
        );
      },
    );
  }
}
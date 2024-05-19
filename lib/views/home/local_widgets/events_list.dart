import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/views/home/home_view_model.dart';
import 'package:vodth_mobile/views/home/local_widgets/event_card.dart';
import 'package:vodth_mobile/views/widgets/vodth_tap_effect.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.events.length,
      itemBuilder: (context, index) {
        final EventModel event = viewModel.events[index];
        return VodthTapEffect(
          onTap: () {
            print('Go to event detail page');
          },
          effects: const [
            VodthTapEffectType.scaleDown,
          ],
          child: EventCard(
            title: event.title ?? 'N/A',
            time: event.startDate!.toIso8601String(),
            thumbnailUrl: event.bannerUrl ?? '',
          ),
        );
      },
    );
  }
}

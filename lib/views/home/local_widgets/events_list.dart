import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';
import 'package:vodth_mobile/views/home/local_widgets/new_event_card_v1.dart';
import 'package:vodth_mobile/views/widgets/vm_tap_effect.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, required this.events});
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        final EventModel event = events[index];
        return VmTapEffect(
          onTap: () {
            context.router.push(const EventsRoute());
          },
          effects: const [
            VmTapEffectType.scaleDown,
          ],
          child: NewEventCardV1(
            title: event.name ?? 'N/A',
            time: event.startDate ?? 'N/A',
            thumbnailUrl: event.imageUrl ?? 'https://picsum.photos/200/300',
            description: event.description ?? 'N/A',
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return ConfigConstant.sizedBoxH1;
      },
    );
  }
}

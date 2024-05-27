import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/models/vodth/candidate_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';
import 'package:vodth_mobile/views/candidates/local_widgets/candidate_card.dart';
import 'package:vodth_mobile/views/widgets/vodth_tap_effect.dart';

class CandidatesGrid extends StatelessWidget {
  const CandidatesGrid({super.key, this.candidates});

  final List<CandidateModel>? candidates;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: MediaQuery.of(context).size.height / 4,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        childAspectRatio: 1.5,
      ),
      itemCount: candidates?.length ?? 0,
      itemBuilder: (context, index) {
        final CandidateModel candidate = candidates![index];
        return VodthTapEffect(
          onTap: () {
            context.router.push(
              CandidateRoute(candidate: candidate),
            );
          },
          effects: const [
            VodthTapEffectType.scaleDown,
          ],
          child: CandidateCard(
            candidate: candidate,
          ),
        );
      },
    );
  }
}

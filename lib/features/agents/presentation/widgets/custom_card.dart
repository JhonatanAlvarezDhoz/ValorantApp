import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valoratapp/core/config/theme/app_colors.dart';
import 'package:valoratapp/core/constants/app_sizes.dart';
import 'package:valoratapp/core/widgets/widgets.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.agent,
    required this.constraints,
  });

  final Agent agent;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        '/base/agents/detailsAgent',
        extra: agent,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        height: constraints.maxHeight * 0.3,
        width: constraints.maxWidth * 0.8,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(7, 0),
                blurRadius: 12,
                spreadRadius: -5,
              )
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 7),
                        blurRadius: 12,
                        spreadRadius: -3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      agent.displayIcon,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  height: 80,
                  width: (constraints.maxWidth * 0.8) - 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: agent.name),
                      gapH8,
                      CustomText(
                          text: agent.role?.displayName.name ?? "Sin rol"),
                      gapH8,
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7)),
                        height: 30,
                        width: 30,
                        child: agent.role?.displayIcon != null
                            ? Image.network(agent.role!.displayIcon)
                            : Image.asset('assets/icons/smallicon.png'),
                      )
                    ],
                  ),
                )
              ],
            ),
            gapH8,
            CustomText(
              text: agent.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

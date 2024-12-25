import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valoratapp/core/config/theme/app_colors.dart';
import 'package:valoratapp/core/constants/app_sizes.dart';
import 'package:valoratapp/core/utils/responsive.dart';
import 'package:valoratapp/core/widgets/widgets.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/infrastructure/models/agents_model.dart';

class DetailAgent extends StatelessWidget {
  final Agent agent;
  const DetailAgent({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void showModal(
        BuildContext context, BoxConstraints constraints, Agent agent) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            height: constraints.maxHeight * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  agent.role?.displayName.name ?? "not Role",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: agent.role?.description ?? "not description",
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
                gapH32,
                gapH64,
                Center(
                  child: Container(
                    width: constraints.maxWidth * 0.8,
                    alignment: Alignment.center,
                    child: ThemeButton(
                      borderRadius: BorderRadius.circular(10),
                      onPressed: () {
                        Navigator.pop(context); // Cierra el modal
                      },
                      text: 'Cerrar',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
        onPressed: () => GoRouter.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      )),
      body: Container(
        color: AppColors.white,
        height: size.height,
        width: size.width,
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerDetail(size: size, agent: agent),
                gapH12,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: agent.name,
                                fontSize: Responsive.of(context)
                                    .diagonalResponsive(3),
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: agent.role?.displayName.name ?? "no roll",
                                fontSize: Responsive.of(context)
                                    .diagonalResponsive(2),
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          gapW48,
                          GestureDetector(
                            onTap: () => showModal(context, constraints, agent),
                            child: BuilderImage(
                              height: 40,
                              width: 40,
                              borderRadius: BorderRadius.circular(19),
                              backgroundColor: Colors.red,
                              image: agent.role?.displayIcon,
                              withBoxShadow: true,
                            ),
                          )
                        ],
                      ),
                      gapH4,
                      CustomText(
                        text: agent.description,
                        fontSize:
                            Responsive.of(context).diagonalResponsive(1.6),
                        maxLines: 6,
                      ),
                      gapH12,
                      CustomText(
                        text: "Habilidades",
                        fontSize:
                            Responsive.of(context).diagonalResponsive(1.9),
                        fontWeight: FontWeight.w600,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            List.generate(agent.abilities.length, (index) {
                          Ability ability = agent.abilities[index];
                          return ExpansionTile(
                              // backgroundColor: ThemeColors.white,
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              collapsedShape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              collapsedBackgroundColor: AppColors.white,
                              title: CustomText(
                                text: ability.slot.name,
                                fontSize: Responsive.of(context)
                                    .diagonalResponsive(1.9),
                                fontWeight: FontWeight.w600,
                              ),
                              trailing: const Icon(Icons.arrow_drop_down,
                                  color: AppColors.black),
                              children: [
                                Row(
                                  children: [
                                    BuilderImage(
                                      height: 60,
                                      width: 60,
                                      image: ability.displayIcon,
                                      backgroundColor:
                                          AppColors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    gapW20,
                                    CustomText(
                                      text: ability.displayName,
                                      fontSize: Responsive.of(context)
                                          .diagonalResponsive(3),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                gapH12,
                                CustomText(
                                  text: ability.description,
                                  maxLines: 8,
                                ),
                                gapH12,
                              ]);
                        }),
                      )
                    ],
                  ),
                ),
                gapH48,
              ],
            ),
          );
        }),
      ),
    );
  }
}

class BannerDetail extends StatelessWidget {
  const BannerDetail({
    super.key,
    required this.size,
    required this.agent,
  });

  final Size size;
  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: size.width,
      child: Row(
        children: [
          BuilderImage(
            height: 300,
            width: size.width * 0.5,
            image: agent.fullPortrait,
            borderRadius: BorderRadius.circular(0),
          ),
          BuilderImage(
            height: 300,
            width: size.width * 0.5,
            image: agent.background,
            borderRadius: BorderRadius.circular(0),
            withGradient: true,
          ),
        ],
      ),
    );
  }
}

class BuilderImage extends StatelessWidget {
  const BuilderImage({
    super.key,
    required this.height,
    required this.width,
    this.image,
    this.borderRadius,
    this.backgroundColor,
    this.withGradient = false,
    this.withBoxShadow = false,
    this.begin,
    this.end,
  });

  final double height;
  final double width;
  final String? image;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool withGradient;
  final bool withBoxShadow;
  final Alignment? begin;
  final Alignment? end;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        gradient: withGradient
            ? LinearGradient(
                begin: begin ?? Alignment.centerLeft, // Punto de inicio
                end: end ?? Alignment.centerRight, // Punto final
                colors: [
                    Colors.white, // Color inicial
                    Colors.white54, //

                    AppColors.black.withOpacity(.5), // Color final
                  ],
                stops: const [
                    0.0,
                    0.02,
                    1.0
                  ])
            : null,
        boxShadow: withBoxShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 7),
                  blurRadius: 12,
                  spreadRadius: -3,
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          image ?? "",
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
    );
  }
}

import 'package:valoratapp/features/agents/infrastructure/models/agents_model.dart';

class Agent {
  String id;
  String name;
  String description;
  String developerName;
  List<String>? characterTags;
  String displayIcon;
  String? fullPortrait;
  String? background;
  List<String> backgroundGradientColors;
  bool isPlayableCharacter;
  Role? role;
  RecruitmentData? recruitmentData;
  List<Ability> abilities;
  dynamic voiceLine;

  Agent({
    required this.id,
    required this.name,
    required this.description,
    required this.developerName,
    this.characterTags,
    required this.displayIcon,
    required this.fullPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.isPlayableCharacter,
    required this.role,
    required this.recruitmentData,
    required this.abilities,
    required this.voiceLine,
  });
}

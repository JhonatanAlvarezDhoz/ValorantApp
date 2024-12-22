import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/infrastructure/models/agents_model.dart';

class AgentMapper {
  static Agent agentToEntity(AgentModel agentModel) => Agent(
        id: agentModel.uuid,
        name: agentModel.displayName,
        description: agentModel.description,
        developerName: agentModel.developerName,
        displayIcon: agentModel.displayIcon,
        fullPortrait: agentModel.fullPortrait,
        background: agentModel.background,
        backgroundGradientColors: agentModel.backgroundGradientColors,
        isPlayableCharacter: agentModel.isPlayableCharacter,
        role: agentModel.role,
        recruitmentData: agentModel.recruitmentData,
        abilities: agentModel.abilities,
        voiceLine: agentModel.voiceLine,
      );
}

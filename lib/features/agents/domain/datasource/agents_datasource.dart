import 'package:valoratapp/features/agents/domain/entities/agents.dart';

abstract class AgentsDatasource {
  Future<List<Agent>> getAgents();
}

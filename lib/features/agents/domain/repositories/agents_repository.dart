import 'package:valoratapp/features/agents/domain/entities/agents.dart';

abstract class AgentsRepository {
  Future<List<Agent>> getAgents();
}

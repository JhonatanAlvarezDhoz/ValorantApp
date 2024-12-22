import 'package:valoratapp/features/agents/domain/datasource/agents_datasource.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/domain/repositories/agents_repository.dart';

class AgentsRepositoryImpl extends AgentsRepository {
  final AgentsDatasource agentsDatasource;

  AgentsRepositoryImpl({required this.agentsDatasource});
  @override
  Future<List<Agent>> getAgents() {
    return agentsDatasource.getAgents();
  }
}

import 'package:valoratapp/core/usecases/use_case.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/domain/repositories/agents_repository.dart';

class UcGetAgentsNoParams extends UseCaseNoParams<List<Agent>> {
  final AgentsRepository agentsRepository;

  UcGetAgentsNoParams({required this.agentsRepository});
  @override
  Future<List<Agent>> call() async {
    final agentList = await agentsRepository.getAgents();

    return agentList;
  }
}

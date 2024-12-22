import 'package:get_it/get_it.dart';
import 'package:valoratapp/features/agents/domain/repositories/agents_repository.dart';
import 'package:valoratapp/features/agents/infrastructure/datasources/agents_datasource_valorant_api.dart';
import 'package:valoratapp/features/agents/infrastructure/repositories/agents_repository_impl.dart';
import 'package:valoratapp/features/agents/infrastructure/usecases/uc_get_agents.dart';
import 'package:valoratapp/features/agents/presentation/bloc/agent_bloc.dart';

final dependencyManager = GetIt.instance;

void setupAgentInjector() {
  // Repositorios
  dependencyManager.registerLazySingleton<AgentsRepository>(() =>
      AgentsRepositoryImpl(agentsDatasource: AgentsDatasourceValorantApi()));

  // Casos de uso
  dependencyManager.registerLazySingleton(
      () => UcGetAgentsNoParams(agentsRepository: dependencyManager()));

  // Bloc
  dependencyManager.registerFactory(
      () => AgentBloc(ucGetAgentsNoParams: dependencyManager()));
}

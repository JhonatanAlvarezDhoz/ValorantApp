// ignore_for_file: depend_on_referenced_packages

import 'package:provider/single_child_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valoratapp/features/agents/infrastructure/datasources/agents_datasource_valorant_api.dart';
import 'package:valoratapp/features/agents/infrastructure/repositories/agents_repository_impl.dart';
import 'package:valoratapp/features/agents/infrastructure/usecases/uc_get_agents.dart';
import 'package:valoratapp/features/agents/presentation/bloc/agent_bloc.dart';

class Injector {
  static List<SingleChildWidget> dependencies = [
    BlocProvider(
        create: (_) => AgentBloc(
            ucGetAgentsNoParams: UcGetAgentsNoParams(
                agentsRepository: AgentsRepositoryImpl(
                    agentsDatasource: AgentsDatasourceValorantApi())))),
  ];
}

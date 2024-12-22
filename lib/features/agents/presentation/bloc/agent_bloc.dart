import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/infrastructure/usecases/uc_get_agents.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  final UcGetAgentsNoParams ucGetAgentsNoParams;
  AgentBloc({required this.ucGetAgentsNoParams}) : super(const AgentState()) {
    on<GetAgentsEvent>(_getAgents);
  }

  void _getAgents(GetAgentsEvent event, Emitter<AgentState> emit) async {
    try {
      emit(state.copyWith(agentStatus: AgentStatus.loading));
      final List<Agent> agents = await ucGetAgentsNoParams.call();
      if (agents.runtimeType == List<Agent>) {
        emit(state.copyWith(agents: agents, agentStatus: AgentStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(
          agentStatus: AgentStatus.error, errorText: e.toString()));
    }
  }
}

part of 'agent_bloc.dart';

enum AgentStatus {
  initial,
  success,
  loading,
  error,
}

class AgentState extends Equatable {
  final AgentStatus agentStatus;
  final List<Agent> agents;
  final String message;
  final String errorText;

  const AgentState({
    this.agentStatus = AgentStatus.initial,
    this.agents = const [],
    this.message = "",
    this.errorText = "",
  });

  AgentState copyWith({
    AgentStatus? agentStatus,
    List<Agent>? agents,
    String? message,
    String? errorText,
  }) =>
      AgentState(
          agentStatus: agentStatus ?? this.agentStatus,
          agents: agents ?? this.agents,
          message: message ?? this.message,
          errorText: errorText ?? this.errorText);

  @override
  List<Object?> get props => [
        agentStatus,
        agentStatus,
        message,
        errorText,
      ];
}

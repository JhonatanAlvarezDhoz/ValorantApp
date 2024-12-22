import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/presentation/bloc/agent_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AgentBloc>().add(GetAgentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return BlocBuilder<AgentBloc, AgentState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.agents.length,
                itemBuilder: (context, index) {
                  final Agent agent = state.agents[index];
                  return Text(agent.name);
                });
          },
        );
      }),
    );
  }
}

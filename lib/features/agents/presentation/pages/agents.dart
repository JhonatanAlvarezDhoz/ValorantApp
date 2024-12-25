import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/presentation/bloc/agent_bloc.dart';
import 'package:valoratapp/features/agents/presentation/widgets/custom_card.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
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
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: ListView.builder(
                  itemCount: state.agents.length,
                  itemBuilder: (context, index) {
                    final Agent agent = state.agents[index];
                    return CustomCard(
                      agent: agent,
                      constraints: constraints,
                    );
                  }),
            );
          },
        );
      }),
    );
  }
}

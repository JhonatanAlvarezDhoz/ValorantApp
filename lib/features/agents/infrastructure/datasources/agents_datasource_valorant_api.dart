import 'package:dio/dio.dart';
import 'package:valoratapp/core/constants/enviroment.dart';
import 'package:valoratapp/core/constants/languaje.dart';
import 'package:valoratapp/core/exceptions/exceptions.dart';
import 'package:valoratapp/features/agents/domain/datasource/agents_datasource.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/infrastructure/mappers/agent_mapper.dart';
import 'package:valoratapp/features/agents/infrastructure/models/agents_model.dart';

class AgentsDatasourceValorantApi extends AgentsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.valorantBaseUrl,
      queryParameters: {
        'language': Language.english,
      },
    ),
  );

  @override
  Future<List<Agent>> getAgents() async {
    final response = await dio.get('agents');

    if (response.statusCode == 404) {
      throw NotFoundException('La consulta o la url no existe');
    }

    if (response.statusCode != 200) {
      throw ServerException('Error del servidor',
          code: response.statusCode.toString(), details: response.data);
    }

    final agentsDbResponse = AgentsModels.fromJson(response.data);

    final List<Agent> agents = agentsDbResponse.data
        .map((agent) => AgentMapper.agentToEntity(agent))
        .toList();

    return agents;
  }
}

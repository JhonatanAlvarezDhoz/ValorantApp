import 'package:get_it/get_it.dart';
import 'package:valoratapp/features/agents/agents_injector.dart';

final dependencyManager = GetIt.instance;

void setupInjector() {
  // Configuración global
  // Aquí puedes agregar dependencias compartidas (core, servicios, etc.)

  // Configuración por feature
  setupAgentInjector();
}

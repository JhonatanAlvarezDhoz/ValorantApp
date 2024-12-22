import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:valoratapp/bloc_injector.dart';
import 'package:valoratapp/core/config/router/app_router.dart';
import 'package:valoratapp/getit_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupInjector();
  runApp(const MainAppInjection());
}

class MainAppInjection extends StatelessWidget {
  const MainAppInjection({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Injector.dependencies,
      child: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: AppRouter.router,
      // theme: customTheme,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      // locale: LanguageManager().currentLocale,
      // localizationsDelegates: const <LocalizationsDelegate>[
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   DefaultMaterialLocalizations.delegate,
      //   DefaultWidgetsLocalizations.delegate,
      // ],
      supportedLocales: const <Locale>[
        Locale('es', ''),
        Locale('en', ''),
      ],
      // initialRoute: AppRoutes.splash,
      // onGenerateRoute: AppPages.routes,
    );
  }
}

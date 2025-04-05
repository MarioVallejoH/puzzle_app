import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natakapp/config/router/app_router.dart';
import 'package:natakapp/config/router/routes.dart';
import 'package:natakapp/config/theme/themes.dart';
import 'package:natakapp/core/layouts/main_page_layout.dart';
import 'package:natakapp/core/locator.dart';
import 'package:natakapp/core/service/navigation_service.dart';
import 'package:natakapp/core/views/page_404.dart';
import 'package:natakapp/features/game2/presentation/bloc/game2_bloc_bloc.dart';

import 'features/word-search/presentation/bloc/word_search_bloc.dart';

void main() {
  setupLocator();
  AppRouter.configureRouter();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WordSearchBloc()),
        BlocProvider(create: (_) => Game2BlocBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: Routes.wordSearch,
        onGenerateRoute: AppRouter.router.generator,
        navigatorKey: locator<NavigationService>().navigatorKey,
        builder: (context, child) {
          return MainPageLayout(child: child ?? const Page404());
        },
      ),
    );
  }
}

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:natakapp/config/router/routes.dart';
import 'package:natakapp/core/views/page_404.dart';
import 'package:natakapp/features/word-search/presentation/word_search_main_screen.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRouter() {
    router.define(
      Routes.wordSearch,
      handler: _wordSearchHandler,
      transitionType: transition,
    );

    router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        return Page404();
      },
    );
  }

  static TransitionType get transition =>
      kIsWeb ? TransitionType.fadeIn : TransitionType.cupertino;

  static final Handler _wordSearchHandler = Handler(
    handlerFunc: (context, params) {
      return WordSearchMainScreen();
    },
  );
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:for_lily/core/app_router.dart';
import 'package:for_lily/core/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              height: constraints.maxHeight,
              width: min(constraints.maxWidth, 350),
              child: MaterialApp.router(
                routerConfig: appRouter.config(),
                theme: buildTheme(),
                debugShowCheckedModeBanner: false,
              )
            )
          );
        }
      )
    );
  }
}
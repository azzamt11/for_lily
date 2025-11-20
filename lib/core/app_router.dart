import 'package:auto_route/auto_route.dart';
import 'package:for_lily/features/autdio_player_screen.dart';
import 'package:for_lily/features/loading_screen.dart';
import 'package:for_lily/features/first_screen.dart';
import 'package:for_lily/features/second_screen.dart';
import 'package:for_lily/features/third_screen.dart';
import 'package:for_lily/features/fourth_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
      AutoRoute(
        page: LoadingRoute.page,
        path: '/',
        initial: true,
      ),

      AutoRoute(
        page: FirstRoute.page,
        path: '/first',
      ),

      AutoRoute(
        page: SecondRoute.page,
        path: '/second',
      ),

      AutoRoute(
        page: ThirdRoute.page,
        path: '/third',
      ),

      AutoRoute(
        page: FourthRoute.page,
        path: '/fourth',
      ),
  ];
}
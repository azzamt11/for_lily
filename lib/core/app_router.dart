import 'package:auto_route/auto_route.dart';
import 'package:for_lily/features/loading_screen.dart';
import 'package:for_lily/features/first_screen.dart';

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
        path: '/login',
      ),

      //AutoRoute(
        //page: MainRoute.page,
        //path: '/main',
      //),
  ];
}
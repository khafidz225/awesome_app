import 'package:awesome_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../di/depedency_injection.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static List<RouteBase> routes = [
    GoRoute(
      path: _Paths.HOME,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: MultiBlocProvider(providers: [
          BlocProvider.value(value: locator<HomeBloc>()),
        ], child: const HomePage()),
      ),
    ),
  ];
}

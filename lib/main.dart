import 'package:awesome_app/core/di/depedency_injection.dart';
import 'package:awesome_app/core/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await setupLocator();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Awesome App',
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: Routes.HOME,
        routes: AppPages.routes,
      ),
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
    );
  }
}

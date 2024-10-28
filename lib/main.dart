import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kouple_app/app/routes/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // load env
  // dotenv.load(fileName: ".env");

  //init supabase
  await supabaseInit();
  debugPrint('supabase init');
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

dynamic supabaseInit() async {
  String projectUrl = 'https://wvhpgofxslgifrttiqun.supabase.co';
  String supabseApiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2aHBnb2Z4c2xnaWZydHRpcXVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI2MDgxODgsImV4cCI6MjAzODE4NDE4OH0.-kKmbs6BPO06okaD731_f3eGqQjciqReNV9dSFZdsMM';
  await Supabase.initialize(url: projectUrl, anonKey: supabseApiKey);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}

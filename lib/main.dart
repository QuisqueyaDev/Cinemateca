import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinemateca/config/theme/app_theme.dart';
import 'package:cinemateca/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/widgets/widgets.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: Cinemateca()));
}

class Cinemateca extends StatelessWidget {
  const Cinemateca({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // title:
      //     'Cinemateca', //este es el titulo que asume la aplicación vista desde Android/Iphone
      theme: AppTheme().getTheme(),
      home: const Scaffold(
        body: HomeScreen(),
        bottomNavigationBar: CustomNavitationBar(),
      ),
      // darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}

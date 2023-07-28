import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polkadot_flutter/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DCY CRYPTO WALLET',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Archivo',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartAdvertPage(),
        '/setup': (context) => const SetupWalletPage(),
        '/import-wallet': (context) => const ImportFromSeedPage(),
        '/create-wallet': (context) => const CreateNewWalletPage(),
        '/secure-wallet': (context) => const SecureYourWalletPage(),
      },
    );
  }
}

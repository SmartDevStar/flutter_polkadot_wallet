import 'package:flutter/material.dart';

class SetupWalletPage extends StatefulWidget {
  const SetupWalletPage({Key? key}) : super(key: key);

  @override
  State<SetupWalletPage> createState() => _SetupWalletPageState();
}

class _SetupWalletPageState extends State<SetupWalletPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFF080A0C),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(height: 90.0),
                Image.asset('assets/meta/setup_wallet.png'),
                const SizedBox(height: 20.0),
                const Text(
                  'Wallet Setup',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/import-wallet');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff202832),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Text(
                      'Import Using Seed Phrase',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create-wallet');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF8AD4EC),
                          Color(0xFFEF96FF),
                          Color(0xFFFF56A9),
                          Color(0xFFFFAA6C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Text(
                      'Create a New Wallet',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          )),
    );
  }
}

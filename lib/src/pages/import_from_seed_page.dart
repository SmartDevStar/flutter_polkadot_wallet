import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:polkadot_flutter/components.dart';

class ImportFromSeedPage extends StatefulWidget {
  const ImportFromSeedPage({Key? key}) : super(key: key);

  @override
  State<ImportFromSeedPage> createState() => _ImportFromSeedPageState();
}

class _ImportFromSeedPageState extends State<ImportFromSeedPage> {
  final ValueNotifier<String> _seedPhrase = ValueNotifier<String>('');
  final ValueNotifier<String> _newPassword = ValueNotifier<String>('');
  final ValueNotifier<String> _confirmPassword = ValueNotifier<String>('');
  final ValueNotifier<bool> _withFaceID = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _showNewPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _showConfirmPassword = ValueNotifier<bool>(true);

  late final TextEditingController _seedPhraseController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _seedPhraseController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF080A0C),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Import From Seed',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _seedPhraseController,
                  maxLines: null,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF181E25)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFF181E25))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color:
                                Color(0xFF181E25)), // Set focused border color
                        borderRadius: BorderRadius.circular(15)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Seed Phrase',
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Color(0xFF6A84A0)),
                    suffixIcon: DcyIconButton(
                      size: 25,
                      tooltip: 'Show',
                      onTap: () async {},
                      icon: Icons.visibility_outlined,
                      enabledColor: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    _seedPhrase.value = value;
                  },
                ),
                const SizedBox(height: 35.0),
                TextField(
                  controller: _newPasswordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF181E25)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFF181E25))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color:
                                Color(0xFF181E25)), // Set focused border color
                        borderRadius: BorderRadius.circular(15)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'New Password',
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Color(0xFF6A84A0)),
                    suffixIcon: DcyIconButton(
                      size: 25,
                      tooltip: 'Show',
                      onTap: () async {
                        _showNewPassword.value = !_showNewPassword.value;
                        setState(() {});
                      },
                      icon: Icons.visibility_outlined,
                      enabledColor: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    _newPassword.value = value;
                  },
                  obscureText: _showNewPassword.value,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Must be at least 8 characters',
                    style: TextStyle(color: Color(0xFF6A84A0), fontSize: 12),
                  ),
                ),
                const SizedBox(height: 35.0),
                TextField(
                  controller: _confirmPasswordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF181E25)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFF181E25))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color:
                                Color(0xFF181E25)), // Set focused border color
                        borderRadius: BorderRadius.circular(15)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Confirm Password',
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Color(0xFF6A84A0)),
                    suffixIcon: DcyIconButton(
                      size: 25,
                      tooltip: 'Show',
                      onTap: () async {
                        _showConfirmPassword.value =
                            !_showConfirmPassword.value;
                        setState(() {});
                      },
                      icon: Icons.visibility_outlined,
                      enabledColor: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    _confirmPassword.value = value;
                  },
                  obscureText: _showConfirmPassword.value,
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Sign in with Face ID?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Switch(
                      value: _withFaceID.value,
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xFF3D8DFF),
                      onChanged: (value) {
                        _withFaceID.value = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                RichText(
                  text: const TextSpan(
                    text: 'By proceeding, you agree to these ',
                    style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Term and Conditions',
                        style: TextStyle(
                          color: Color(0xFF5F97FF), // desired color
                          decoration: TextDecoration
                              .underline, // desired underline style
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150.0),
                _buildImportButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImportButton() {
    return MultiValueListenableBuilder(
      valueListenables: [
        _seedPhrase,
        _newPassword,
        _confirmPassword,
      ],
      builder: (context, values, _) {
        bool isAvailableToImport = _seedPhrase.value.isNotEmpty &&
            _newPassword.value.isNotEmpty &&
            _confirmPassword.value.isNotEmpty &&
            _newPassword.value.length >= 8 &&
            _confirmPassword.value.length >= 8 &&
            _newPassword.value == _confirmPassword.value;
        return isAvailableToImport
            ? TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/wallet-main');
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
                    'Import',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              )
            : TextButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff202832),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Text(
                    'Import',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              );
      },
    );
  }
}

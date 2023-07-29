import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:polkadot_flutter/components.dart';

class CreateNewWalletPage extends StatefulWidget {
  const CreateNewWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateNewWalletPage> createState() => _CreateNewWalletPageState();
}

class _CreateNewWalletPageState extends State<CreateNewWalletPage> {
  final ValueNotifier<String> _newPassword = ValueNotifier<String>('');
  final ValueNotifier<String> _confirmPassword = ValueNotifier<String>('');
  final ValueNotifier<bool> _withFaceID = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _showNewPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _showConfirmPassword = ValueNotifier<bool>(true);
  bool _understand = false;

  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

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
          title: const DcyStepLine(step: 1),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'Create Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        'This password will unlock your Metamask wallet only on this service',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8FA2B7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
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
                      onTap: () {
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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Password strength: ',
                      style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Good',
                          style: TextStyle(
                            color: Color(0xFF76E268), // desired color
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
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
                      onTap: () {
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
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Must be at least 8 characters',
                    style: TextStyle(color: Color(0xFF6A84A0), fontSize: 12),
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _understand,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color(0xFF3D8DFF).withOpacity(.32);
                        }
                        return const Color(0xFF3D8DFF);
                      }),
                      onChanged: (value) {
                        setState(() {
                          _understand = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text:
                              'I understand that DeGe cannot recover this password for me. ',
                          style:
                              TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Learn more',
                              style: TextStyle(
                                color: Color(0xFF5F97FF), // desired color
                                decoration: TextDecoration
                                    .underline, // desired underline style
                              ),
                            ),
                          ],
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100.0),
                _buildCreateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateButton() {
    return MultiValueListenableBuilder(
      valueListenables: [
        _newPassword,
        _confirmPassword,
      ],
      builder: (context, values, _) {
        bool isAvailableToSubmit = _newPassword.value.isNotEmpty &&
            _confirmPassword.value.isNotEmpty &&
            _newPassword.value.length >= 8 &&
            _confirmPassword.value.length >= 8 &&
            _understand &&
            _newPassword.value == _confirmPassword.value;
        return isAvailableToSubmit
            ? TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secure-wallet');
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
                    'Create Password',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              )
            : TextButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff202832),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Text(
                    'Create Password',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              );
      },
    );
  }
}

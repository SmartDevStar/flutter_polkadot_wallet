import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:polkadot_flutter/components.dart';

class SecureYourWalletPage extends StatefulWidget {
  const SecureYourWalletPage({Key? key}) : super(key: key);

  @override
  State<SecureYourWalletPage> createState() => _SecureYourWalletPageState();
}

class _SecureYourWalletPageState extends State<SecureYourWalletPage> {
  final PageController _pageController = PageController();
  int _currentPageIdx = 0;
  bool _viewSeeds = false;
  final ValueNotifier<String> _confirmSeed = ValueNotifier<String>('');

  final List<String> _seeds = [
    'future',
    'use',
    'abuse',
    'bubble',
    'disagree',
    'yard',
    'exit',
    'enact',
    'drum',
    'frequent',
    'target',
    'organ'
  ];

  final List<String> _confirmSeeds = [
    'future',
    'bubble',
    'disagree',
    'yard',
    'exit',
    'organ'
  ];

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
              goToPrevPage();
            },
          ),
          title: DcyStepLine(step: _currentPageIdx < 3 ? 2 : 3),
          centerTitle: true,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildSecureWallet1(),
              _buildSecureWallet2(),
              _buildSecureWallet3(),
              _buildConfirmSeedPhrase(3, 0),
              _buildConfirmSeedPhrase(6, 1),
              _buildConfirmSeedPhrase(8, 2),
              _buildSecureSuccess(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecureWallet1() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(height: 30.0),
            Image.asset('assets/meta/safe_security.png'),
            const SizedBox(height: 30.0),
            const Text(
              'Secure Your Wallet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 35.0),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  text:
                      'Don\'t risk losing your funds. protect your wallet by saving your ',
                  style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Seed phrase',
                      style: TextStyle(
                        color: Color(0xFF5F97FF), // desired color
                        decoration:
                            TextDecoration.underline, // desired underline style
                      ),
                    ),
                    TextSpan(
                      text: ' in a place you trust.',
                      style: TextStyle(
                        color: Color(0xFF8FA2B7),
                      ),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
            ),
            const Text(
              'It\'s the only way to recover your wallet if you get locked out of the app or get a new device.',
              style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Remind Me Later',
              style: TextStyle(
                color: Color(0xFF5F97FF),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                goToNextPage();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
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
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSecureWallet2() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                child: const Text(
                  'Secure Your Wallet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            RichText(
              text: const TextSpan(
                text: 'Secure your wallet\'s " ',
                style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Seed Phrase',
                    style: TextStyle(
                      color: Color(0xFF5F97FF), // desired color
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '"',
                    style: TextStyle(
                      color: Color(0xFF8FA2B7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Manual',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Write down your seed phrase on a piece of paper and store in a safe place.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30.0),
            RichText(
              text: const TextSpan(
                text: 'Security level: ',
                style: TextStyle(color: Colors.white, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Very strong',
                    style: TextStyle(
                      color: Colors.white, // desired color
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            const DcySecurityLevelLine(level: 3),
            const SizedBox(height: 30.0),
            const Text(
              'Risks are:',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 7.0),
            const Text(
              '- You lose it',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 7.0),
            const Text(
              '- You forget where you put it',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 7.0),
            const Text(
              '- Someone else finds it',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Other options: Doesn\'t have to be paper!',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Tips:',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 7.0),
            const Text(
              '- Store in bank vault',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 7.0),
            const Text(
              '- Store in a safe',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 7.0),
            const Text(
              '- Store in multiple secret places',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                goToNextPage();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
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
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecureWallet3() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                child: const Text(
                  'Write Down Your Seed Phrase',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'This is your seed phrase. Write it down on a paper and keep it in a safe place. You\'ll be asked to re-enter this phrase (in order) on the next step.',
              style: TextStyle(
                color: Color(0xFF8FA2B7),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50.0),
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white10,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: _buildSeedPhraseButtons(_seeds),
                ),
                if (!_viewSeeds)
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        height: 375,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Tap to reveal your sead phrase',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Text(
                              'Make sure no one is watching your screen',
                              style: TextStyle(
                                color: Color(0xFF8FA2B7),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            GestureDetector(
                              onTap: () => {
                                setState(() {
                                  _viewSeeds = true;
                                })
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                width: 100,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF202832),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.visibility_outlined,
                                      color: Color(0xFF3D8DFF),
                                    ),
                                    SizedBox(width: 10.0, height: 0.0),
                                    Text(
                                      'Veiw',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 60.0),
            _viewSeeds
                ? TextButton(
                    onPressed: () {
                      goToNextPage();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
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
                        'Next',
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
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmSeedPhrase(int seedIdx, int stepIdx) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                'Confirm Seed Phrase',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                'Select each word in the order it was presented to you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40.0),
            ValueListenableBuilder<String>(
                valueListenable: _confirmSeed,
                builder: (context, value, _) {
                  if (value.isEmpty) {
                    return Text(
                      '$seedIdx.',
                      style: const TextStyle(
                        color: Color(0xFF6A84A0),
                        fontSize: 40,
                      ),
                    );
                  } else {
                    return ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        '$seedIdx. $value',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                }),
            const SizedBox(height: 50.0),
            _buildConfirmSeedStepLine(stepIdx),
            Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white10,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: _buildConfirmSeedPhraseButtons(_confirmSeeds),
            ),
            const SizedBox(height: 40.0),
            ValueListenableBuilder<String>(
              valueListenable: _confirmSeed,
              builder: (context, value, _) {
                if (value.isEmpty) {
                  return TextButton(
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
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  );
                } else {
                  return TextButton(
                    onPressed: () {
                      goToNextPage();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
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
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecureSuccess() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/meta/success.png'),
            const SizedBox(height: 15.0),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: const Text(
                'Success!',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'You\'ve successfully protected your wallet. Remember to keep your seed phrase safe, it\'s your responsibility!',
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 120.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wallet-main');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
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
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToNextPage() {
    _currentPageIdx++;
    if (_currentPageIdx > 6) {
      _currentPageIdx = 6;
      return;
    }
    _pageController.animateToPage(
      _currentPageIdx,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    _confirmSeed.value = '';
    setState(() {});
  }

  void goToPrevPage() {
    _currentPageIdx -= 1;
    if (_currentPageIdx < 0) {
      Navigator.pop(context);
    } else {
      _pageController.animateToPage(
        _currentPageIdx,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      _confirmSeed.value = '';
      setState(() {});
    }
  }

  Widget _buildSeedPhraseButtons(List<String> seeds) {
    List<Widget> leftSeedBtns =
        List<Widget>.generate((seeds.length / 2).ceil(), (index) {
      return Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF181E25),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          '${index + 1}. ${seeds[index]}',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    });

    List<Widget> rightSeedBtns =
        List<Widget>.generate((seeds.length / 2).ceil(), (index) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: MediaQuery.of(context).size.width * 0.35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF181E25),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          '${index + 7}. ${seeds[index + 6]}',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: leftSeedBtns,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rightSeedBtns,
        ),
      ],
    );
  }

  Widget _buildConfirmSeedPhraseButtons(List<String> confirmSeeds) {
    List<Widget> topSeedBtns =
        List<Widget>.generate((confirmSeeds.length / 2).ceil(), (index) {
      return GestureDetector(
        onTap: () {
          _confirmSeed.value = confirmSeeds[index];
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF181E25),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            confirmSeeds[index],
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    });

    List<Widget> bottomSeedBtns =
        List<Widget>.generate((confirmSeeds.length / 2).ceil(), (index) {
      return GestureDetector(
        onTap: () {
          _confirmSeed.value = confirmSeeds[index + 3];
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF181E25),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            confirmSeeds[index + 3],
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: topSeedBtns,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bottomSeedBtns,
        ),
      ],
    );
  }

  Widget _buildConfirmSeedStepLine(int step) {
    List<Widget> stepLines = List<Widget>.generate(3, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 50,
        height: 2,
        decoration: BoxDecoration(
          color:
              index < step ? const Color(0xFF3D8DFF) : const Color(0xFF101419),
          shape: BoxShape.rectangle,
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stepLines,
    );
  }
}

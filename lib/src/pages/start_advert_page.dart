import 'package:flutter/material.dart';

class StartAdvertPage extends StatefulWidget {
  const StartAdvertPage({Key? key}) : super(key: key);

  @override
  State<StartAdvertPage> createState() => _StartAdvertPageState();
}

class _StartAdvertPageState extends State<StartAdvertPage> {
  int _activePage = 0;
  bool _showAdvertText = true;
  late PageController _pageController;

  final List<String> _images = [
    'assets/meta/property_diversity.png',
    'assets/meta/safe_security.png',
    'assets/meta/convenient_transaction.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _activePage);
  }

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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: PageView.builder(
                  itemCount: _images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) async {
                    setState(() {
                      _showAdvertText = false;
                    });
                    Future.delayed(const Duration(milliseconds: 210), () {
                      setState(() {
                        _activePage = page;
                        _showAdvertText = true;
                      });
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(_images[pagePosition]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              AnimatedOpacity(
                opacity: _showAdvertText ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutExpo,
                child: _buildAdvertTextWidget(),
              ),
              const SizedBox(height: 70.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(_images.length, _activePage),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setup');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 125.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff202832),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Text(
                    'Get Start',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xFF3D8DFF)
                : const Color(0xFF384657),
            shape: BoxShape.circle),
      );
    });
  }

  Widget _buildAdvertTextWidget() {
    return _activePage == 0
        ? _buildPropertyAdvertTextWidget()
        : _activePage == 1
            ? _buildSafeAdvertTextWidget()
            : _buildConvenientAdvertTextWidget();
  }

  Widget _buildPropertyAdvertTextWidget() {
    return Column(
      children: <Widget>[
        const Text(
          'Property',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF8AD4EC),
                Color(0xFFEF96FF),
                Color(0xFFFF56A9),
                Color(0xFFFFAA6C)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          child: const Text(
            'Diversity',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSafeAdvertTextWidget() {
    return Column(
      children: <Widget>[
        const Text(
          'Safe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF8AD4EC),
                Color(0xFFEF96FF),
                Color(0xFFFF56A9),
                Color(0xFFFFAA6C)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          child: const Text(
            'Security',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConvenientAdvertTextWidget() {
    return Column(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF8AD4EC),
                Color(0xFFEF96FF),
                Color(0xFFFF56A9),
                Color(0xFFFFAA6C)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          child: const Text(
            'Convenient',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const Text(
          'Transaction',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(_animationController)
      ..addListener(() {});
    _animationController.forward();

    navigateToLogin();
  }

  void navigateToLogin() async {
    // Add a delay to simulate waiting for 3 seconds (as in your example).
    await Future.delayed(const Duration(seconds: 5));

    // Check if the context is still mounted before navigating.
    if (mounted) {
      context.go("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: redColor,
        ),
        child: Align(
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText(
                "YOUR VERY OWN MENTOR",
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ghostWhite,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: redColor,
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: "FUTURE",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.1,
                color: ghostWhite,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "me.",
                  style: TextStyle(
                    color: black,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    // _controller.dispose();
  }
}

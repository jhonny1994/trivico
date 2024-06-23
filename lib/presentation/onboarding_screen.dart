import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivico/presentation/home_screen.dart';
import 'package:trivico/utils/constants.dart';
import 'package:trivico/utils/extensions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              const Spacer(flex: 3),
              ClipOval(
                child: Container(
                  height: context.width - kDefaultPadding.horizontal,
                  width: context.width - kDefaultPadding.horizontal,
                  color: Colors.white,
                  child: SvgPicture.asset('assets/question.svg'),
                ),
              ),
              const Spacer(),
              Text(
                'Embark on the ultimate quiz adventure!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => context.navigator.pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                ),
                iconSize: 56,
                padding: EdgeInsets.zero,
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

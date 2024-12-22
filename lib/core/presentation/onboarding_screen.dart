import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trivico/core/providers/providers.dart';
import 'package:trivico/core/utils/utils.dart';
import 'package:trivico/core/widgets/widgets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  bool _isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          AnimatedThemeToggle(),
        ],
      ),
      body: Padding(
        padding: kContentPadding,
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _isLastPage = index == 2;
                  });
                },
                children: const [
                  _OnboardingPage(
                    image: 'assets/svg/question.svg',
                    title: 'Embark on the ultimate quiz adventure!',
                    description:
                        'Challenge yourself with trivia questions from various categories.',
                  ),
                  _OnboardingPage(
                    image: 'assets/svg/trophy.svg',
                    title: 'Test your knowledge',
                    description:
                        'Choose your difficulty level and compete against yourself.',
                  ),
                  _OnboardingPage(
                    image: 'assets/svg/learn.svg',
                    title: 'Learn and grow',
                    description: 'Expand your knowledge while having fun!',
                  ),
                ],
              ),
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                spacing: 16,
                dotColor: context.colorScheme.surfaceContainerHighest,
                activeDotColor: context.colorScheme.secondary,
              ),
              onDotClicked: (index) => _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                if (_isLastPage) {
                  ref.read(onboardingNotifierProvider.notifier).toggle();
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                }
              },
              iconSize: 56,
              padding: EdgeInsets.zero,
              icon: Container(
                padding: kDefaultPadding,
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(kLargeBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow
                          .withValues(alpha: kSecondaryOpacity),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  _isLastPage ? Icons.done : Icons.keyboard_arrow_right,
                  color: context.colorScheme.onSecondary,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: context.width * 0.6,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: UIDecorations.circularDecoration(
              context,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: SvgPicture.asset(
                image,
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/utils/utils.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    required this.failure,
    required this.onRetry,
    super.key,
  });

  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: kContentPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: kContentPadding,
                decoration: UIDecorations.circularDecoration(
                  context,
                  color: errorColor,
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: errorColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                failure.message!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: errorColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                style: UIButtons.primaryButton(
                  context,
                  color: errorColor,
                ),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

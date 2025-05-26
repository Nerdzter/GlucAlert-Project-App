// screens/onboarding_form_screen.dart
import 'package:flutter/material.dart';
import '../widgets/question_card.dart';
import '../controllers/form_controller.dart';

class OnboardingFormScreen extends StatefulWidget {
  const OnboardingFormScreen({super.key});

  @override
  State<OnboardingFormScreen> createState() => _OnboardingFormScreenState();
}

class _OnboardingFormScreenState extends State<OnboardingFormScreen> {
  final formController = FormController();

  @override
  Widget build(BuildContext context) {
    final question = formController.currentQuestion;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF007AFF)),
                    onPressed: () => setState(() => formController.goBack(context)),
                  ),
                  Expanded(
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: formController.progress),
                      duration: const Duration(milliseconds: 1300),
                      builder: (ctx, value, _) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          value: value,
                          minHeight: 8,
                          backgroundColor: Colors.grey[200],
                          color: const Color(0xFF007AFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    Text(
                      question.question,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    question.builder(context, (value) => setState(() => formController.submit(value, context))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

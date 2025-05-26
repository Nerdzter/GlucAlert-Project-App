import 'package:flutter/material.dart';
import '../widgets/mode_card.dart';
import '../screens/onboarding_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToFormSteps(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const OnboardingFormScreen(),
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Usamos Expanded para centralizar verticalmente o conteúdo principal
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Título da tela
                    Text(
                      'Bem-vindo ao GlucAlert',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Card: modo com gadget
                    ModeCard(
                      title: 'Tenho GlucAlert',
                      description: 'Conectar e monitorar em tempo real.',
                      icon: Icons.sensors,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    // Card: modo sem gadget
                    ModeCard(
                      title: 'Ainda não tenho',
                      description: 'Usar modo sem dispositivo.',
                      icon: Icons.assignment_outlined,
                      onTap: () => _navigateToFormSteps(context),
                    ),
                  ],
                ),
              ),
              // Rodapé com destaque para o nome do desenvolvedor
              Text.rich(
                TextSpan(
                  text: 'Desenvolvido por ',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'Nayderson',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

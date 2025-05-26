import 'package:flutter/material.dart';
import '../widgets/mode_card.dart';
import 'onboarding_form_screen.dart';
import 'home_main_screen.dart'; // tela com gadget
import 'form_insights_page.dart'; // tela sem gadget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showModeSelection = true; // mostra a tela inicial de seleção
  int currentIndex = 0; // índice do bottom nav

  final List<Widget> pages = const [
    HomeMainScreen(answers: {}), // aqui ainda é vazio, ajustaremos depois com dados reais
    FormInsightsPage(),
  ];

  void _enterWithGadget() {
    setState(() {
      showModeSelection = false;
      currentIndex = 0;
    });
  }

  void _enterWithoutGadget(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const OnboardingFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showModeSelection) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Bem-vindo ao GlucAlert',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ModeCard(
                        title: 'Tenho GlucAlert',
                        description: 'Conectar e monitorar em tempo real.',
                        icon: Icons.sensors,
                        onTap: _enterWithGadget,
                      ),
                      const SizedBox(height: 16),
                      ModeCard(
                        title: 'Ainda não tenho',
                        description: 'Usar modo sem dispositivo.',
                        icon: Icons.assignment_outlined,
                        onTap: () => _enterWithoutGadget(context),
                      ),
                    ],
                  ),
                ),
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

    // Interface principal com navegação inferior
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: 'Com Gadget'),
          BottomNavigationBarItem(icon: Icon(Icons.insights_outlined), label: 'Sem Gadget'),
        ],
      ),
    );
  }
}

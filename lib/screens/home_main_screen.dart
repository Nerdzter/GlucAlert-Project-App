import 'package:flutter/material.dart';
import '../widgets/grafico.dart';

class HomeMainScreen extends StatelessWidget {
  final Map<String, dynamic> answers;

  const HomeMainScreen({super.key, required this.answers});

  static Route routeWithAnswers(Map<String, dynamic> answers) {
    return MaterialPageRoute(
      builder: (_) => HomeMainScreen(answers: answers),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String nome = answers['nome'] ?? 'Usuário';
    final String heartRate = answers['batimentos']?.toString() ?? '-';
    final String spo2 = answers['spo2']?.toString() ?? '-';
    final String sono = answers['horas_sono']?.toString() ?? '-';
    final String agua = answers['agua']?.toString() ?? '-';
    final String atividade = answers['atividade_fisica'] ?? 'Não informado';

    return Scaffold(
      appBar: AppBar(
        title: const Text('GlucAlert'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(Icons.settings, size: 30),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Olá, $nome',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            const Text('Saúde', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    title: const Text('Batimentos Cardíacos'),
                    trailing: Text('$heartRate bpm', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.water_drop, color: Colors.blue),
                    title: const Text('Saturação de Oxigênio'),
                    trailing: Text('$spo2 %', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            const Text('Análise de Glicose', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
                height: 360,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(child: Grafico()),
                    SizedBox(height: 12),
                    Text('Hipoglicemia detectada', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Procure orientação médica.'),
                  ],
                ),
              ),


            const SizedBox(height: 32),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: const Text('EXPORTAR PDF', style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 32),

            const Text('📋 Outros Dados Estimados (baseados no formulário)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sono médio: $sono h'),
                  Text('Ingestão de água: $agua copos/dia'),
                  Text('Atividade física: $atividade'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('📟 Dados do Gadget (em breve)', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Conecte o dispositivo para visualizar os gráficos em tempo real.'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        onTap: (index) {
          // Navegação futura
        },
      ),
    );
  }
}

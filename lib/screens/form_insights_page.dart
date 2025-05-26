import 'package:flutter/material.dart';

class FormInsightsPage extends StatelessWidget {
  const FormInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Aqui futuramente puxaremos os dados reais do formulário
    final String sono = '-';
    final String agua = '-';
    final String atividade = 'Não informado';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sem Gadget'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '📝 Seus Dados Estimados',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
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

          const Text(
            '🔔 Alertas e Recomendações',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('⚠️ Sono insuficiente pode impactar sua glicose.'),
                SizedBox(height: 8),
                Text('💧 Beba pelo menos 6 copos de água por dia.'),
                SizedBox(height: 8),
                Text('🏃 Atividades leves como caminhada são recomendadas.'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            '📤 Relatório PDF',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              // gerarRelatorioPDF(answers);
            },
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('Exportar Relatório Estimado'),
          ),
        ],
      ),
    );
  }
}

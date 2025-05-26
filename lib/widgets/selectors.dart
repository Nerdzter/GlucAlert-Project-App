import 'package:flutter/material.dart';

class YesNoSelector extends StatelessWidget {
  final void Function(String) onChange;
  const YesNoSelector({required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['Sim', 'Não'].map((label) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () => onChange(label),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF007AFF),
              side: const BorderSide(color: Color(0xFF007AFF)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(label, style: const TextStyle(fontSize: 18)),
          ),
        );
      }).toList(),
    );
  }
}

class GridChoiceSelector extends StatelessWidget {
  final List<String> options;
  final void Function(String) onChange;
  const GridChoiceSelector({required this.options, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2.5,
      children: options.map((opt) {
        return ElevatedButton(
          onPressed: () => onChange(opt),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF007AFF),
            side: const BorderSide(color: Color(0xFF007AFF)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          ),
          child: Text(opt, textAlign: TextAlign.center),
        );
      }).toList(),
    );
  }
}

// widgets/question_card.dart
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final void Function(String) onChange;
  const TextInputField({required this.onChange, super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            controller: _controller,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              hintText: 'Digite aqui',
              hintStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final value = _controller.text.trim();
            if (value.isNotEmpty) widget.onChange(value);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007AFF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          child: const Text("Continuar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

class ChoiceSelector extends StatelessWidget {
  final List<String> options;
  final void Function(String) onChange;
  const ChoiceSelector({required this.options, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2.5,
      physics: const NeverScrollableScrollPhysics(),
      children: options.map((opt) {
        return ElevatedButton(
          onPressed: () => onChange(opt),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF007AFF),
            side: const BorderSide(color: Color(0xFF007AFF)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          ),
          child: Text(opt, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        );
      }).toList(),
    );
  }
}

class SliderInputWithButton extends StatefulWidget {
  final int min;
  final int max;
  final int initial;
  final String labelSuffix;
  final void Function(double) onChanged;
  const SliderInputWithButton({required this.min, required this.max, required this.initial, required this.labelSuffix, required this.onChanged, super.key});

  @override
  State<SliderInputWithButton> createState() => _SliderInputWithButtonState();
}

class _SliderInputWithButtonState extends State<SliderInputWithButton> {
  late double _value;

  @override
  void initState() {
    _value = widget.initial.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${_value.toInt()}${widget.labelSuffix}', style: const TextStyle(fontSize: 20)),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF007AFF),
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: const Color(0xFF007AFF),
            overlayColor: const Color(0x33007AFF),
          ),
          child: Slider(
            value: _value,
            min: widget.min.toDouble(),
            max: widget.max.toDouble(),
            divisions: widget.max - widget.min,
            label: '${_value.toInt()}${widget.labelSuffix}',
            onChanged: (val) => setState(() => _value = val),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => widget.onChanged(_value),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007AFF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          child: const Text("Continuar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

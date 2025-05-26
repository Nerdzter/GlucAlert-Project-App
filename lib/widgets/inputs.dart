import 'package:flutter/material.dart';

class TextInputFieldWithButton extends StatefulWidget {
  final void Function(String) onChanged;
  final String label;

  const TextInputFieldWithButton({required this.onChanged, required this.label, super.key});

  @override
  State<TextInputFieldWithButton> createState() => _TextInputFieldWithButtonState();
}

class _TextInputFieldWithButtonState extends State<TextInputFieldWithButton> {
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
            decoration: InputDecoration(
              hintText: widget.label,
              hintStyle: const TextStyle(color: Colors.grey),
              border: const UnderlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => widget.onChanged(_controller.text),
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

class SliderInputWithButton extends StatefulWidget {
  final int min;
  final int max;
  final int initial;
  final String labelSuffix;
  final void Function(double) onChanged;

  const SliderInputWithButton({
    required this.min,
    required this.max,
    required this.initial,
    required this.labelSuffix,
    required this.onChanged,
    super.key,
  });

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

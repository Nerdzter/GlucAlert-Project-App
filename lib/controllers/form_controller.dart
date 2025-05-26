// controllers/form_controller.dart
import 'package:flutter/material.dart';
import '../widgets/question_card.dart';

class FormController {
  int _currentIndex = 0;
  final Map<String, dynamic> answers = {};

  final List<Question> allQuestions = [
    Question(
      key: 'name',
      question: 'Qual é o seu nome completo?',
      builder: (ctx, onChange) => TextInputField(onChange: onChange),
    ),
    Question(
      key: 'gender',
      question: 'Como você se identifica?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Feminino', 'Masculino', 'Não-binário', 'Prefiro não dizer', 'Outro'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'age',
      question: 'Qual sua idade?',
      builder: (ctx, onChange) => SliderInputWithButton(
        min: 10,
        max: 100,
        initial: 25,
        labelSuffix: ' anos',
        onChanged: (v) => onChange(v.toInt()),
      ),
    ),
    Question(
      key: 'height',
      question: 'Qual sua altura? (em cm)',
      builder: (ctx, onChange) => TextInputField(onChange: onChange),
    ),
    Question(
      key: 'weight',
      question: 'Qual seu peso? (em kg)',
      builder: (ctx, onChange) => TextInputField(onChange: onChange),
    ),
    Question(
      key: 'chronic_diseases',
      question: 'Você tem alguma condição crônica?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Hipertensão', 'Diabetes', 'Asma', 'Nenhuma'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'medication_use',
      question: 'Usa medicamentos regularmente?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Sim', 'Não'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'diet_type',
      question: 'Como você classificaria sua dieta?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Balanceada', 'Fast-food', 'Vegetariana', 'Outro'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'water_intake',
      question: 'Quantos litros de água você toma por dia?',
      builder: (ctx, onChange) => SliderInputWithButton(
        min: 0,
        max: 5,
        initial: 2,
        labelSuffix: ' litros',
        onChanged: (v) => onChange(v.toInt()),
      ),
    ),
    Question(
      key: 'sleep_hours',
      question: 'Quantas horas dorme por noite?',
      builder: (ctx, onChange) => SliderInputWithButton(
        min: 0,
        max: 12,
        initial: 7,
        labelSuffix: ' horas',
        onChanged: (v) => onChange(v.toInt()),
      ),
    ),
    Question(
      key: 'sleep_quality',
      question: 'Como é sua qualidade de sono?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Boa', 'Regular', 'Ruim', 'Não Sei'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'current_symptoms',
      question: 'Está sentindo algum sintoma agora?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Sim', 'Não'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'symptom_list',
      question: 'Quais sintomas você sente?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Dor de cabeça', 'Cansaço', 'Febre', 'Tontura', 'Falta de ar', 'Outros'],
        onChange: onChange,
      ),
      condition: (a) => a['current_symptoms'] == 'Sim',
    ),
    Question(
      key: 'stress_level',
      question: 'Nível de estresse atual?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Baixo', 'Moderado', 'Alto'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'mental_health',
      question: 'Como está sua saúde mental?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Boa', 'Regular', 'Ruim'],
        onChange: onChange,
      ),
    ),
    Question(
      key: 'goal',
      question: 'Qual seu objetivo principal com o app?',
      builder: (ctx, onChange) => ChoiceSelector(
        options: ['Acompanhar saúde', 'Bem-estar', 'Analisar saúde', 'Outro'],
        onChange: onChange,
      ),
    ),
  ];

  List<Question> get activeQuestions =>
      allQuestions.where((q) => q.condition == null || q.condition!(answers)).toList();

  double get progress => (_currentIndex + 1) / activeQuestions.length;

  Question get currentQuestion => activeQuestions[_currentIndex];

  void submit(dynamic value, BuildContext context) {
    final q = currentQuestion;
    answers[q.key] = value;
    if (_currentIndex < activeQuestions.length - 1) {
      _currentIndex++;
    } else {
      debugPrint('Finalizado: $answers');
      Navigator.pop(context, answers);
    }
  }

  void goBack(BuildContext context) {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      Navigator.pop(context);
    }
  }
}

class Question {
  final String key;
  final String question;
  final Widget Function(BuildContext, void Function(dynamic)) builder;
  final bool Function(Map<String, dynamic>)? condition;

  Question({
    required this.key,
    required this.question,
    required this.builder,
    this.condition,
  });
}

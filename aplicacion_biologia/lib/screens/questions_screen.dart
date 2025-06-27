import 'package:flutter/material.dart';
import '../widgets/question_card.dart';
import '../domain/list_questions.dart';
import '../domain/models.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<SurveyCategory> categories;
  int currentCategoryIndex = 0;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = ListQuestions.getSurveyCategories();
  }

  Question get currentQuestion {
    return categories[currentCategoryIndex].questions[currentQuestionIndex];
  }

  void _saveAnswer(int value) {
    setState(() {
      categories[currentCategoryIndex]
              .questions[currentQuestionIndex]
              .selectedValue =
          value;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex <
          categories[currentCategoryIndex].questions.length - 1) {
        currentQuestionIndex++;
      } else if (currentCategoryIndex < categories.length - 1) {
        currentCategoryIndex++;
        currentQuestionIndex = 0;
      } else {
        // Navegar a pantalla de resultados
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      } else if (currentCategoryIndex > 0) {
        currentCategoryIndex--;
        currentQuestionIndex =
            categories[currentCategoryIndex].questions.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = currentQuestion;
    final category = categories[currentCategoryIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text('Teero App', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pregunta ${currentQuestionIndex + 1} de ${category.questions.length} ',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: QuestionCard(
                question: question.text,
                category: question.category,
                imagePath: category.imagePath,
                currentValue: question.selectedValue,
                onChanged: _saveAnswer,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC34A),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _previousQuestion,
                  child: const Text('Anterior'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: question.selectedValue == null
                        ? Colors.grey
                        : const Color(0xFFFFC107),
                    foregroundColor: const Color(0xFF212121),
                  ),
                  onPressed: question.selectedValue == null
                      ? null
                      : _nextQuestion,
                  child: Text(
                    currentCategoryIndex == categories.length - 1 &&
                            currentQuestionIndex ==
                                category.questions.length - 1
                        ? 'Finalizar'
                        : 'Siguiente',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

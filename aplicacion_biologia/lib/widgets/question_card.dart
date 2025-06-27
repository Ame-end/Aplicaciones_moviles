import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String category;
  final String? imagePath;
  final int? currentValue;
  final ValueChanged<int> onChanged;

  const QuestionCard({
    super.key,
    required this.question,
    required this.category,
    this.imagePath,
    required this.currentValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath != null && imagePath!.isNotEmpty)
              Padding(padding: const EdgeInsets.only(bottom: 16)),
            Text(
              category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF8BC34A),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOption(1, 'Mucho'),
                _buildOption(2, 'Poco'),
                _buildOption(3, 'Nada'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 220,
                  width: 220,
                  child: Image.asset(imagePath!, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int value, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentValue == value
                ? const Color(0xFF2E7D32)
                : Colors.transparent,
            border: Border.all(color: const Color(0xFF2E7D32), width: 2),
          ),
          child: IconButton(
            icon: Icon(
              Icons.circle,
              color: currentValue == value ? Colors.white : Colors.transparent,
              size: 20,
            ),
            onPressed: () => onChanged(value),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Color(0xFF212121))),
      ],
    );
  }
}

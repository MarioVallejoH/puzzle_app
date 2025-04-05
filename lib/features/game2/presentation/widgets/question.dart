import 'package:flutter/material.dart';
import 'package:natakapp/config/theme/sizes.dart';
import 'package:natakapp/features/game2/domain/models/answer.dart';
import 'package:natakapp/features/game2/domain/models/question.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.data, this.onAnswerSelected});

  final Question data;

  final Function(int)? onAnswerSelected;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedAnswerId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(child: Text(widget.data.question, style: textTheme.bodyLarge)),
        SizedBox(height: 2 * kPadding),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.data.answers.length,
          itemBuilder: (context, index) {
            final answer = widget.data.answers[index];
            bool isSelected = selectedAnswerId == answer.id;
            return GestureDetector(
              onTap: () {
                select(true, answer);
                widget.onAnswerSelected?.call(answer.id);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: (kPadding / 2)),
                margin: EdgeInsets.only(bottom: kPadding),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                  border: Border.all(
                    color:
                        isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(kBorderRadiusCard),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 4),
                    Checkbox(
                      value: isSelected,
                      shape: const CircleBorder(),
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (bool? value) {
                        select(value, answer);
                      },
                    ),
                    Text(
                      answer.answer,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isSelected ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 2 * kPadding),
      ],
    );
  }

  void select(bool? value, Answer answer) {
    setState(() {
      selectedAnswerId = value == true ? answer.id : null;
    });
    if (widget.onAnswerSelected != null && value == true) {
      widget.onAnswerSelected!(answer.id);
    }
  }
}

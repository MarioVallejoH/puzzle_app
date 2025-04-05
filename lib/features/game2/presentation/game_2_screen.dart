import 'package:flutter/material.dart';
import 'package:natakapp/features/game2/presentation/widgets/progress_bar.dart';

class Game2Screen extends StatelessWidget {
  const Game2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(children: [Expanded(child: ProgressBar())]),
    );
  }
}

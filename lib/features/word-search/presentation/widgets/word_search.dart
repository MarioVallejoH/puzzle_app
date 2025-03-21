import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natakapp/features/word-search/config/theme/colors.dart';
import 'package:natakapp/features/word-search/config/theme/sizes.dart';
import 'package:natakapp/features/word-search/presentation/bloc/word_search_bloc.dart';

class WordSearch extends StatefulWidget {
  const WordSearch({super.key});

  @override
  State<WordSearch> createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> {
  final List<Offset> _selectedCells = [];

  @override
  void initState() {
    super.initState();
  }

  void _onCellTap(int row, int col, WordSearchState bloc) {
    final cellPosition = Offset(row.toDouble(), col.toDouble());

    if (_selectedCells.length <= 1) {
      setState(() {
        if (_selectedCells.contains(cellPosition)) {
          _selectedCells.remove(cellPosition);
        } else {
          _selectedCells.add(cellPosition);
        }
      });
      return;
    }
    final lastCell = _selectedCells.last;
    final isHorizontal = lastCell.dx == cellPosition.dx;
    final isVertical = lastCell.dy == cellPosition.dy;
    final isDiagonal =
        (lastCell.dx - cellPosition.dx).abs() ==
        (lastCell.dy - cellPosition.dy).abs();

    final previousDirection =
        isHorizontal
            ? 'horizontal'
            : isVertical
            ? 'vertical'
            : isDiagonal
            ? 'diagonal'
            : '';
    final currentDirection =
        _selectedCells.length > 2
            ? (_selectedCells[_selectedCells.length - 2].dy == cellPosition.dy
                ? 'vertical'
                : _selectedCells[_selectedCells.length - 2].dx ==
                    cellPosition.dx
                ? 'horizontal'
                : ((_selectedCells[_selectedCells.length - 2].dx -
                                cellPosition.dx)
                            .abs() ==
                        (_selectedCells[_selectedCells.length - 2].dy -
                                cellPosition.dy)
                            .abs()
                    ? 'diagonal'
                    : ''))
            : previousDirection;

    if (previousDirection != currentDirection || previousDirection.isEmpty) {
      setState(() {
        _selectedCells.clear();
      });
      return;
    }

    setState(() {
      if (_selectedCells.contains(cellPosition)) {
        _selectedCells.remove(cellPosition);
      } else {
        _selectedCells.add(cellPosition);
      }
    });

    final foundWord = bloc.wordSearch!.wordPositions.keys
        .map((key) {
          if (Set.from(
                bloc.wordSearch!.wordPositions[key] ?? {},
              ).containsAll(_selectedCells) &&
              Set.from(
                _selectedCells,
              ).containsAll(bloc.wordSearch!.wordPositions[key] ?? {})) {
            return key;
          }
          return '';
        })
        .firstWhere((element) => element.isNotEmpty, orElse: () => '');

    if (foundWord.isNotEmpty) {
      BlocProvider.of<WordSearchBloc>(
        context,
      ).add(WordSearchFindEvent(foundWord));
      setState(() {
        _selectedCells.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordSearchBloc, WordSearchState>(
      builder: (_, bloc) {
        if (bloc.wordSearch != null) {
          List<Offset> wFPositions = [];
          for (var word in bloc.foundWords) {
            wFPositions.addAll(bloc.wordSearch!.wordPositions[word] ?? []);
          }

          return Container(
            padding: EdgeInsets.all(kWSMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              border: Border.all(color: WordSearchColors.kWordSearchCellBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int row = 0; row < bloc.wordSearch!.data.length; row++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (
                        int col = 0;
                        col < bloc.wordSearch!.data[row].length;
                        col++
                      )
                        GestureDetector(
                          onTap: () => _onCellTap(row, col, bloc),
                          child: Container(
                            width: kCellSize,
                            height: kCellSize,
                            margin: EdgeInsets.all(kCellMargin),
                            decoration: BoxDecoration(
                              color:
                                  _selectedCells.contains(
                                        Offset(row.toDouble(), col.toDouble()),
                                      )
                                      ? WordSearchColors.kSelectedCellColor
                                      : wFPositions.contains(
                                        Offset(row.toDouble(), col.toDouble()),
                                      )
                                      ? AppColors.kOkColor
                                      : Colors.transparent,
                              border: Border.all(
                                color: WordSearchColors.kWordSearchCellBorder,
                              ),
                              borderRadius: BorderRadius.circular(
                                kBorderRadius,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                bloc.wordSearch!.data[row][col],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          );
        }
        return Container(decoration: BoxDecoration(), child: Column());
      },
    );
  }
}

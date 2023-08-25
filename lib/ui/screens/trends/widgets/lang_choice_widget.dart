import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/trends/repos/trend_repo_bloc.dart';
import 'package:git_watcher/data/static/languages.dart';

class LangChoiceWidget extends StatefulWidget {
  const LangChoiceWidget({super.key});

  @override
  State<LangChoiceWidget> createState() => _LangChoiceWidgetState();
}

class _LangChoiceWidgetState extends State<LangChoiceWidget> {
  static int? _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(spacing: 5.0, runSpacing: 5.0, children: [
          for (int i = 0; i < languages.length; i++)
            ChoiceChip(
              label: Text(languages[i]),
              selected: _selected == i,
              onSelected: (bool selected) {
                setState(() {
                  _selected = selected ? i : null;
                });
                BlocProvider.of<TrendRepoBloc>(context)
                    .add(FetchTrendRepoEvent(languages[i]));
              },
            )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_rivepod/s1.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1 = ref.watch(s1NotifierProvider);

    ref.listen(s1NotifierProvider, (oldState, newState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$oldState から $newState へ変化しました')),
      );
    });

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(s1NotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Text('ボタン'),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$s1'),
        button,
      ],
    );
  }
}

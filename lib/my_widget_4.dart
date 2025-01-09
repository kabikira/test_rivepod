import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_rivepod/s4.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s4 = ref.watch(s4NotifierProvider);
    final Widget = s4.when(
      loading: () => Text('準備中'),
      error: (e, s) => Text('エラー $e'),
      data: (d) => Text('$d'),
    );

    // ボタン
    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(s4NotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Text('ボタン'),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Widget,
        button,
      ],
    );
  }
}

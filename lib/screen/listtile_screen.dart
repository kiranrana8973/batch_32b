import 'package:batch_32b/common_widget/listtile_widget.dart';
import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 100; i++) ...{
              if (i % 2 == 0) ...{
                ListTileWidget(index: i),
              },
            }
          ],
        ),
      ),
    );
  }
}

class CommonListTile extends StatelessWidget {
  const CommonListTile(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.ac_unit),
      title: Text('Title $index'),
      subtitle: const Text('Subtitle'),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final int index;

  const ListTileWidget({
    required this.index,
    super.key,
  });

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

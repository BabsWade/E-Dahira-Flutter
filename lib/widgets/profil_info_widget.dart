import 'package:flutter/material.dart';

class ProfilInfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const ProfilInfoWidget({
    required this.title,
    required this.value,
});

  @override
  Widget build(BuildContext context){
    return Card(
      color: const Color(0xffffffff),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
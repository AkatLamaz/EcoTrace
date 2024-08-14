import 'package:flutter/material.dart';
import '../graph/graph_conf.dart';

class EmissionsPage extends StatelessWidget {
  const EmissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 600, maxWidth: 650),
      child: Card(
        margin: const EdgeInsets.all(28),
        child: Column(
          children: [
            const SizedBox(width: 50),
            const SizedBox(height: 20),
            SizedBox(
              height: 400, // Określenie wymiarów
              child: MyRelativeEmissionsChart(),
            ),
            // const SizedBox(
            //   width: 200,
            //   height: 200, // Określenie wymiarów
            //   child: EmissionsOverTimeChart(),
            // ),
          ],
        ),
      ),
    );
  }
}
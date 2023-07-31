import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMapType extends StatelessWidget {
  final void Function(MapType) setMapType;

  const SelectMapType({super.key, required this.setMapType});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () => setMapType(MapType.normal),
              icon: const Icon(Icons.map),
              label: const Text('Normal'),
            ),
            TextButton.icon(
              onPressed: () => setMapType(MapType.satellite),
              icon: const Icon(Icons.satellite),
              label: const Text('Satellite'),
            ),
            TextButton.icon(
              onPressed: () => setMapType(MapType.terrain),
              icon: const Icon(Icons.terrain),
              label: const Text('Terrain'),
            ),
            TextButton.icon(
              onPressed: () => setMapType(MapType.hybrid),
              icon: const Icon(Icons.map_outlined),
              label: const Text(
                'Hybrid',
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMapType extends StatelessWidget {
  final void Function(MapType) setMapType;

  const SelectMapType({
    Key? key,
    required this.setMapType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTextButton(
              onPressed: () => setMapType(MapType.normal),
              icon: Icons.map_outlined,
              label: 'Normal',
            ),
            _buildTextButton(
              onPressed: () => setMapType(MapType.satellite),
              icon: Icons.satellite,
              label: 'Satellite',
            ),
            _buildTextButton(
              onPressed: () => setMapType(MapType.terrain),
              icon: Icons.terrain,
              label: 'Terrain',
            ),
            _buildTextButton(
              onPressed: () => setMapType(MapType.hybrid),
              icon: Icons.map,
              label: 'Hybrid',
            ),
          ],
        ),
      ),
    );
  }

  TextButton _buildTextButton({
    required void Function() onPressed,
    required IconData icon,
    required String label,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

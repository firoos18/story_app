import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        color: const Color(0xff410003).withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FeatherIcons.mapPin,
            size: 16,
            color: const Color(0xff410003).withOpacity(0.5),
          ),
          const SizedBox(height: 4),
          Text(
            'Add Location',
            style: TextStyle(
              fontSize: 10,
              color: const Color(0xff410003).withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String photoUrl;
  final String name;
  final String description;
  final String createdAt;

  const StoryCard({
    super.key,
    required this.description,
    required this.name,
    required this.photoUrl,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      height: 115,
      decoration: BoxDecoration(
        color: const Color(0xff201a1b),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                photoUrl,
                height: 91,
                width: 68,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xffFFFBFF),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xffFFFBFF),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    createdAt,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      color: const Color(0xffFFFBFF).withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

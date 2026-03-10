import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';

class ChannelListItem extends StatelessWidget {

  final String name;
  final String desc;
  final String logo;

  const ChannelListItem({
    super.key,
    required this.name,
    required this.desc,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassContainer(
        borderRadius: 16,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [

            Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(logo),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    desc,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            )

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';

class SafePlace {
  String image;
  final String name;
  final String distance;
  final String minute;

  SafePlace(
      {required this.image,
      required this.name,
      required this.distance,
      required this.minute});
}

class SafePlaceBlock extends StatelessWidget {
  final SafePlace safePlace;

  const SafePlaceBlock({super.key, required this.safePlace});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(safePlace.image), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  safePlace.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${safePlace.distance}m - ${safePlace.minute}min",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
              constraints: const BoxConstraints.tightFor(height: 50),
              child: IconButton(
                onPressed: () {
                  //action coe when button is pressed
                },
                icon: const Icon(Icons.arrow_forward),
              ))
        ],
      ),
    );
  }
}

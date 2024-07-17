import 'package:flutter/material.dart';

// Info's Class
class Info {
  String image;
  String title;
  String description;

  Info({required this.image, required this.title, required this.description});
}

// Component InfoCard
class InfoCard extends StatelessWidget {
  final Info info;
  const InfoCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(children: [
          const SizedBox(height: 40),
          Row(
            children: [
              SizedBox(
                //color: Colors.blue,
                width: 50.0,
                height: 80.0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  child: Image.asset(info.image),
                ),
              ),
              const Spacer(),
              Flexible(
                  flex: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(info.title,
                          style: const TextStyle(
                            fontFamily: 'Exo2',
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.45,
                          )),
                      const SizedBox(height: 8),
                      //Text(quote.description),
                      Text(info.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -.3,
                          )),
                    ],
                  ))
            ],
          ),
        ]));
  }
}

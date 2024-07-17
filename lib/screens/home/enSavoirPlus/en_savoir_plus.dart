// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:here_for_u/style/components/home/article.dart';
import '../../../style/components/all_components.dart';

class EnSavoirPlus extends StatefulWidget {
  const EnSavoirPlus({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EnSavoirPlusState();
}

class _EnSavoirPlusState extends State<EnSavoirPlus> {
  List<Article> articles = [
    Article(
        image: "images/enSavoirPlus/img1.png",
        title:
            "Identifiez des personnes pouvant vous venir en aide en cas d'urgence.",
        description:
            "Lorem ipsum dolor sit amet consectetur. Semper facilisis neque nu"
            "nc vitae venenatis. Feugiat ornare suspendisse enim proin auctor nisl risus et lorem. Suspendisse enim mauris tortor lectus facilisis malesuada dui dictumst id. Cursus ut eget hendrerit et at. "),
    Article(
        image: "images/enSavoirPlus/img2.png",
        title:
            "Notez et apprenez par cœur les numéros de téléphone importants.",
        description:
            "Lorem ipsum dolor sit amet consectetur. Semper facilisis neque nu"
            "nc vitae venenatis. Feugiat ornare suspendisse enim proin auctor nisl risus et lorem. Suspendisse enim mauris tortor lectus facilisis malesuada dui dictumst id. Cursus ut eget hendrerit et at. "),
    Article(
        image: "images/enSavoirPlus/img3.png",
        title: "Préservez la batterie de votre téléphone.",
        description:
            "Lorem ipsum dolor sit amet consectetur. Semper facilisis neque nu"
            "nc vitae venenatis. Feugiat ornare suspendisse enim proin auctor nisl risus et lorem. Suspendisse enim mauris tortor lectus facilisis malesuada dui dictumst id. Cursus ut eget hendrerit et at. ")
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: articles.toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: false,
                aspectRatio: 0.5,
                viewportFraction: 1,
                onPageChanged: (nouveauIndex, reason) {
                  setState(() {
                    currentIndex = nouveauIndex;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < articles.length; i++)
                  Container(
                    height: 8,
                    width: currentIndex == i ? 45 : 8,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: currentIndex == i
                          ? AppColor.primary5
                          : AppColor.primary2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  currentIndex == 2 ? "" : "Fermer",
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 230),
                child: GoButton(
                  text: currentIndex == 2 ? "Fermer" : "Suivant",
                  onPressed: currentIndex == 2
                      ? () {
                          Navigator.pushNamed(context, '/');
                        }
                      : () {
                          carouselController.nextPage();
                        },
                  minHeight: 40,
                  elevation: 0.0,
                  foreground: AppColor.white,
                  background: AppColor.primary3,
                  borderSide: 0,
                  colorSide: AppColor.primary3,
                ),
              ),
            ]),
          ]),
    ));
  }
}

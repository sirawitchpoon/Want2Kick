import 'package:flutter/material.dart';
import 'package:want_2_kick/models/stadium.dart';
import 'package:want_2_kick/utils/custom_icons_icons.dart';
import 'package:want_2_kick/utils/he_color.dart';

class HDCell extends StatelessWidget {
  final Stadium stadium;
  final Function onTap;

  const HDCell({Key? key, required this.stadium, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 283,
        height: 199,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.grey[700], borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            // const Positioned(
            //   top: 16,
            //   right: 16,
            //   child: SizedBox(
            //     width: 162,
            //     height: 139,
            //     child: Image(
            //       image: AssetImage('assets/images/bg.shape.png'),
            //     ),
            //   ),
            // ),
            Positioned(
              top: 32,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stadium:.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    stadium.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    stadium.price.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 77,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(32)),
                ),
                child: const Icon(
                  CustomIcons.arrow_right,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 0,
              child: SizedBox(
                width: 128,
                height: 173,
                child: Hero(
                  tag: stadium.name + stadium.price.toString(),
                  child: Image(
                    filterQuality: FilterQuality.high,
                    image: AssetImage('assets/images/' + stadium.image),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

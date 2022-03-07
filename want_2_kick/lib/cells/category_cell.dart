import 'package:flutter/material.dart';
import 'package:want_2_kick/models/category.dart';
import 'package:want_2_kick/utils/he_color.dart';

class CategoryCell extends StatelessWidget {
  final Category category;

  const CategoryCell({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: HexColor('#EDFDFA'),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  category.icon,
                  size: 24,
                  color: HexColor('00C6AD'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  category.title,
                  style: TextStyle(
                    color: HexColor('#01010'),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: HexColor('#E1F7F4'),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(10)),
                ),
              ),
              Positioned(
                left: 16,
                child: Text(
                  'EPL',
                  style: TextStyle(
                    color: HexColor('#696969'),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

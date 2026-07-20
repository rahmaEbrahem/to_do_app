import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.maincolor,
      elevation: 4,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardItem(itemnumber: 12, itemname: "Tasks"),
            CardItem(itemnumber: 5, itemname: "Done"),
            CardItem(itemnumber: 6, itemname: "padding"),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final int itemnumber;
  final String itemname;
  const CardItem({super.key, required this.itemnumber, required this.itemname});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          itemnumber.toString(),
          style: AppTextStyles.containtitles.copyWith(color: Colors.white),
        ),
        SizedBox(height: 12),
        Text(
          itemname,
          style: AppTextStyles.containtitles.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

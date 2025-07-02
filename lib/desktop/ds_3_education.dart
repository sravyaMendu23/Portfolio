import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class DS5Education extends StatelessWidget {
  const DS5Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.educationKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.educationTitle,
                description: DataValues.educationDescription),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ContainerCard().type2(
                    image: 'assets/images/auroras_logo.png',
                    title: DataValues.educationOrg1Title,
                    values: [
                      DataValues.educationOrg1Course1Name,
                      DataValues.educationOrg1Course1Grade,
                      DataValues.educationOrg1Course1Year,
                      DataValues.educationOrg1Course2Name,
                      DataValues.educationOrg1Course2Grade,
                      DataValues.educationOrg1Course2Year,
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(
                  child: ContainerCard().type2(
                    image: 'assets/images/kanishka_logo.png',
                    title: DataValues.educationOrg2Title,
                    values: [
                      DataValues.educationOrg2Course1Name,
                      DataValues.educationOrg2Course1Grade,
                      DataValues.educationOrg2Course1Year,
                      DataValues.educationOrg2Course2Name,
                      DataValues.educationOrg2Course2Grade,
                      DataValues.educationOrg2Course2Year,
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(
                  child: ContainerCard().type2(
                    image: 'assets/images/ekashila_logo.png',
                    title: DataValues.educationOrg3Title,
                    values: [
                      DataValues.educationOrg3Course1Name,
                      DataValues.educationOrg3Course1Grade,
                      DataValues.educationOrg3Course1Year,
                      DataValues.educationOrg3Course2Name,
                      DataValues.educationOrg3Course2Grade,
                      DataValues.educationOrg3Course2Year,
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(
                  child: ContainerCard().type2(
                    image: 'assets/images/vvv_logo.jpeg',
                    title: DataValues.educationOrg4Title,
                    values: [
                      DataValues.educationOrg4Course1Name,
                      DataValues.educationOrg4Course1Grade,
                      DataValues.educationOrg4Course1Year,
                      DataValues.educationOrg4Course2Name,
                      DataValues.educationOrg4Course2Grade,
                      DataValues.educationOrg4Course2Year,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

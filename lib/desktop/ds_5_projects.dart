import 'package:flutter/material.dart';
import 'package:sravya_portfolio/widgets/text_animations.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class DS4Projects extends StatelessWidget {
  const DS4Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.projectsKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.projectsTitle,
                description: DataValues.projectsDescription),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SlideFadeAnimation(
                    direction: SlideDirection.left,
                    child: ContainerCard().type3(
                      image: 'assets/images/klee_tech_logo.png',
                      title: DataValues.projectsOrg1Title,
                      role: DataValues.projectsOrg1Tech,
                      years: DataValues.projectsOrg1Years,
                      values: DataValues.projectsOrg1Aim,
                      message: DataValues.githubURL.toString(),
                      url: DataValues.githubURL,
                      isButtonEnabled: false,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: SlideFadeAnimation(
                    direction: SlideDirection.right,
                    child: ContainerCard().type3(
                      image: 'assets/images/toucan_logo.png',
                      title: DataValues.projectsOrg2Title,
                      role: DataValues.projectsOrg2Tech,
                      years: DataValues.projectsOrg2Years,
                      values: DataValues.projectsOrg2Aim,
                      message: DataValues.githubURL.toString(),
                      url: DataValues.githubURL,
                      isButtonEnabled: false,
                    ),
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

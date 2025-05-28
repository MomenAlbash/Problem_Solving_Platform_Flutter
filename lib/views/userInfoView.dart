import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomAppBar.dart';
import 'package:skills_over_flow_app/constants/AppTextStyle.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';

class userInfoView extends StatelessWidget {
  const userInfoView({super.key});

  final String id = 'userInfoView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const CustomAppBarUsersView(),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 114,
                    width: 114,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/63cc53c23c4c5a9d08843b6e1548bd1b.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '@momen_bash',
                    style: AppTextStyles.bodyText1(context, yellowColor)
                        .copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '* * * * *',
                    style: AppTextStyles.bodyText1(
                      context,
                      const Color(0xFFD2D2D2),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '20',
                            style: AppTextStyles.bodyText1(context, yellowColor)
                                .copyWith(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Problem solved',
                            style: TextStyle(fontSize: 12, color: greyColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '20',
                            style: AppTextStyles.bodyText1(context, yellowColor)
                                .copyWith(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Problem added',
                            style: TextStyle(fontSize: 12, color: greyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  height: 70,
                  child: MaterialButton(
                    onPressed: () {},
                    color: fieldColor,
                    child: Row(
                      children: [
                        const Icon(Icons.key,color: yellowColor,),
                        const SizedBox(width: 30,),
                        Text('Change Password',style: AppTextStyles.bodyText1(context, yellowColor),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4,),
                Container(
                  height: 70,
                  child: MaterialButton(
                    onPressed: () {},
                    color: fieldColor,
                    child: Row(
                      children: [
                        const Icon(Icons.logout,color: yellowColor,),
                        const SizedBox(width: 30,),
                        Text('log out',style: AppTextStyles.bodyText1(context, yellowColor),),
                      ],
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skills_over_flow_app/utils/AppDimensions.dart';
import 'package:skills_over_flow_app/utils/AppRouter.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.verticalPadding),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                GoRouter.of(context).push(AppRouter.profileView);
                },
                child: Container(
                  padding:const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.white.withOpacity(.1))),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person,size: 32,color: Colors.white,),
                      SizedBox(width: 20,),
                      Text('My Profile',style: AppTextStyles.bodyText1(context, Colors.white),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.usersView);
                },
                child: Container(
                  padding:const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.white.withOpacity(.1))),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.supervised_user_circle_sharp,size: 32,color: Colors.white,),
                      const SizedBox(width: 20,),
                      Text('Users',style: AppTextStyles.bodyText1(context, Colors.white),)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

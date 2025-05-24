import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/constants/AppTextStyle.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';

class
userView extends StatefulWidget {
  const userView({super.key});
  final String id ='usersView';


  @override
  State<userView> createState() => _userViewState();
}

class _userViewState extends State<userView> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
        child: Column(
          children:  [
            const CustomAppBarUsersView(),
            const SizedBox(height: 40,),
            CustomTextFormFieldWidget(
                 controller: controller,
                hintText: 'Search With User_name',
              suffixIcon: Icons.search_sharp,
            ),
            const SizedBox(height: 40,),
            Expanded(child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>const Padding(
              padding:  EdgeInsets.only(bottom: 20.0),
              child: CustomContainerUserInfo(),
            ),)),
          ],
        ),
      ),
    );
  }
}
class CustomAppBarUsersView extends StatelessWidget {
  const CustomAppBarUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: fieldColor,
          ),
            child: IconButton(onPressed: (){}, icon:const Icon(Icons.filter_list_rounded,color: greyColor,))),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:const Color(0xFF303D48),
          ),
            child: IconButton(onPressed: (){}, icon:const Icon(Icons.filter_list_rounded,color: greyColor,))),
      ],

    );
  }
}
class CustomContainerUserInfo extends StatelessWidget {
  const CustomContainerUserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 19) ,
      child: Row(
        children: [
          Container(
            decoration:  BoxDecoration(
              color: Colors.deepOrange,
              image: DecorationImage(image: AssetImage('assets/images/63cc53c23c4c5a9d08843b6e1548bd1b.jpg'),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('User Name:',style: AppTextStyles.bodyText1(context, yellowColor),),
                  Text(' momen_bash',style: AppTextStyles.bodyText1(context, yellowColor),),
                ],
              ),
              const SizedBox(height: 5,),
              Text('* * * * *',style: AppTextStyles.bodyText1(context, Color(0xFFD2D2D2),),),
            ],
          ),
        ],
      ),
    );

  }
}


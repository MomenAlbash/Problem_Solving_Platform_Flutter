import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/cubits/get_users_cubit/get_users_cubit.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';

import '../Widgets/CustomAppBar.dart';
import '../Widgets/CustomContainerUserInfo.dart';

class userView extends StatefulWidget {
  const userView({super.key});

  final String id = 'usersView';

  @override
  State<userView> createState() => _userViewState();
}

class _userViewState extends State<userView> {
  TextEditingController controller = TextEditingController();
  int lengthOfListUser=0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUsersCubit()..getAllUsers(isFirstTime: true,isIncrease: false),
      child: BlocBuilder<GetUsersCubit, GetUsersState>(
  builder: (context, state) {
    var cubit=GetUsersCubit.get(context);

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Column(
            children: [
              const CustomAppBarUsersView(),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormFieldWidget(
                minLines: 1,
                onChanged:(value){
                  value=controller.text;
                  cubit.getAllUsers(isIncrease: false,isFirstTime: true,userName: value);
                } ,
                controller: controller,
                hintText: 'Search With User_name',
                suffixIcon: Icons.search_sharp,
              ),
              const SizedBox(
                height: 40,
              ),
              (state is  GetUsersLoadingState)?Expanded(child: Center(child: CircularProgressIndicator(),)):
              (state is GetUsersSuccessState)?
              (state.users.length!=0)? Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.users.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CustomContainerUserInfo(usermodel: state.users[index],),
                  ),
                ),
              ):Expanded(
                child: Center(
                  child: Text(
                    'there is no user',
                    style: AppTextStyles.bodyText1(context, Colors.white),
                  ),
                ),
              ):
              Expanded(

                child: Center(
                  child: Text(
                    'Opps , there was an error , try later ',
                    style: AppTextStyles.bodyText1(context, Colors.white),
                  ),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: 40,
                      decoration: BoxDecoration(
                        color: fieldColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: (){
                          cubit.getAllUsers(isIncrease: false);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 16,
                        )),
                      ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: 40,
                      decoration: BoxDecoration(
                        color: fieldColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${cubit.page}',
                        style: AppTextStyles.bodyText1(context, Colors.white),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: 40,
                      decoration: BoxDecoration(
                        color: fieldColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                       onPressed: (){
                         cubit.getAllUsers(isIncrease: true);
                       },
                       icon: Icon(
                         Icons.navigate_next_rounded,
                         color: Colors.white,
                         size: 28,
                       )),
                      ),
                ],
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }
}

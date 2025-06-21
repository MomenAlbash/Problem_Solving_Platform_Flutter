import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerIconWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerListVireItem.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerProblemWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/cubits/get_all_probelm_cubit/get_all_problems_cubit.dart';
import 'package:skills_over_flow_app/utils/AppDimensions.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';

import '../Widgets/CustomTextFormFieldWidget.dart';
import '../utils/AppTextStyle.dart';

class ProblemListAdminView extends StatefulWidget {
  const ProblemListAdminView({super.key});


  @override
  State<ProblemListAdminView> createState() => _ProblemListAdminViewState();
}

class _ProblemListAdminViewState extends State<ProblemListAdminView> {
  TextEditingController problemNameController = TextEditingController();
  final GetAllProblemsCubit _problemsCubit = GetAllProblemsCubit();

  @override
  void initState() {
    super.initState();
    ReuestForProblem(); // طلب البيانات هنا
  }

  Future<void> ReuestForProblem()async {
   await _problemsCubit.getAllProblems(isFirstTime: true,isIncrease: false);
  }

  @override
  void dispose() {
    _problemsCubit.close(); // تنظيف الـCubit عند التدمير
    problemNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _problemsCubit,
      child: BlocBuilder<GetAllProblemsCubit, GetAllProblemsState>(
        builder: (context, state) {
          var cubit=GetAllProblemsCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomContainerIconWidget(
                          icon: Icons.menu, onPressed: () {}),
                      const SizedBox(
                        width: 17.5,
                      ),
                      Expanded(
                        child: CustomTextFormFieldWidget(
                          minLines: 1,
                          onChanged:(value){
                            value=problemNameController.text;
                            cubit.getAllProblems(isIncrease: false,isFirstTime: true,problemName: value);
                          } ,
                          controller: problemNameController,
                          hintText: 'Search with probelem_name',
                          suffixIcon: Icons.search_sharp,


                        ),
                      ),
                      const SizedBox(
                        width: 17.5,
                      ),
                      CustomContainerIconWidget(
                          icon: Icons.menu, onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  (state is GetAllProblemsSuccessfullyState)?
                  Expanded(
                      child:(state.problemList.length==0)?const Center(child: Text('There is no more Problem',style: TextStyle(color: Colors.lightBlueAccent),),):
                      CustomProblemListViewItem(problemList: state.problemList,)
                  ):const Expanded(child: Center(child: CircularProgressIndicator(),)),
                  const SizedBox(height: 50,),
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
                              cubit.getAllProblems(isIncrease: false);
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
                              cubit.getAllProblems(isIncrease: true);
                            },
                            icon:const Icon(
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

import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';

import '../utils/AppTextStyle.dart';
import '../views/test_case_body.dart';

class CustomTestCaseWidget extends StatefulWidget {
  const CustomTestCaseWidget({required this.index});
  final int index;

  @override
  State<CustomTestCaseWidget> createState() => _CustomTestCaseWidgetState();
}

class _CustomTestCaseWidgetState extends State<CustomTestCaseWidget> {
  bool isSelectedtestCase=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: isSelectedtestCase ? 345 :null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: greyColor),

      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('Test Case ${widget.index +1}',style: AppTextStyles.bodyText1(context, yellowColor),),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      isSelectedtestCase=!isSelectedtestCase;
                    });
                  },
                  child: Image(image: isSelectedtestCase? AssetImage('assets/images/pagination right.png'):AssetImage('assets/images/pagination left.png'))),

            ],
          ),
          const SizedBox(height: 25,),
          (isSelectedtestCase)?CustomTestCaseBody(index: widget.index,):const SizedBox()
        ],
      ),
    );

  }
}

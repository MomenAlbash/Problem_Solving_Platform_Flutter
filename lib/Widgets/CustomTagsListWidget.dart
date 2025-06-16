import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/cubits/get_all_tags_cubit/get_all_tags_cubit.dart';
import 'package:skills_over_flow_app/models/tag_model..dart';

import 'CustomTagItem.dart';

class CustomTagsWidget extends StatefulWidget {
  const CustomTagsWidget({super.key});
  @override
  State<CustomTagsWidget> createState() => _CustomTagsWidgetState();
}

class _CustomTagsWidgetState extends State<CustomTagsWidget> {
  List<String> tags=[];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllTagsCubit()..getAllTags(),
      child: BlocBuilder<GetAllTagsCubit, GetAllTagsState>(
        builder: (context, state) {
          var cubit= GetAllTagsCubit.get(context);
          if(state is GetAllTagsLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is GetAllTagsSuccessState){
            return Wrap(
              spacing: 20.0, // المسافة الأفقية بين العناصر
              runSpacing: 10.0, // المسافة الرأسية بين الأسطر
              children: List.generate(state.tags.length, (index) => CustomTagItem(tagmodel: state.tags[index])),
            );
          }else{
            return const Center(child: Text('there are no tags , try again'));
          }
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'choose_tag_state.dart';

class ChooseTagCubit extends Cubit<ChooseTagState> {
  ChooseTagCubit() : super(ChooseTagInitial());
   static List<int> tags=[];
  static ChooseTagCubit get(context) =>BlocProvider.of(context);
  bool activeTag=false;
  ChooseTage(int tagId){
    activeTag=!activeTag;
    if(activeTag){
      tags.add(tagId);
    }else{
      tags.remove(tagId);
    }
    emit(ChooseTagSucState());
  }
}

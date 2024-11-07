import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/AddSubjectModel.dart';
import '../../ToastMessage.dart';

part 'add_subject_event.dart';
part 'add_subject_state.dart';

class AddSubjectBloc extends Bloc<AddSubjectEvent, AddSubjectState> {
  late AddSubjectModel addSubjectModel=AddSubjectModel();
  AdminApi adminApi = AdminApi();
  AddSubjectBloc() : super(AddSubjectInitial()) {
    on<FeatchAddSubject>((event, emit) async{
      emit( AddSubjectBlocLoading());
      try{
        addSubjectModel=await adminApi.getAddSubject(event.title, event.coursecode, event.university, event.description, event.status,event.subjectpdf);
        emit(AddSubjectBlocLoaded());
      }
          catch(e){

       emit( AddSubjectBlocError());
       ToastMessage()
           .toastmessage(message:e.toString());

       print(' hello adding error'+e.toString());
          }


    });
  }
}

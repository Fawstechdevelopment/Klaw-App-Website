import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/PublishedSubjectModel.dart';
import '../../ToastMessage.dart';

part 'published_subject_event.dart';
part 'published_subject_state.dart';

class PublishedSubjectBloc extends Bloc<PublishedSubjectEvent, PublishedSubjectState> {
  late PublishedSubjectModel publishedsubject ;
  AdminApi adminApi = AdminApi();
  PublishedSubjectBloc() : super(PublishedSubjectInitial()) {
    on<FeatchPublishedSubjects>((event, emit) async{
      emit(PublishedBlocLoading());
      try{
        publishedsubject=await adminApi.getPublishedSubject();
        emit(PublishedBlocLoaded());
      }
          catch(e){
        emit(PublishedBlocError());

        ToastMessage()
            .toastmessage(message:e.toString());


        print('error printing '+e.toString());
          }


    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/PublishedModelClass.dart';

part 'published_event.dart';
part 'published_state.dart';

class PublishedBloc extends Bloc<PublishedEvent, PublishedState> {
late List<PublishedModelClass> publishedsubject;
  AdminApi adminApi = AdminApi();

  PublishedBloc() : super(PublishedInitial()) {
    on<FeatchPublishedSubject>((event, emit) async{

emit(PublishedBlocLoading());
try{
  publishedsubject =await adminApi.getPublishSubjectList();
  emit(PublishedBlocLoaded());

}
    catch(e){

  emit(PublishedBlocError());

    }

    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/ToggleModelClass.dart';

part 'toggle_suject_event.dart';
part 'toggle_suject_state.dart';

class ToggleSujectBloc extends Bloc<ToggleSujectEvent, ToggleSujectState> {
  late ToggleModelClass togglesubject;
  AdminApi adminApi = AdminApi();
  ToggleSujectBloc() : super(ToggleSujectInitial()) {
    on<FeatchToggle>((event, emit) async{
      emit( ToggleBlocLoading());
      try{
        togglesubject = await adminApi.getToggleSubject(event.SubjectId);

      }
catch(e){
        emit(ToggleBlocError());

}


    });
  }
}

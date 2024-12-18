import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/DeleteModelClass.dart';
import '../../ToastMessage.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  late DeleteModelClass deleteModel = DeleteModelClass();
  AdminApi adminApi = AdminApi();
  DeleteBloc() : super(DeleteInitial()) {
    on<FeatchDelete>((event, emit) async{
      emit (DeleteBlocLoading() );
      try{
        deleteModel=await adminApi.getDeleteSubject(event.SubjectId);
        emit(DeleteBlocLoaded() );
print('deteded loaded subkject code ${event.SubjectId}');

      }
          catch(e)
          {
        emit( DeleteBlocError());
        ToastMessage()
            .toastmessage(message:e.toString());

        print('error in subject delecting : $e');
          }

    });
  }
}

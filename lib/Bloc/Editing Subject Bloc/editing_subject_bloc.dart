import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/EditingModelClass.dart';

part 'editing_subject_event.dart';
part 'editing_subject_state.dart';

class EditingSubjectBloc extends Bloc<EditingSubjectEvent, EditingSubjectState> {
 late EditingModelClass editingModel;
  AdminApi adminApi = AdminApi();
  EditingSubjectBloc() : super(EditingSubjectInitial()) {
    on<FeatchEditSubject>((event, emit) async{

emit(EditingSubjectBlocLoading());
try{

  editingModel= await adminApi.getEditSubject(event.title!, event.university!, event.description!, event.subjectpdf!, event.subjectid!);
  emit(EditingSubjectBlocLoaded());
}
    catch(e){emit (EditingSubjectBlocError());}

    });
  }
}

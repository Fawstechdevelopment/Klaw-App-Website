import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../Repository/ModelClass/DraftSubjectModel.dart';

part 'draft_subject_event.dart';
part 'draft_subject_state.dart';

class DraftSubjectBloc extends Bloc<DraftSubjectEvent, DraftSubjectState> {
  late DraftSubjectModel draftSubject;
  AdminApi adminApi = AdminApi();
  DraftSubjectBloc() : super(DraftSubjectInitial()) {
    on<FeatchDraftSubject>((event, emit) async{
      emit (DraftSubjectBlocLoading());
      try{
        draftSubject= await adminApi.getDraftSubject();
        emit(DraftSubjectBlocLoaded());
      }
          catch(e){ emit(DraftSubjectBlocError());}


    });
  }
}

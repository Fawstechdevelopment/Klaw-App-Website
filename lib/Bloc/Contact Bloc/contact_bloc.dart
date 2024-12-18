import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:klawapp/Repository/ModelClass/ContactModel.dart';
import '../../Repository/Api/Api.dart';
import '../../ToastMessage.dart';
part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  late ContactModel contactModel = ContactModel();
  AdminApi adminApi = AdminApi();
  ContactBloc() : super(ContactInitial()) {
    on<FeatchContact>((event, emit) async{
      emit(ContactBlocLoading());
      if (kDebugMode) {
        print('contact loading ${ContactBlocLoading()}');
      }

      try{
        contactModel=await adminApi.getContact(event.name, event.Email, event.Phonenumber, event.Feedback);
        emit(ContactBlocLoaded());
      }
          catch(e){
        emit(ContactBlocError());
        ToastMessage()
            .toastmessage(message:e.toString());
        if (kDebugMode) {
          print('contact error$e');
        }
          }
    });
  }
}

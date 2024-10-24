import 'package:bloc/bloc.dart';
import 'package:klawapp/Repository/ModelClass/AdminLoginModelClass.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Api.dart';
import '../../ToastMessage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late AdminLoginModel adminLoginModel=AdminLoginModel();
  AdminApi adminApi = AdminApi();
  LoginBloc() : super(LoginInitial()) {
    on<FeatchLogin>((event, emit) async{
emit(LoginBlocLoading());
      try{
        adminLoginModel=await adminApi.getLoginUser(event.username, event.password);
        emit(LoginBlocLoaded());
      }
          catch(e){
        print('error in login '+e.toString());
        emit(LoginBlocError());
        ToastMessage()
            .toastmessage(message:e.toString());
      }


    });
  }
}

part of 'delete_bloc.dart';

@immutable
sealed class DeleteEvent {}
class FeatchDelete extends DeleteEvent {
 final  String SubjectId;
  FeatchDelete({ required this.SubjectId });
}
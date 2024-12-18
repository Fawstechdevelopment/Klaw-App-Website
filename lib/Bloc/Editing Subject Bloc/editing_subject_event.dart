part of 'editing_subject_bloc.dart';

@immutable
sealed class EditingSubjectEvent {}
class FeatchEditSubject extends  EditingSubjectEvent {
  final String ?title;
  final String ?description;
  final String ?university;
  final String ?subjectid;
  final List<PlatformFile>? subjectpdf;
  FeatchEditSubject( { this.title, this.description, this.university, this.subjectpdf,this.subjectid});

}
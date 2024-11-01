part of 'add_subject_bloc.dart';

@immutable
sealed class AddSubjectEvent {}

class FeatchAddSubject extends AddSubjectEvent {
  final String title;
  final String coursecode;
  final String university;
  final String description;
  final String status;
  final List<PlatformFile> subjectpdf;

  FeatchAddSubject(
      {required this.title,
      required this.coursecode,
      required this.university,
      required this.description,
      required this.status,
      required this.subjectpdf
      });
}

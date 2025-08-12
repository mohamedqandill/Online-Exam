import 'package:equatable/equatable.dart';

class SubjectWithPagination {
  List<Subjects>? subjects;
  int? numberOfPage;

  SubjectWithPagination({required this.subjects, required this.numberOfPage});
}

class Subjects extends Equatable {
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Subjects(
      {required this.id,
      required this.name,
      required this.icon,
      required this.createdAt});
  @override
  List<Object?> get props => [createdAt, icon, id, name];
}

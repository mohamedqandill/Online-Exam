import 'package:json_annotation/json_annotation.dart';

import '../../domain_layer/models/subjects.dart';
part 'subjects.g.dart';

@JsonSerializable()
class SubjectsDTO {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  const SubjectsDTO({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectsDTO.fromJson(Map<String, dynamic> json) =>
      _$SubjectsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsDTOToJson(this);

  Subjects toSubject() {
    return Subjects(
      id: Id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}

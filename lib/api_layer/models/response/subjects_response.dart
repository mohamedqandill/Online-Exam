import 'package:json_annotation/json_annotation.dart';

import '../subjects.dart';

part 'subjects_response.g.dart';

@JsonSerializable()
class SubjectsResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'metadata')
  final Pagination? pagination;
  @JsonKey(name: 'subjects')
  final List<SubjectsDTO>? subjects;

  const SubjectsResponse({
    this.message,
    this.pagination,
    this.subjects,
  });

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;
  @JsonKey(name: 'nextPage')
  final int? nextPage;
  @JsonKey(name: 'prevPage')
  final int? prevPage;

  const Pagination({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
    this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/data_layer/data_source/get_exam_on_subject_ds.dart';
import 'package:online_exam/data_layer/repos/get_exams_on_subject_repo_impl.dart';
import 'package:online_exam/domain_layer/models/exams.dart';

import 'get_exams_on_subject_repo_impl_test.mocks.dart';

@GenerateMocks([GetExamOnSubjectDs])
void main() {
  test('when call Get Exam repo then it expected to return List of Exams',
      () async {
    //Act
    MockGetExamOnSubjectDs mockGetExamOnSubjectDs = MockGetExamOnSubjectDs();
    GetExamsOnSubjectsRepoImpl getExamsOnSubjectsRepoImpl =
        GetExamsOnSubjectsRepoImpl(mockGetExamOnSubjectDs);

    var subjectId = "6700708d30a3c3c1944a9c60";

    var exams = [
      Exams(
          id: "id",
          title: "title",
          duration: 20,
          subjectId: subjectId,
          numberOfQuestions: 10)
    ];
    //Arrange
    when(mockGetExamOnSubjectDs.getExamsOnSubject(subjectId: subjectId))
        .thenAnswer(
      (realInvocation) async => Right(exams),
    );

    var result = await getExamsOnSubjectsRepoImpl.getExamsOnSubject(
        subjectId: subjectId);

    verify(mockGetExamOnSubjectDs.getExamsOnSubject(subjectId: subjectId))
        .called(1);

    result.fold(
      (l) {},
      (r) {
        expect(r, equals(exams));
      },
    );
  });
}

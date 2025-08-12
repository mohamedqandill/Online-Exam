import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/api_layer/api_service/api_service.dart';
import 'package:online_exam/api_layer/data_source/get_all_subjects_ds_imp.dart';
import 'package:online_exam/api_layer/models/response/subjects_response.dart';
import 'package:online_exam/api_layer/models/subjects.dart';

import 'get_all_subjects_ds_imp_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  test('when call getAllSubjectDS it expected to return subjectResponse',
      () async {
    //Arrange
    MockApiService mockApiService = MockApiService();

    GetAllSubjectsDataSourceImp getAllSubjectsDataSourceImp =
        GetAllSubjectsDataSourceImp(mockApiService);
    int limit = 7;
    int page = 1;

    var expectedResult = const SubjectsResponse(
        pagination: Pagination(numberOfPages: 7),
        subjects: [
          SubjectsDTO(
              createdAt: "124", icon: "icon1.png", Id: "1", name: "mesi"),
          SubjectsDTO(
              createdAt: "14", icon: "icon2.png", Id: "12", name: "msi"),
          SubjectsDTO(
              createdAt: "12345", icon: "icon3.png", Id: "13", name: "messip"),
          SubjectsDTO(
              createdAt: "12346", icon: "icon4.png", Id: "14", name: "messii"),
          SubjectsDTO(
              createdAt: "12347", icon: "icon5.png", Id: "15", name: "messiu"),
          SubjectsDTO(
              createdAt: "12348", icon: "icon6.png", Id: "16", name: "messiy"),
          SubjectsDTO(
              createdAt: "12349", icon: "icon7.png", Id: "17", name: "messir"),
        ]);

    when(mockApiService.getSubjects(page: page, limit: limit)).thenAnswer(
      (realInvocation) async => expectedResult,
    );

    // Act

    var result = await getAllSubjectsDataSourceImp.getAllSubjects(
      page: page,
    );
    //Assert

    verify(mockApiService.getSubjects(page: page, limit: limit)).called(1);

    result.fold((l) => fail("Unexpected Left: $l"), (subjectWithPagination) {
      expect(subjectWithPagination.subjects,
          equals(expectedResult.subjects!.map((e) => e.toSubject()).toList()));
    });
  });
}

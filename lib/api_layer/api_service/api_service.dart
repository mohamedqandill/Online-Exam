import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/api_layer/models/response/checked_questions_d_t_o.dart';
import 'package:online_exam/api_layer/models/response/exams_response.dart';
import 'package:online_exam/api_layer/models/response/question_response.dart';
import 'package:online_exam/api_layer/models/response/subjects_response.dart';
import 'package:online_exam/core/utils/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/utils/api_endpoints.dart';
import '../../core/utils/constatnts.dart';

import '../models/response/exams_response.dart';
import '../models/response/subjects_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: Constants.baseURL)
@injectable
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio, {@Named('BaseUrl') String? baseUrl}) =
      _ApiService;

  @GET(EndPoints.getSubjects)
  Future<SubjectsResponse> getSubjects(
      {@Query(Constants.limit) int? limit = 7,
      @Query(Constants.page) int? page = 1});

  @GET(EndPoints.getExamOnSubject)
  Future<ExamsResponseDTO> getExamsOnSubject(
      {@Query(Constants.subject) required String subjectId});

  @GET(EndPoints.getQuestionOnExam)
  Future<QuestionResponseDTO> getQuestionsOnExam(
      {@Query(Constants.examAPi) required String examId});

  @POST(EndPoints.check)
  Future<CheckedQuestionsDTO> checkQuestions(
      {@Body() required Map<String, dynamic> body});
}

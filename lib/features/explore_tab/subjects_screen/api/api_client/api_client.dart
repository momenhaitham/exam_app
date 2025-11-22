import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/data/models/subjects_response.dart';
import 'package:injectable/injectable.dart';
// ignore: unused_import
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class SubjectsApiClient {
  @factoryMethod
  factory SubjectsApiClient(Dio dio) = _SubjectsApiClient;

  @GET(AppEndpoints.GetAllSubjects)
  Future<SubjectsResponse> GetAllSubjects(@Header("token") String token);
}
import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Staging API Group Code

class StagingAPIGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://strapi.smartr.vn/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
  };
  static LoginAPICall loginAPICall = LoginAPICall();
  static GetAssignedOngoingClassesCall getAssignedOngoingClassesCall =
      GetAssignedOngoingClassesCall();
  static GetAssignedUpcomingClassesCall getAssignedUpcomingClassesCall =
      GetAssignedUpcomingClassesCall();
  static GetAssignedCompletedClassesCall getAssignedCompletedClassesCall =
      GetAssignedCompletedClassesCall();
  static GetMyLearnerProfileCall getMyLearnerProfileCall =
      GetMyLearnerProfileCall();
  static GetClassInformationCall getClassInformationCall =
      GetClassInformationCall();
  static GetMyLearningStatisticsCall getMyLearningStatisticsCall =
      GetMyLearningStatisticsCall();
  static GetGamificationsCall getGamificationsCall = GetGamificationsCall();
  static GetClassSessionsCall getClassSessionsCall = GetClassSessionsCall();
  static GetLearnerDiscussionCall getLearnerDiscussionCall =
      GetLearnerDiscussionCall();
  static GetCurrentLearnerCall getCurrentLearnerCall = GetCurrentLearnerCall();
  static GetUserAuthorizationCall getUserAuthorizationCall =
      GetUserAuthorizationCall();
  static GetQuizAttemptHistoryCall getQuizAttemptHistoryCall =
      GetQuizAttemptHistoryCall();
  static GetInternalQuizCall getInternalQuizCall = GetInternalQuizCall();
  static GetMyOrganizationsCall getMyOrganizationsCall =
      GetMyOrganizationsCall();
  static GetMemberGamificationCall getMemberGamificationCall =
      GetMemberGamificationCall();
  static GetMemberLearnerStatisticsCall getMemberLearnerStatisticsCall =
      GetMemberLearnerStatisticsCall();
  static TriggerMaterialCall triggerMaterialCall = TriggerMaterialCall();
  static SubmitQuizCall submitQuizCall = SubmitQuizCall();
  static GetNotificationCall getNotificationCall = GetNotificationCall();
  static ViewNotificationCall viewNotificationCall = ViewNotificationCall();
  static GetClassDetailsCall getClassDetailsCall = GetClassDetailsCall();
  static GetCommentsCall getCommentsCall = GetCommentsCall();
  static PostCommentCall postCommentCall = PostCommentCall();
}

class LoginAPICall {
  Future<ApiCallResponse> call({
    String? identifier = '',
    String? password = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "identifier": "${escapeStringForJson(identifier)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login API',
      apiUrl: '${baseUrl}/auth/local',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssignedOngoingClassesCall {
  Future<ApiCallResponse> call({
    int? limit = -1,
    int? page = 0,
    dynamic fieldsJson,
    dynamic durationJson,
    String? currentDate = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final fields = _serializeJson(fieldsJson, true);
    final duration = _serializeJson(durationJson);
    final ffApiRequestBody = '''
{
  "fields": [
    "id",
    "class_name"
  ],
  "limit": ${limit},
  "page": ${page},
  "duration": {
    "start": {
      "\$lte": "${escapeStringForJson(currentDate)}"
    },
    "\$or": [
      {
        "end": {
          "\$gte": "${escapeStringForJson(currentDate)}"
        }
      },
      {
        "end": {
          "\$null": true
        }
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Assigned Ongoing Classes',
      apiUrl: '${baseUrl}/classes/me',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAssignedUpcomingClassesCall {
  Future<ApiCallResponse> call({
    int? limit = -1,
    int? page = 0,
    dynamic fieldsJson,
    dynamic durationJson,
    String? currentDate = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final fields = _serializeJson(fieldsJson, true);
    final duration = _serializeJson(durationJson);
    final ffApiRequestBody = '''
{
  "fields": [
    "id",
    "class_name"
  ],
  "limit": ${limit},
  "page": ${page},
  "duration": {
    "start": {
      "\$gt": "${escapeStringForJson(currentDate)}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Assigned Upcoming Classes',
      apiUrl: '${baseUrl}/classes/me',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAssignedCompletedClassesCall {
  Future<ApiCallResponse> call({
    int? limit = -1,
    int? page = 0,
    dynamic fieldsJson,
    dynamic durationJson,
    String? currentDate = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final fields = _serializeJson(fieldsJson, true);
    final duration = _serializeJson(durationJson);
    final ffApiRequestBody = '''
{
  "fields": [
    "id",
    "class_name"
  ],
  "limit": ${limit},
  "page": ${page},
  "duration": {
    "end": {
      "\$lt": "${escapeStringForJson(currentDate)}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Assigned Completed Classes',
      apiUrl: '${baseUrl}/classes/me',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetMyLearnerProfileCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get My Learner Profile',
      apiUrl: '${baseUrl}/learner-profiles/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetClassInformationCall {
  Future<ApiCallResponse> call({
    int? classId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Class Information',
      apiUrl: '${baseUrl}/classes/${classId}/get-information',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.id''',
      ));
}

class GetMyLearningStatisticsCall {
  Future<ApiCallResponse> call({
    int? memberId,
    String? orgSlug = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get My Learning Statistics',
      apiUrl:
          '${baseUrl}/organization-members/${memberId}/organizations/${orgSlug}/learning-statistics',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetGamificationsCall {
  Future<ApiCallResponse> call({
    String? orgSlug = 'general-demo',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Gamifications',
      apiUrl: '${baseUrl}/organizations/${orgSlug}/my-gamifications',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? xp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.xp''',
      ));
  int? lh(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.learning_hours''',
      ));
}

class GetClassSessionsCall {
  Future<ApiCallResponse> call({
    int? classId = 30557,
    int? learnerId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Class Sessions',
      apiUrl:
          '${baseUrl}/sessions/classes/${classId}/learner-profiles/${learnerId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetLearnerDiscussionCall {
  Future<ApiCallResponse> call({
    int? classId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Learner Discussion',
      apiUrl: '${baseUrl}/classes/${classId}/learner-discussion',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? trainers(dynamic response) => getJsonField(
        response,
        r'''$.data.trainer_profiles''',
        true,
      ) as List?;
  List? learners(dynamic response) => getJsonField(
        response,
        r'''$.data.learner_profiles''',
        true,
      ) as List?;
  List? tags(dynamic response) => getJsonField(
        response,
        r'''$.data.tags''',
        true,
      ) as List?;
  List? topics(dynamic response) => getJsonField(
        response,
        r'''$.data.topics''',
        true,
      ) as List?;
}

class GetCurrentLearnerCall {
  Future<ApiCallResponse> call({
    int? classId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Current Learner',
      apiUrl:
          '${baseUrl}/learner-profiles/get-current-learner/classes/${classId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.id''',
      ));
}

class GetUserAuthorizationCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Authorization',
      apiUrl: '${baseUrl}/user/authorization',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic us(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
}

class GetQuizAttemptHistoryCall {
  Future<ApiCallResponse> call({
    int? classId,
    int? sessionMaterialId,
    int? learnerId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Quiz Attempt History',
      apiUrl:
          '${baseUrl}/form-results/classes/${classId}/session-materials/${sessionMaterialId}/learner-profiles/${learnerId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dt(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetInternalQuizCall {
  Future<ApiCallResponse> call({
    int? classId,
    int? sessionMaterialId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Internal Quiz',
      apiUrl:
          '${baseUrl}/session-materials/${sessionMaterialId}/classes/${classId}/get-internal-quiz',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? qs(dynamic response) => getJsonField(
        response,
        r'''$.data.material.internal_quiz.internal_quiz_questions''',
        true,
      ) as List?;
  dynamic iq(dynamic response) => getJsonField(
        response,
        r'''$.data.material.internal_quiz''',
      );
}

class GetMyOrganizationsCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get My Organizations',
      apiUrl: '${baseUrl}/organizations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'fields[0]': "id",
        'fields[1]': "slug",
        'filters[organization_members][user][id]': userId,
        'populate[organization_members][fields][0]': "id",
        'populate[organization_members][filters][user][id]': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? os(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetMemberGamificationCall {
  Future<ApiCallResponse> call({
    String? orgSlug = '',
    int? memberId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Member Gamification',
      apiUrl:
          '${baseUrl}/organizations/${orgSlug}/members/${memberId}/gamification',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? xp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.xp''',
      ));
  int? lh(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.learning_hours''',
      ));
  bool? cx(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.can_view_xp''',
      ));
  bool? cl(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.can_view_learning_hours''',
      ));
}

class GetMemberLearnerStatisticsCall {
  Future<ApiCallResponse> call({
    int? memberId,
    String? orgSlug = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Member Learner Statistics',
      apiUrl:
          '${baseUrl}/organization-members/${memberId}/organizations/${orgSlug}/learning-statistics',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TriggerMaterialCall {
  Future<ApiCallResponse> call({
    int? sessionId,
    int? materialId,
    int? learnerId,
    String? action = 'DOWNLOAD',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "data": {
    "sessionId": ${sessionId},
    "materialId": ${materialId},
    "learnerId": ${learnerId},
    "action": "${escapeStringForJson(action)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Trigger Material',
      apiUrl: '${baseUrl}/materials/trigger',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? st(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class SubmitQuizCall {
  Future<ApiCallResponse> call({
    int? classId,
    int? materialId,
    int? learnerId,
    int? internalQuizId,
    int? sessionMaterialId,
    int? sessionId,
    int? score,
    dynamic internalQuizAnswersJson,
    String? submitedAt = '',
    String? startedAt = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final internalQuizAnswers = _serializeJson(internalQuizAnswersJson, true);
    final ffApiRequestBody = '''
{
  "internal_quiz": ${internalQuizId},
  "learner_profile": ${learnerId},
  "sessionMaterialId": ${sessionMaterialId},
  "sessionId": ${sessionId},
  "materialId": ${materialId},
  "learnerId": ${learnerId},
  "status": "FINISH",
  "score": ${score},
  "classes": ${classId},
  "internal_quiz_answers": ${internalQuizAnswers},
  "submit_at": "${escapeStringForJson(submitedAt)}",
  "start_at": "${escapeStringForJson(startedAt)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Submit Quiz',
      apiUrl: '${baseUrl}/form-results/submit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNotificationCall {
  Future<ApiCallResponse> call({
    String? type = 'ALL',
    int? page = 1,
    int? pageSize = 8,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Notification',
      apiUrl: '${baseUrl}/notifications',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'type': type,
        'page': page,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? totalUnseen(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalUnseen''',
      ));
}

class ViewNotificationCall {
  Future<ApiCallResponse> call({
    int? notificationId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'View Notification',
      apiUrl: '${baseUrl}/notifications/${notificationId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetClassDetailsCall {
  Future<ApiCallResponse> call({
    int? classId,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Class Details',
      apiUrl: '${baseUrl}/classes',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'fields[0]': "id",
        'fields[1]': "class_name",
        'filters[id]': classId,
        'populate[course][fields][0]': "id",
        'populate[course][populate][main_image][fields][0]': "id",
        'populate[course][populate][main_image][populate][file][fields][0]':
            "url",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic classData(dynamic response) => getJsonField(
        response,
        r'''$.data[0]''',
      );
}

class GetCommentsCall {
  Future<ApiCallResponse> call({
    int? classId,
    int? topicId,
    int? page = 1,
    int? pageSize = 5,
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Comments',
      apiUrl: '${baseUrl}/classes/${classId}/topics/${topicId}/comments',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'page': page,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? comments(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? totalComments(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.meta.pagination.total''',
      ));
}

class PostCommentCall {
  Future<ApiCallResponse> call({
    int? classId,
    int? topicId,
    String? content = '',
    String? jwt = '',
  }) async {
    final baseUrl = StagingAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "content": "${escapeStringForJson(content)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Comment',
      apiUrl: '${baseUrl}/classes/${classId}/topics/${topicId}/comments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic comment(dynamic response) => getJsonField(
        response,
        r'''$.data.comment''',
      );
}

/// End Staging API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

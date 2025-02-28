import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'class_component_widget.dart' show ClassComponentWidget;
import 'package:flutter/material.dart';

class ClassComponentModel extends FlutterFlowModel<ClassComponentWidget> {
  ///  Local state fields for this component.

  int? classId;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Class Details)] action in Container widget.
  ApiCallResponse? classDataResponse;
  // Stores action output result for [Backend Call - API (Get Current Learner)] action in Container widget.
  ApiCallResponse? currentLearnerResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

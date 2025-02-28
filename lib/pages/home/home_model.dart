import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get User Authorization)] action in Home widget.
  ApiCallResponse? userAuthorizationResult;
  // Stores action output result for [Backend Call - API (Get My Organizations)] action in Home widget.
  ApiCallResponse? myOrganizationsResults;
  // Stores action output result for [Backend Call - API (Get Member Gamification)] action in Home widget.
  ApiCallResponse? gamificationResult;
  // Stores action output result for [Backend Call - API (Get Member Learner Statistics)] action in Home widget.
  ApiCallResponse? learningStatisticsResult;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}

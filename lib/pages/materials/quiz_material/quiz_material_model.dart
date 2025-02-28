import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'quiz_material_widget.dart' show QuizMaterialWidget;
import 'package:flutter/material.dart';

class QuizMaterialModel extends FlutterFlowModel<QuizMaterialWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Backend Call - API (Get Internal Quiz)] action in Button widget.
  ApiCallResponse? apiResulto9f;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}

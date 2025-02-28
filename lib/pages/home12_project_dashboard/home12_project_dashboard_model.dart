import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home12_project_dashboard_widget.dart' show Home12ProjectDashboardWidget;
import 'package:flutter/material.dart';

class Home12ProjectDashboardModel
    extends FlutterFlowModel<Home12ProjectDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}

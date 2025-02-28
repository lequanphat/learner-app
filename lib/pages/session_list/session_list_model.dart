import '/components/session_list_comp/session_list_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'session_list_widget.dart' show SessionListWidget;
import 'package:flutter/material.dart';

class SessionListModel extends FlutterFlowModel<SessionListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SessionList_comp component.
  late SessionListCompModel sessionListCompModel;

  @override
  void initState(BuildContext context) {
    sessionListCompModel = createModel(context, () => SessionListCompModel());
  }

  @override
  void dispose() {
    sessionListCompModel.dispose();
  }
}

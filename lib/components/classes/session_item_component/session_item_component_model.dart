import '/flutter_flow/flutter_flow_util.dart';
import 'session_item_component_widget.dart' show SessionItemComponentWidget;
import 'package:flutter/material.dart';

class SessionItemComponentModel
    extends FlutterFlowModel<SessionItemComponentWidget> {
  ///  Local state fields for this component.

  List<dynamic> sessionLearnerMaterials = [];
  void addToSessionLearnerMaterials(dynamic item) =>
      sessionLearnerMaterials.add(item);
  void removeFromSessionLearnerMaterials(dynamic item) =>
      sessionLearnerMaterials.remove(item);
  void removeAtIndexFromSessionLearnerMaterials(int index) =>
      sessionLearnerMaterials.removeAt(index);
  void insertAtIndexInSessionLearnerMaterials(int index, dynamic item) =>
      sessionLearnerMaterials.insert(index, item);
  void updateSessionLearnerMaterialsAtIndex(
          int index, Function(dynamic) updateFn) =>
      sessionLearnerMaterials[index] = updateFn(sessionLearnerMaterials[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

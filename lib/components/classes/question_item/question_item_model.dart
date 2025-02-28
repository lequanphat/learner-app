import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'question_item_widget.dart' show QuestionItemWidget;
import 'package:flutter/material.dart';

class QuestionItemModel extends FlutterFlowModel<QuestionItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shortAnswerInput widget.
  FocusNode? shortAnswerInputFocusNode;
  TextEditingController? shortAnswerInputTextController;
  String? Function(BuildContext, String?)?
      shortAnswerInputTextControllerValidator;
  // State field(s) for paragraphInput widget.
  FocusNode? paragraphInputFocusNode;
  TextEditingController? paragraphInputTextController;
  String? Function(BuildContext, String?)?
      paragraphInputTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    shortAnswerInputFocusNode?.dispose();
    shortAnswerInputTextController?.dispose();

    paragraphInputFocusNode?.dispose();
    paragraphInputTextController?.dispose();
  }
}

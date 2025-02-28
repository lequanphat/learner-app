import '/components/calendar/calendar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedule_option2_widget.dart' show ScheduleOption2Widget;
import 'package:flutter/material.dart';

class ScheduleOption2Model extends FlutterFlowModel<ScheduleOption2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Calendar component.
  late CalendarModel calendarModel;

  @override
  void initState(BuildContext context) {
    calendarModel = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    calendarModel.dispose();
  }
}

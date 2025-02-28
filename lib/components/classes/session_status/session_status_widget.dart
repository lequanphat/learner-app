import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'session_status_model.dart';
export 'session_status_model.dart';

class SessionStatusWidget extends StatefulWidget {
  const SessionStatusWidget({
    super.key,
    required this.isCompleted,
    required this.isProgress,
  });

  final bool? isCompleted;
  final bool? isProgress;

  @override
  State<SessionStatusWidget> createState() => _SessionStatusWidgetState();
}

class _SessionStatusWidgetState extends State<SessionStatusWidget> {
  late SessionStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.isCompleted == true)
          Container(
            width: 44.94,
            height: 305.4,
            decoration: BoxDecoration(
              color: Color(0xFF2EF31E),
            ),
          ),
        if (widget.isProgress == true)
          Container(
            width: 48.41,
            height: 307.6,
            decoration: BoxDecoration(
              color: Color(0xFF328FDE),
            ),
          ),
        if ((widget.isCompleted == false) && !widget.isProgress!)
          Container(
            width: 47.6,
            height: 303.49,
            decoration: BoxDecoration(
              color: Color(0xFF423C3C),
            ),
          ),
      ],
    );
  }
}

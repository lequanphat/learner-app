import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_radio_button_model.dart';
export 'custom_radio_button_model.dart';

class CustomRadioButtonWidget extends StatefulWidget {
  const CustomRadioButtonWidget({
    super.key,
    required this.option,
    required this.questionId,
  });

  final dynamic option;
  final int? questionId;

  @override
  State<CustomRadioButtonWidget> createState() =>
      _CustomRadioButtonWidgetState();
}

class _CustomRadioButtonWidgetState extends State<CustomRadioButtonWidget> {
  late CustomRadioButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomRadioButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        FFAppState().internalQuizAnswers = functions
            .radioChange(
                FFAppState().internalQuizAnswers.toList(),
                widget.questionId,
                getJsonField(
                  widget.option,
                  r'''$.id''',
                ),
                !functions.isChecked(
                    FFAppState().internalQuizAnswers.toList(),
                    widget.questionId,
                    getJsonField(
                      widget.option,
                      r'''$.id''',
                    ))!)!
            .toList()
            .cast<dynamic>();
        FFAppState().update(() {});
      },
      child: Container(
        width: 322.8,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0),
                  ),
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      functions.getRadioButtonColor(functions.isChecked(
                          FFAppState().internalQuizAnswers.toList(),
                          widget.questionId,
                          getJsonField(
                            widget.option,
                            r'''$.id''',
                          ))),
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    width: 2.0,
                  ),
                ),
                child: Visibility(
                  visible: functions.isChecked(
                          FFAppState().internalQuizAnswers.toList(),
                          widget.questionId,
                          getJsonField(
                            widget.option,
                            r'''$.id''',
                          )) ??
                      true,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100.0),
                          bottomRight: Radius.circular(100.0),
                          topLeft: Radius.circular(100.0),
                          topRight: Radius.circular(100.0),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                getJsonField(
                  widget.option,
                  r'''$.label''',
                ).toString(),
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}

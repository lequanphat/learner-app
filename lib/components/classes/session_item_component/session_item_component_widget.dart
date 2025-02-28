import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'session_item_component_model.dart';
export 'session_item_component_model.dart';

class SessionItemComponentWidget extends StatefulWidget {
  const SessionItemComponentWidget({
    super.key,
    required this.sessionName,
    required this.sessionDescription,
    required this.xp,
    required this.learningHours,
    required this.sessionLearner,
    required this.sessionLearnerMaterials,
    bool? isCheckIn,
    required this.isFeedback,
    required this.sessionMaterials,
    required this.sessionId,
  }) : this.isCheckIn = isCheckIn ?? false;

  /// Session Name
  final String? sessionName;

  final String? sessionDescription;

  /// xp
  final int? xp;

  /// Learning Hours
  final int? learningHours;

  final dynamic sessionLearner;
  final List<dynamic>? sessionLearnerMaterials;
  final bool isCheckIn;
  final bool? isFeedback;
  final List<dynamic>? sessionMaterials;
  final int? sessionId;

  @override
  State<SessionItemComponentWidget> createState() =>
      _SessionItemComponentWidgetState();
}

class _SessionItemComponentWidgetState
    extends State<SessionItemComponentWidget> {
  late SessionItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionItemComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: 637.9,
        height: 134.28,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0xFFE0E3E7),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 2.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (widget.isCheckIn == false) {
                if (widget.isFeedback == true) {
                  context.pushNamed(FeedbackPageWidget.routeName);
                } else {
                  context.pushNamed(
                    SessionsWidget.routeName,
                    queryParameters: {
                      'sessionName': serializeParam(
                        widget.sessionName,
                        ParamType.String,
                      ),
                      'sessionDescription': serializeParam(
                        widget.sessionDescription,
                        ParamType.String,
                      ),
                      'sessionLearner': serializeParam(
                        widget.sessionLearner,
                        ParamType.JSON,
                      ),
                      'sessionLearnerMaterials': serializeParam(
                        widget.sessionLearnerMaterials,
                        ParamType.JSON,
                        isList: true,
                      ),
                      'sessionMaterials': serializeParam(
                        widget.sessionMaterials,
                        ParamType.JSON,
                        isList: true,
                      ),
                      'xp': serializeParam(
                        widget.xp,
                        ParamType.int,
                      ),
                      'learningHours': serializeParam(
                        widget.learningHours,
                        ParamType.int,
                      ),
                      'sessionId': serializeParam(
                        widget.sessionId,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                }

                FFAppState().sessionId = widget.sessionId!;
                safeSetState(() {});
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Contact your trainer to check-in this class',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                  child: Container(
                    width: 8.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: functions.getSessionStatusColor(
                          getJsonField(
                            widget.sessionLearner,
                            r'''$.completed''',
                          ),
                          getJsonField(
                            widget.sessionLearner,
                            r'''$.isProgress''',
                          ),
                          getJsonField(
                            widget.sessionLearner,
                            r'''$.available''',
                          )),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.sessionName,
                              'Session Name',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                        if ((widget.sessionDescription != null &&
                                widget.sessionDescription != '') &&
                            !widget.isCheckIn &&
                            !widget.isFeedback!)
                          Text(
                            valueOrDefault<String>(
                              widget.sessionDescription,
                              'Session Description',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        if ((widget.isCheckIn == false) &&
                            (widget.isFeedback == false))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.learningHours?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 2.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.xp?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 2.0)),
                                ),
                              ].divide(SizedBox(width: 28.0)),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if ((widget.isCheckIn == false) && !widget.isFeedback!)
                  CircularPercentIndicator(
                    percent: functions.calculateSessionProgress(
                        widget.sessionLearnerMaterials?.toList())!,
                    radius: 30.0,
                    lineWidth: 6.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: FlutterFlowTheme.of(context).primary,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    center: Text(
                      valueOrDefault<String>(
                        functions.getSessionProgressPercentage(
                            widget.sessionLearnerMaterials?.toList()),
                        '0%',
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelLargeFamily,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelLargeFamily),
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

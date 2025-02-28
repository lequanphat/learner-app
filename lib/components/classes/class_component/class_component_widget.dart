import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'class_component_model.dart';
export 'class_component_model.dart';

class ClassComponentWidget extends StatefulWidget {
  const ClassComponentWidget({
    super.key,
    this.className,
    required this.classId,
    required this.organizationImageUrl,
    required this.organizationName,
    bool? isPassed,
  }) : this.isPassed = isPassed ?? false;

  final String? className;
  final int? classId;
  final String? organizationImageUrl;
  final String? organizationName;
  final bool isPassed;

  @override
  State<ClassComponentWidget> createState() => _ClassComponentWidgetState();
}

class _ClassComponentWidgetState extends State<ClassComponentWidget> {
  late ClassComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClassComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          FFAppState().classId = widget.classId!;
          safeSetState(() {});
          _model.classDataResponse =
              await StagingAPIGroup.getClassDetailsCall.call(
            classId: widget.classId,
            jwt: currentAuthenticationToken,
          );

          FFAppState().classData =
              StagingAPIGroup.getClassDetailsCall.classData(
            (_model.classDataResponse?.jsonBody ?? ''),
          );
          safeSetState(() {});
          _model.currentLearnerResponse =
              await StagingAPIGroup.getCurrentLearnerCall.call(
            classId: widget.classId,
            jwt: currentAuthenticationToken,
          );

          if ((_model.currentLearnerResponse?.succeeded ?? true)) {
            FFAppState().currentLearner =
                StagingAPIGroup.getCurrentLearnerCall.dt(
              (_model.currentLearnerResponse?.jsonBody ?? ''),
            );
            safeSetState(() {});
          }

          context.pushNamed(LearnWidget.routeName);

          safeSetState(() {});
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.className,
                    '[Class Name]',
                  ),
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
                if (widget.isPassed == true)
                  Container(
                    width: 100.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEAF7EC),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'PASSED',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFF2FB34F),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                Divider(
                  height: 24.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.organizationImageUrl,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/xx3isbntugdk/SmartR_Logo_Insignia.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.organizationName,
                        '[Organization Name]',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

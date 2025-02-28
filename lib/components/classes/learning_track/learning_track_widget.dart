import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/classes/session_item_component/session_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learning_track_model.dart';
export 'learning_track_model.dart';

class LearningTrackWidget extends StatefulWidget {
  const LearningTrackWidget({super.key});

  @override
  State<LearningTrackWidget> createState() => _LearningTrackWidgetState();
}

class _LearningTrackWidgetState extends State<LearningTrackWidget> {
  late LearningTrackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningTrackModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 4.0),
                child: Text(
                  'Learning Track',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'A summary of outstanding sessions.',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelMediumFamily),
                      ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: double.infinity,
              maxWidth: double.infinity,
              maxHeight: double.infinity,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: FutureBuilder<ApiCallResponse>(
                future: StagingAPIGroup.getClassSessionsCall.call(
                  jwt: currentAuthenticationToken,
                  classId: FFAppState().classId,
                  learnerId: getJsonField(
                    FFAppState().currentLearner,
                    r'''$.id''',
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final listViewGetClassSessionsResponse = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      final sessions = StagingAPIGroup.getClassSessionsCall
                              .dt(
                                listViewGetClassSessionsResponse.jsonBody,
                              )
                              ?.toList() ??
                          [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: sessions.length,
                        itemBuilder: (context, sessionsIndex) {
                          final sessionsItem = sessions[sessionsIndex];
                          return SessionItemComponentWidget(
                            key: Key(
                                'Keydzm_${sessionsIndex}_of_${sessions.length}'),
                            sessionName: getJsonField(
                              sessionsItem,
                              r'''$.name''',
                            ).toString(),
                            sessionDescription: getJsonField(
                              sessionsItem,
                              r'''$.description''',
                            ).toString(),
                            xp: getJsonField(
                              sessionsItem,
                              r'''$.session_point''',
                            ),
                            learningHours: getJsonField(
                              sessionsItem,
                              r'''$.total_duration''',
                            ),
                            sessionLearner: getJsonField(
                              sessionsItem,
                              r'''$.session_learners[0]''',
                            ),
                            sessionLearnerMaterials: getJsonField(
                              sessionsItem,
                              r'''$.session_learner_materials''',
                              true,
                            )!,
                            isCheckIn: getJsonField(
                              sessionsItem,
                              r'''$.is_check_in''',
                            ),
                            isFeedback: getJsonField(
                              sessionsItem,
                              r'''$.is_feedback''',
                            ),
                            sessionMaterials: getJsonField(
                              sessionsItem,
                              r'''$.session_materials''',
                              true,
                            )!,
                            sessionId: getJsonField(
                              sessionsItem,
                              r'''$.id''',
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

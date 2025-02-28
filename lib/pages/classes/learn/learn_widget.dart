import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/classes/session_item_component/session_item_component_widget.dart';
import '/components/classes/topic_item/topic_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learn_model.dart';
export 'learn_model.dart';

class LearnWidget extends StatefulWidget {
  const LearnWidget({super.key});

  static String routeName = 'Learn';
  static String routePath = '/learn';

  @override
  State<LearnWidget> createState() => _LearnWidgetState();
}

class _LearnWidgetState extends State<LearnWidget>
    with TickerProviderStateMixin {
  late LearnModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 180.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x320E151B),
                      offset: Offset(
                        0.0,
                        -2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            getJsonField(
                              FFAppState().classData,
                              r'''$.course.main_image.file.url''',
                            )?.toString(),
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/m4axgj5lo7s8/banner_template.png',
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 42.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Text(
                        valueOrDefault<String>(
                          getJsonField(
                            FFAppState().classData,
                            r'''$.class_name''',
                          )?.toString(),
                          'Class name',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily),
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                tabs: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 0.0),
                                        child: Icon(
                                          Icons.leaderboard,
                                          size: 20.0,
                                        ),
                                      ),
                                      Tab(
                                        text: 'Sessions',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 6.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidCommentDots,
                                          size: 18.0,
                                        ),
                                      ),
                                      Tab(
                                        text: 'Discussion',
                                      ),
                                    ],
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  FutureBuilder<ApiCallResponse>(
                                    future: StagingAPIGroup.getClassSessionsCall
                                        .call(
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final columnGetClassSessionsResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final sessions = StagingAPIGroup
                                                  .getClassSessionsCall
                                                  .dt(
                                                    columnGetClassSessionsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children:
                                                  List.generate(sessions.length,
                                                      (sessionsIndex) {
                                                final sessionsItem =
                                                    sessions[sessionsIndex];
                                                return SessionItemComponentWidget(
                                                  key: Key(
                                                      'Keyc7c_${sessionsIndex}_of_${sessions.length}'),
                                                  sessionName: getJsonField(
                                                    sessionsItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  sessionDescription:
                                                      getJsonField(
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
                                                  isCheckIn: getJsonField(
                                                    sessionsItem,
                                                    r'''$.is_check_in''',
                                                  ),
                                                  isFeedback: getJsonField(
                                                    sessionsItem,
                                                    r'''$.is_feedback''',
                                                  ),
                                                  sessionId: getJsonField(
                                                    sessionsItem,
                                                    r'''$.id''',
                                                  ),
                                                  sessionLearner: getJsonField(
                                                    sessionsItem,
                                                    r'''$.session_learners[0]''',
                                                  ),
                                                  sessionLearnerMaterials:
                                                      getJsonField(
                                                    sessionsItem,
                                                    r'''$.session_learner_materials''',
                                                    true,
                                                  )!,
                                                  sessionMaterials:
                                                      getJsonField(
                                                    sessionsItem,
                                                    r'''$.session_materials''',
                                                    true,
                                                  )!,
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: StagingAPIGroup
                                        .getLearnerDiscussionCall
                                        .call(
                                      jwt: currentAuthenticationToken,
                                      classId: FFAppState().classId,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final columnGetLearnerDiscussionResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final topics = StagingAPIGroup
                                                  .getLearnerDiscussionCall
                                                  .topics(
                                                    columnGetLearnerDiscussionResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  topics.length, (topicsIndex) {
                                                final topicsItem =
                                                    topics[topicsIndex];
                                                return TopicItemWidget(
                                                  key: Key(
                                                      'Keyuzs_${topicsIndex}_of_${topics.length}'),
                                                  topic: topicsItem,
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

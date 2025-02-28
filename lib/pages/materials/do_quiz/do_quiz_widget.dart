import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/classes/question_item/question_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'do_quiz_model.dart';
export 'do_quiz_model.dart';

class DoQuizWidget extends StatefulWidget {
  const DoQuizWidget({
    super.key,
    required this.sessionMaterial,
    required this.questions,
    required this.startedAt,
  });

  final dynamic sessionMaterial;
  final List<dynamic>? questions;
  final String? startedAt;

  static String routeName = 'DoQuiz';
  static String routePath = '/doQuiz';

  @override
  State<DoQuizWidget> createState() => _DoQuizWidgetState();
}

class _DoQuizWidgetState extends State<DoQuizWidget>
    with TickerProviderStateMixin {
  late DoQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoQuizModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 190.0.ms,
            begin: -0.1,
            end: 0.1,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 52.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.sessionMaterial,
                      r'''$.material.name''',
                    )?.toString(),
                    'Material Name',
                  ),
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
                      if (functions
                              .getTimeOfQuiz(
                                  valueOrDefault<int>(
                                    getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.time_limit''',
                                    ),
                                    9,
                                  ),
                                  getJsonField(
                                    widget.sessionMaterial,
                                    r'''$.time.from''',
                                  ).toString(),
                                  getJsonField(
                                    widget.sessionMaterial,
                                    r'''$.time.to''',
                                  ).toString())
                              .toString() !=
                          '0')
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: FlutterFlowTimer(
                              initialTime: valueOrDefault<int>(
                                functions.getTimeOfQuiz(
                                    valueOrDefault<int>(
                                      getJsonField(
                                        widget.sessionMaterial,
                                        r'''$.time_limit''',
                                      ),
                                      0,
                                    ),
                                    getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.time.from''',
                                    ).toString(),
                                    getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.time.to''',
                                    ).toString()),
                                0,
                              ),
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) safeSetState(() {});
                              },
                              onEnded: () async {
                                _model.result =
                                    await StagingAPIGroup.submitQuizCall.call(
                                  classId: FFAppState().classId,
                                  materialId: getJsonField(
                                    widget.sessionMaterial,
                                    r'''$.material.id''',
                                  ),
                                  learnerId: getJsonField(
                                    FFAppState().currentLearner,
                                    r'''$.id''',
                                  ),
                                  jwt: currentAuthenticationToken,
                                  sessionId: FFAppState().sessionId,
                                  internalQuizId: getJsonField(
                                    widget.sessionMaterial,
                                    r'''$.material.internal_quiz.id''',
                                  ),
                                  score: valueOrDefault<int>(
                                    functions.getTotalScore(FFAppState()
                                        .internalQuizAnswers
                                        .toList()),
                                    0,
                                  ),
                                  sessionMaterialId: getJsonField(
                                    widget.sessionMaterial,
                                    r'''$.id''',
                                  ),
                                  internalQuizAnswersJson:
                                      functions.calculateScoreForEachQuestion(
                                          FFAppState()
                                              .internalQuizAnswers
                                              .toList()),
                                  submitedAt: functions.getCurrentISOdate(),
                                  startedAt: widget.startedAt,
                                );

                                if ((_model.result?.succeeded ?? true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Submited Successully',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  context.safePop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Failed to submit quiz',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        offset: Offset(1.8, 1.8),
                                        blurRadius: 1.6,
                                      )
                                    ],
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
                centerTitle: false,
                elevation: 1.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final quizQuestions = widget.questions!.toList();

                              return Container(
                                width: double.infinity,
                                height: 500.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        0,
                                                        quizQuestions.length -
                                                            1))),
                                        onPageChanged: (_) =>
                                            safeSetState(() {}),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: quizQuestions.length,
                                        itemBuilder:
                                            (context, quizQuestionsIndex) {
                                          final quizQuestionsItem =
                                              quizQuestions[quizQuestionsIndex];
                                          return QuestionItemWidget(
                                            key: Key(
                                                'Keys9f_${quizQuestionsIndex}_of_${quizQuestions.length}'),
                                            question: quizQuestionsItem,
                                            type: valueOrDefault<String>(
                                              getJsonField(
                                                quizQuestionsItem,
                                                r'''$.answer_type''',
                                              )?.toString(),
                                              'CHECKBOXES',
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          quizQuestions.length -
                                                              1))),
                                          count: quizQuestions.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            safeSetState(() {});
                                          },
                                          effect:
                                              smooth_page_indicator.SlideEffect(
                                            spacing: 8.0,
                                            radius: 8.0,
                                            dotWidth: 8.0,
                                            dotHeight: 8.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await _model.pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.apiResultmnf =
                                      await StagingAPIGroup.submitQuizCall.call(
                                    jwt: currentAuthenticationToken,
                                    classId: FFAppState().classId,
                                    sessionId: FFAppState().sessionId,
                                    learnerId: getJsonField(
                                      FFAppState().currentLearner,
                                      r'''$.id''',
                                    ),
                                    materialId: getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.material.id''',
                                    ),
                                    sessionMaterialId: getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.id''',
                                    ),
                                    internalQuizAnswersJson:
                                        functions.calculateScoreForEachQuestion(
                                            FFAppState()
                                                .internalQuizAnswers
                                                .toList()),
                                    internalQuizId: getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.material.internal_quiz.id''',
                                    ),
                                    score: functions.getTotalScore(FFAppState()
                                        .internalQuizAnswers
                                        .toList()),
                                    submitedAt: functions.getCurrentISOdate(),
                                    startedAt: widget.startedAt,
                                  );

                                  if ((_model.apiResultmnf?.succeeded ??
                                      true)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Submited Successfully',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    context.safePop();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Failed to submit anwers',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
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
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}

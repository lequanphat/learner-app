import '/components/custom/custom_radio_button/custom_radio_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_item_model.dart';
export 'question_item_model.dart';

class QuestionItemWidget extends StatefulWidget {
  const QuestionItemWidget({
    super.key,
    required this.question,
    required this.type,
  });

  final dynamic question;

  /// Type of question
  final String? type;

  @override
  State<QuestionItemWidget> createState() => _QuestionItemWidgetState();
}

class _QuestionItemWidgetState extends State<QuestionItemWidget> {
  late QuestionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionItemModel());

    _model.shortAnswerInputTextController ??= TextEditingController(
        text: functions.getShortAnswer(
            FFAppState().internalQuizAnswers.toList(),
            getJsonField(
              widget.question,
              r'''$.id''',
            )));
    _model.shortAnswerInputFocusNode ??= FocusNode();
    _model.shortAnswerInputFocusNode!.addListener(
      () async {
        FFAppState().internalQuizAnswers = functions
            .shortAnswerChange(
                FFAppState().internalQuizAnswers.toList(),
                getJsonField(
                  widget.question,
                  r'''$.id''',
                ),
                _model.shortAnswerInputTextController.text)!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      },
    );
    _model.paragraphInputTextController ??= TextEditingController(
        text: functions.getParagraphAnswer(
            FFAppState().internalQuizAnswers.toList(),
            getJsonField(
              widget.question,
              r'''$.id''',
            )));
    _model.paragraphInputFocusNode ??= FocusNode();
    _model.paragraphInputFocusNode!.addListener(
      () async {
        FFAppState().internalQuizAnswers = functions
            .paragraphChange(
                FFAppState().internalQuizAnswers.toList(),
                getJsonField(
                  widget.question,
                  r'''$.id''',
                ),
                _model.paragraphInputTextController.text)!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      },
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 100.0,
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
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: FlutterFlowWebView(
                    content: getJsonField(
                      widget.question,
                      r'''$.question''',
                    ).toString(),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    verticalScroll: false,
                    horizontalScroll: false,
                    html: true,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.type == 'SHORT_ANSWER')
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.shortAnswerInputTextController,
                            focusNode: _model.shortAnswerInputFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintText: 'Your answer....',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            maxLines: null,
                            minLines: 4,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .shortAnswerInputTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  if (widget.type == 'PARAGRAPH')
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.paragraphInputTextController,
                            focusNode: _model.paragraphInputFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintText: 'Your answer...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            maxLines: null,
                            minLines: 4,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .paragraphInputTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  if (widget.type == 'DROPDOWN')
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??=
                                functions.getSelectedDropdownItem(
                                    FFAppState().internalQuizAnswers.toList(),
                                    getJsonField(
                                      widget.question,
                                      r'''$.id''',
                                    )),
                          ),
                          options: (getJsonField(
                            widget.question,
                            r'''$.internal_quiz_question_options[:].label''',
                            true,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            FFAppState().internalQuizAnswers = functions
                                .dropdownChange(
                                    FFAppState().internalQuizAnswers.toList(),
                                    _model.dropDownValue,
                                    getJsonField(
                                      widget.question,
                                      r'''$.id''',
                                    ))!
                                .toList()
                                .cast<dynamic>();
                            safeSetState(() {});
                          },
                          width: 200.0,
                          height: 40.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          hintText: 'Select your answer...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Color(0xFFCCCCCC),
                          borderWidth: 0.6,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ],
                    ),
                  if ((widget.type == 'CHECKBOXES') ||
                      (widget.type == 'CHECKBOXES_BY_RESULT'))
                    Expanded(
                      flex: 1,
                      child: Builder(
                        builder: (context) {
                          final options = getJsonField(
                            widget.question,
                            r'''$.internal_quiz_question_options''',
                          ).toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children:
                                  List.generate(options.length, (optionsIndex) {
                                final optionsItem = options[optionsIndex];
                                return Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.standard,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize.padded,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          child: Checkbox(
                                            value: _model.checkboxValueMap[
                                                    optionsItem] ??=
                                                functions.isChecked(
                                                    FFAppState()
                                                        .internalQuizAnswers
                                                        .toList(),
                                                    getJsonField(
                                                      widget.question,
                                                      r'''$.id''',
                                                    ),
                                                    getJsonField(
                                                      optionsItem,
                                                      r'''$.id''',
                                                    ))!,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.checkboxValueMap[
                                                      optionsItem] = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                        .internalQuizAnswers =
                                                    functions
                                                        .checkboxChange(
                                                            FFAppState()
                                                                .internalQuizAnswers
                                                                .toList(),
                                                            true,
                                                            getJsonField(
                                                              widget.question,
                                                              r'''$.id''',
                                                            ),
                                                            getJsonField(
                                                              optionsItem,
                                                              r'''$.id''',
                                                            ))!
                                                        .toList()
                                                        .cast<dynamic>();
                                                safeSetState(() {});
                                              }
                                            },
                                            side: BorderSide(
                                              width: 2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              optionsItem,
                                              r'''$.label''',
                                            )?.toString(),
                                            'Option label',
                                          ),
                                          maxLines: 4,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(height: 12.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  if (widget.type == 'MULTIPLE_CHOICE')
                    Expanded(
                      flex: 1,
                      child: Builder(
                        builder: (context) {
                          final options = getJsonField(
                            widget.question,
                            r'''$.internal_quiz_question_options''',
                          ).toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children:
                                  List.generate(options.length, (optionsIndex) {
                                final optionsItem = options[optionsIndex];
                                return CustomRadioButtonWidget(
                                  key: Key(
                                      'Keyrvn_${optionsIndex}_of_${options.length}'),
                                  option: optionsItem,
                                  questionId: getJsonField(
                                    widget.question,
                                    r'''$.id''',
                                  ),
                                );
                              }).divide(SizedBox(height: 12.0)),
                            ),
                          );
                        },
                      ),
                    ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}

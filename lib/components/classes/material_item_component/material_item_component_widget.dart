import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'material_item_component_model.dart';
export 'material_item_component_model.dart';

class MaterialItemComponentWidget extends StatefulWidget {
  const MaterialItemComponentWidget({
    super.key,
    required this.materialName,
    required this.completionRequirement,
    required this.material,
    required this.type,
    required this.sessionMaterial,
    required this.sessionId,
  });

  final String? materialName;
  final String? completionRequirement;
  final dynamic material;
  final String? type;
  final dynamic sessionMaterial;
  final int? sessionId;

  @override
  State<MaterialItemComponentWidget> createState() =>
      _MaterialItemComponentWidgetState();
}

class _MaterialItemComponentWidgetState
    extends State<MaterialItemComponentWidget> {
  late MaterialItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaterialItemComponentModel());
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
        if (widget.type == 'PDF') {
          context.pushNamed(
            PDFMaterialWidget.routeName,
            queryParameters: {
              'sessionMaterial': serializeParam(
                widget.sessionMaterial,
                ParamType.JSON,
              ),
              'allowDownload': serializeParam(
                getJsonField(
                  widget.sessionMaterial,
                  r'''$.material.allow_download''',
                ),
                ParamType.bool,
              ),
            }.withoutNulls,
          );

          _model.apiResult1af = await StagingAPIGroup.triggerMaterialCall.call(
            jwt: currentAuthenticationToken,
            sessionId: widget.sessionId,
            materialId: getJsonField(
              widget.material,
              r'''$.id''',
            ),
            learnerId: getJsonField(
              FFAppState().currentLearner,
              r'''$.id''',
            ),
            action: 'VIEW',
          );
        } else {
          if ((widget.type == 'DOCS') ||
              (widget.type == 'EXCEL') ||
              (widget.type == 'POWERPOINT') ||
              (widget.type == 'KEYNOTE')) {
            context.pushNamed(
              DocMaterialWidget.routeName,
              queryParameters: {
                'sessionMaterial': serializeParam(
                  widget.sessionMaterial,
                  ParamType.JSON,
                ),
                'allowDownload': serializeParam(
                  getJsonField(
                    widget.sessionMaterial,
                    r'''$.material.allow_download''',
                  ),
                  ParamType.bool,
                ),
              }.withoutNulls,
            );
          } else {
            if (widget.type == 'YOUTUBE') {
              context.pushNamed(
                YoutubeMaterialWidget.routeName,
                queryParameters: {
                  'sessionMaterial': serializeParam(
                    widget.sessionMaterial,
                    ParamType.JSON,
                  ),
                }.withoutNulls,
              );

              _model.apiResult3w2 =
                  await StagingAPIGroup.triggerMaterialCall.call(
                jwt: currentAuthenticationToken,
                sessionId: FFAppState().sessionId,
                materialId: getJsonField(
                  widget.sessionMaterial,
                  r'''$.material.id''',
                ),
                learnerId: getJsonField(
                  FFAppState().currentLearner,
                  r'''$.id''',
                ),
                action: 'OPEN',
              );
            } else {
              if (widget.type == 'EXTERNAL_CONTENT') {
                context.pushNamed(
                  RichtextMaterialWidget.routeName,
                  queryParameters: {
                    'sessionMaterial': serializeParam(
                      widget.sessionMaterial,
                      ParamType.JSON,
                    ),
                  }.withoutNulls,
                );
              } else {
                if (widget.type == 'INTERACTIVE') {
                  context.pushNamed(
                    InteractiveMaterialWidget.routeName,
                    queryParameters: {
                      'sessionMaterial': serializeParam(
                        widget.sessionMaterial,
                        ParamType.JSON,
                      ),
                      'allowDownload': serializeParam(
                        false,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                  );
                } else {
                  if (widget.type == 'QUIZ') {
                    context.pushNamed(
                      QuizMaterialWidget.routeName,
                      queryParameters: {
                        'sessionMaterial': serializeParam(
                          getJsonField(
                            widget.sessionMaterial,
                            r'''$''',
                          ),
                          ParamType.JSON,
                        ),
                      }.withoutNulls,
                    );
                  }
                }
              }
            }
          }
        }

        safeSetState(() {});
      },
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  valueOrDefault<String>(
                    functions.getMaterialIconByType(getJsonField(
                      widget.material,
                      r'''$.type''',
                    ).toString()),
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/xx3isbntugdk/SmartR_Logo_Insignia.png',
                  ),
                  width: 42.0,
                  height: 42.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.materialName,
                        '[Material Name]',
                      ),
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            'Completion Requirement: ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            valueOrDefault<String>(
                              widget.completionRequirement,
                              '[data]',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_d_f_material_model.dart';
export 'p_d_f_material_model.dart';

class PDFMaterialWidget extends StatefulWidget {
  const PDFMaterialWidget({
    super.key,
    required this.sessionMaterial,
    required this.allowDownload,
  });

  final dynamic sessionMaterial;
  final bool? allowDownload;

  static String routeName = 'PDFMaterial';
  static String routePath = '/pDFMaterial';

  @override
  State<PDFMaterialWidget> createState() => _PDFMaterialWidgetState();
}

class _PDFMaterialWidgetState extends State<PDFMaterialWidget> {
  late PDFMaterialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFMaterialModel());
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
                  'Material',
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
                actions: [],
                centerTitle: false,
                elevation: 1.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              functions
                                  .getMaterialIconByType(valueOrDefault<String>(
                                getJsonField(
                                  widget.sessionMaterial,
                                  r'''$.material.type''',
                                )?.toString(),
                                'PDF',
                              )),
                              'https://picsum.photos/seed/142/600',
                            ),
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  getJsonField(
                                    widget.sessionMaterial,
                                    r'''$.material.name''',
                                  )?.toString(),
                                  '[Material Name]',
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displaySmallFamily,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Completion Requirement:',
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          widget.sessionMaterial,
                                          r'''$.completion_requirement''',
                                        )?.toString(),
                                        'PASS',
                                      ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 1.0,
                      color: Color(0xFFE0E3E7),
                    ),
                  ].divide(SizedBox(height: 2.0)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 356.67,
                  height: 476.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowPdfViewer(
                    networkPath: valueOrDefault<String>(
                      getJsonField(
                        widget.sessionMaterial,
                        r'''$.material.media.url''',
                      )?.toString(),
                      'http://www.pdf995.com/samples/pdf.pdf',
                    ),
                    height: 142.9,
                    horizontalScroll: false,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: (widget.allowDownload == false)
                          ? null
                          : () async {
                              await Future.wait([
                                Future(() async {
                                  await downloadFile(
                                    filename: getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.material.media.name''',
                                    ).toString(),
                                    url: getJsonField(
                                      widget.sessionMaterial,
                                      r'''$.material.media.url''',
                                    ).toString(),
                                  );
                                }),
                                Future(() async {
                                  _model.apiResult0p0 = await StagingAPIGroup
                                      .triggerMaterialCall
                                      .call(
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
                                    action: 'DOWNLOAD',
                                  );
                                }),
                              ]);

                              safeSetState(() {});
                            },
                      text: 'Download',
                      options: FFButtonOptions(
                        width: 220.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor: Color(0xFFE5E8EB),
                        disabledTextColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
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

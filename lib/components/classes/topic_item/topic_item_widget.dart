import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'topic_item_model.dart';
export 'topic_item_model.dart';

class TopicItemWidget extends StatefulWidget {
  const TopicItemWidget({
    super.key,
    required this.topic,
  });

  final dynamic topic;

  @override
  State<TopicItemWidget> createState() => _TopicItemWidgetState();
}

class _TopicItemWidgetState extends State<TopicItemWidget> {
  late TopicItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            ViewTopicWidget.routeName,
            queryParameters: {
              'topic': serializeParam(
                widget.topic,
                ParamType.JSON,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          height: 100.0,
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 46.0,
                height: 46.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.topic,
                      r'''$.user.avatar.url''',
                    )?.toString(),
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/learn-s-m-a-r-t-r-jki3sg/assets/3t3ps7drbrhk/473e84e35274f087695236414ff8df3b.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getJsonField(
                        widget.topic,
                        r'''$.title''',
                      ).toString(),
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final tags = getJsonField(
                          widget.topic,
                          r'''$.tags''',
                        ).toList();

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(tags.length, (tagsIndex) {
                            final tagsItem = tags[tagsIndex];
                            return Text(
                              valueOrDefault<String>(
                                getJsonField(
                                  tagsItem,
                                  r'''$.name''',
                                )?.toString(),
                                '#tag',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            );
                          }).divide(SizedBox(width: 12.0)),
                        );
                      },
                    ),
                    Text(
                      valueOrDefault<String>(
                        functions.formatDate(valueOrDefault<String>(
                          getJsonField(
                            widget.topic,
                            r'''$.createdAt''',
                          )?.toString(),
                          '11:11 11/11/2011',
                        )),
                        '11:11 11/11/2011',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}

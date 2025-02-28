import '/components/classes/learning_track/learning_track_widget.dart';
import '/components/discussion_thread/discussion_thread_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'temp_widget.dart' show TempWidget;
import 'package:flutter/material.dart';

class TempModel extends FlutterFlowModel<TempWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for LearningTrack component.
  late LearningTrackModel learningTrackModel;
  // Model for DiscussionThread component.
  late DiscussionThreadModel discussionThreadModel;

  @override
  void initState(BuildContext context) {
    learningTrackModel = createModel(context, () => LearningTrackModel());
    discussionThreadModel = createModel(context, () => DiscussionThreadModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    learningTrackModel.dispose();
    discussionThreadModel.dispose();
  }
}

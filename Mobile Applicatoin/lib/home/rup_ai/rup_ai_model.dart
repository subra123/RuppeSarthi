import '/flutter_flow/flutter_flow_util.dart';
import 'rup_ai_widget.dart' show RupAiWidget;
import 'package:flutter/material.dart';

class RupAiModel extends FlutterFlowModel<RupAiWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? botResponses;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

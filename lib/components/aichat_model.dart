import '/flutter_flow/flutter_flow_util.dart';
import 'aichat_widget.dart' show AichatWidget;
import 'package:flutter/material.dart';

class AichatModel extends FlutterFlowModel<AichatWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? responce;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

import 'package:flutter/foundation.dart';

@immutable
sealed class MarkdownNode {
  const MarkdownNode();
}

@immutable
sealed class MarkdownParentNode extends MarkdownNode {
  const MarkdownParentNode(this.children);

  final List<MarkdownNode> children;
}

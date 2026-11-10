import 'package:flutter/foundation.dart';

@immutable
sealed class MarkdownNode {
  const MarkdownNode();
}

final class MarkdownTextNode extends MarkdownNode {
  const MarkdownTextNode(this.text);

  final String text;
}

final class MarkdownCodeNode extends MarkdownNode {
  const MarkdownCodeNode(this.text);

  final String text;
}

@immutable
sealed class MarkdownParentNode extends MarkdownNode {
  const MarkdownParentNode(this.children);

  final List<MarkdownNode> children;
}

final class MarkdownBoldNode extends MarkdownParentNode {
  const MarkdownBoldNode(super.children);
}

final class MarkdownItalicNode extends MarkdownParentNode {
  const MarkdownItalicNode(super.children);
}

final class MarkdownStrikethroughNode extends MarkdownParentNode {
  const MarkdownStrikethroughNode(super.children);
}

final class MarkdownLinkNode extends MarkdownParentNode {
  const MarkdownLinkNode(super.children, {this.href});

  final String? href;
}

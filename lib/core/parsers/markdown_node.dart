import 'package:flutter/foundation.dart';

@immutable
sealed class MarkdownNode {
  const MarkdownNode();
}

@immutable
sealed class MarkdownDocumentNode extends MarkdownNode {
  MarkdownDocumentNode(
    Iterable<MarkdownBlockNode> children,
  ) : children = List.unmodifiable(children);

  final List<MarkdownBlockNode> children;
}

@immutable
sealed class MarkdownBlockNode extends MarkdownNode {
  const MarkdownBlockNode();
}

@immutable
sealed class MarkdownInlineNode extends MarkdownNode {
  const MarkdownInlineNode();
}

@immutable
sealed class MarkdownInlineParentNode extends MarkdownInlineNode {
  MarkdownInlineParentNode(
    Iterable<MarkdownInlineNode> children,
  ) : children = List.unmodifiable(children);

  final List<MarkdownInlineNode> children;
}

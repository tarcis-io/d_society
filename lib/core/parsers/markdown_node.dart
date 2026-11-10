import 'package:flutter/foundation.dart';

@immutable
sealed class MarkdownNode {
  const MarkdownNode();
}

final class MarkdownDocumentNode extends MarkdownNode {
  MarkdownDocumentNode(
    Iterable<MarkdownBlockNode> children,
  ) : children = List.unmodifiable(children);

  final List<MarkdownBlockNode> children;
}

@immutable
sealed class MarkdownBlockNode extends MarkdownNode {
  const MarkdownBlockNode();
}

final class MarkdownParagraphNode extends MarkdownBlockNode {
  MarkdownParagraphNode(
    Iterable<MarkdownInlineNode> children,
  ) : children = List.unmodifiable(children);

  final List<MarkdownInlineNode> children;
}

final class MarkdownHeadingNode extends MarkdownBlockNode {
  MarkdownHeadingNode(
    Iterable<MarkdownInlineNode> children, {
    required this.level,
  })  : children = List.unmodifiable(children),
        assert(level >= 1 && level <= 6, 'level must be between 1 and 6');

  final List<MarkdownInlineNode> children;
  final int level;
}

final class MarkdownBlockQuoteNode extends MarkdownBlockNode {
  MarkdownBlockQuoteNode(
    Iterable<MarkdownBlockNode> children,
  ) : children = List.unmodifiable(children);

  final List<MarkdownBlockNode> children;
}

final class MarkdownCodeBlockNode extends MarkdownBlockNode {
  const MarkdownCodeBlockNode(
    this.text,
  );

  final String text;
}

final class MarkdownThematicBreakNode extends MarkdownBlockNode {
  const MarkdownThematicBreakNode();
}

final class MarkdownHtmlBlockNode extends MarkdownBlockNode {
  const MarkdownHtmlBlockNode(
    this.text,
    this.language,
  );

  final String text;
  final String? language;
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

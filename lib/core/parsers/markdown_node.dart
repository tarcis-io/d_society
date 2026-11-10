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

  @override
  int get hashCode => Object.hashAll(children);
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

  @override
  int get hashCode => Object.hashAll(children);
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

  @override
  int get hashCode => Object.hashAll(children);
}

final class MarkdownCodeBlockNode extends MarkdownBlockNode {
  const MarkdownCodeBlockNode(
    this.text, {
    this.language,
  });

  final String text;
  final String? language;
}

final class MarkdownThematicBreakNode extends MarkdownBlockNode {
  const MarkdownThematicBreakNode();
}

final class MarkdownHtmlBlockNode extends MarkdownBlockNode {
  const MarkdownHtmlBlockNode(
    this.text,
  );

  final String text;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MarkdownHtmlBlockNode && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

@immutable
sealed class MarkdownInlineNode extends MarkdownNode {
  const MarkdownInlineNode();
}

final class MarkdownTextNode extends MarkdownInlineNode {
  const MarkdownTextNode(
    this.text,
  );

  final String text;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MarkdownTextNode && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

final class MarkdownCodeSpanNode extends MarkdownInlineNode {
  const MarkdownCodeSpanNode(
    this.text,
  );

  final String text;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MarkdownCodeSpanNode && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

@immutable
sealed class MarkdownInlineParentNode extends MarkdownInlineNode {
  MarkdownInlineParentNode(
    Iterable<MarkdownInlineNode> children,
  ) : children = List.unmodifiable(children);

  final List<MarkdownInlineNode> children;

  @override
  int get hashCode => Object.hashAll(children);
}

import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  /// The text to display
  final String text;

  /// Maximum number of lines when collapsed
  final int collapsedLines;

  /// Text style to apply to the text
  final TextStyle? textStyle;

  /// Animation duration for expand/collapse
  final Duration animationDuration;

  /// Optional "See More" text
  final String expandText;

  /// Optional "See Less" text
  final String collapseText;

  /// Style for the expand/collapse button text
  final TextStyle? expandTextStyle;

  /// Initial expanded state
  final bool initiallyExpanded;

  const ExpandableText({
    super.key,
    required this.text,
    this.collapsedLines = 3,
    this.textStyle,
    this.animationDuration = const Duration(milliseconds: 200),
    this.expandText = 'Show More',
    this.collapseText = 'Show Less',
    this.expandTextStyle,
    this.initiallyExpanded = false,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  bool _textExceedsMaxLines = false;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
    _controller = AnimationController(duration: widget.animationDuration, vsync: this);

    if (_expanded) {
      _controller.value = 1.0;
    }

    // Use post-frame callback to check if text exceeds max lines
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTextLength();
    });
  }

  @override
  void didUpdateWidget(ExpandableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _checkTextLength();
    }
  }

  void _checkTextLength() {
    final textSpan = TextSpan(
      text: widget.text,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: widget.collapsedLines,
    );

    // Layout with the constraints of the parent
    textPainter.layout(maxWidth: context.size?.width ?? 300);

    // Check if the text exceeds maxLines
    setState(() {
      _textExceedsMaxLines = textPainter.didExceedMaxLines;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyMedium;
    final buttonTextStyle =
        widget.expandTextStyle ??
        Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        );

    if (!_textExceedsMaxLines) {
      // If text doesn't exceed max lines, just show the text without button
      return Text(widget.text, style: defaultTextStyle);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Create two different widgets based on expanded state
        if (_expanded) {
          // When expanded, show full text with inline "Show Less" at the end
          return RichText(
            text: TextSpan(
              children: [
                TextSpan(text: widget.text, style: defaultTextStyle),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: _toggleExpanded,
                    child: Text(" ${widget.collapseText}", style: buttonTextStyle),
                  ),
                ),
              ],
            ),
          );
        } else {
          // When collapsed, create a custom widget that handles truncation and button
          return _CollapsedText(
            text: widget.text,
            textStyle: defaultTextStyle!,
            buttonText: widget.expandText,
            buttonStyle: buttonTextStyle!,
            maxLines: widget.collapsedLines,
            onTap: _toggleExpanded,
            maxWidth: constraints.maxWidth,
          );
        }
      },
    );
  }
}

class _CollapsedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final String buttonText;
  final TextStyle buttonStyle;
  final int maxLines;
  final VoidCallback onTap;
  final double maxWidth;

  const _CollapsedText({
    required this.text,
    required this.textStyle,
    required this.buttonText,
    required this.buttonStyle,
    required this.maxLines,
    required this.onTap,
    required this.maxWidth,
  });

  @override
  State<_CollapsedText> createState() => _CollapsedTextState();
}

class _CollapsedTextState extends State<_CollapsedText> {
  late String _truncatedText;
  late TextPainter _textPainter;
  late TextPainter _buttonTextPainter;

  @override
  void initState() {
    super.initState();
    _calculateTruncatedText();
  }

  @override
  void didUpdateWidget(_CollapsedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text ||
        oldWidget.maxWidth != widget.maxWidth ||
        oldWidget.maxLines != widget.maxLines ||
        oldWidget.buttonText != widget.buttonText) {
      _calculateTruncatedText();
    }
  }

  void _calculateTruncatedText() {
    // Set up text painters
    _textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.textStyle),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );

    _buttonTextPainter = TextPainter(
      text: TextSpan(text: " ${widget.buttonText}", style: widget.buttonStyle),
      textDirection: TextDirection.ltr,
    );

    // Measure button width
    _buttonTextPainter.layout();
    final buttonWidth = _buttonTextPainter.width;

    // Available width for text
    final availableWidth = widget.maxWidth - buttonWidth;

    // First layout without truncation to check
    _textPainter.layout(maxWidth: widget.maxWidth);

    // If there's no overflow or not enough space for even one line + button, use simple ellipsis
    if (!_textPainter.didExceedMaxLines || availableWidth < 50) {
      _truncatedText = widget.text;
      return;
    }

    // Calculate a good position to truncate the text
    String truncatedText = widget.text;
    bool fits = false;

    // Binary search would be more efficient for long text, but this works for most cases
    while (!fits && truncatedText.isNotEmpty) {
      truncatedText = truncatedText.substring(0, truncatedText.length - 1);
      final textWithEllipsis = '$truncatedText...';

      final testPainter = TextPainter(
        text: TextSpan(text: textWithEllipsis, style: widget.textStyle),
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr,
      );

      testPainter.layout(maxWidth: availableWidth);

      if (!testPainter.didExceedMaxLines) {
        fits = true;
        _truncatedText = textWithEllipsis;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: widget.maxLines,
      text: TextSpan(
        children: [
          TextSpan(text: _truncatedText, style: widget.textStyle),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Text(" ${widget.buttonText}", style: widget.buttonStyle),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proxy_line/core/sliver_header/src/extension/header_item_extensions.dart';
import '../../sliver_header_delegate.dart';

class FlexibleTextItemWidget extends StatelessWidget {
  const FlexibleTextItemWidget(
    this._item,
    this._progress, {
    Key? key,
  }) : super(key: key);

  final FlexibleTextItem? _item;
  final double _progress;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: _item!.paddingValue(_progress),
      margin: _item!.marginValue(_progress),
      alignment: _item!.alignmentValue(_progress),
      child: Text(
        _item!.text,
        style: TextStyle.lerp(
          _item!.expandedStyle,
          _item!.collapsedStyle,
          _progress,
        ),
        maxLines: _item!.maxLines,
        textScaleFactor: _item!.textScaleFactor,
        overflow: _item!.overflow,
        softWrap: _item!.softWrap,
        locale: _item!.locale,
        textDirection: _item!.textDirection,
        textAlign: _item!.textAlign,
      ),
    );
  }
}

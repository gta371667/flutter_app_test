import 'package:flutter/material.dart';

class TextFieldOverlayWidget extends StatefulWidget {
  final InputDecoration decoration;

  TextFieldOverlayWidget({
    Key key,
    this.decoration,
  }) : super(key: key);

  @override
  _TextFieldOverlayWidgetState createState() => _TextFieldOverlayWidgetState();
}

class _TextFieldOverlayWidgetState extends State<TextFieldOverlayWidget> {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print("TextField 取得焦點");
        _overlayEntry = buildOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        print("TextField 失去焦點");
        _overlayEntry.remove();
      }
    });
  }

  OverlayEntry buildOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text('Syria'),
                  onTap: () {
                    print('Syria Tapped');
                  },
                ),
                ListTile(
                  title: Text('Lebanon'),
                  onTap: () {
                    print('Lebanon Tapped');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        autofocus: true,
        focusNode: _focusNode,
        decoration: widget.decoration ?? InputDecoration(),
      ),
    );
  }
}
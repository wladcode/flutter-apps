import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final outlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.outline),
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      controller: _textController,
      focusNode: _focusNode,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      decoration: InputDecoration(
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = _textController.text;
            widget.onValue(textValue);
            _textController.clear();
          },
          icon: Icon(Icons.send_outlined),
        ),
        hintText: 'End message with ?',
      ),
      onFieldSubmitted: (value) {
        widget.onValue(value);
        _textController.clear();
        _focusNode.requestFocus();
      },
    );
  }
}

import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.outline),
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.text;
            print('textValue: $textValue');
            textController.clear();
          },
          icon: Icon(Icons.send_outlined),
        ),
        hintText: 'End message with ?',
      ),

      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
        textController.clear();
        focusNode.requestFocus();
      }
    );
  }
}

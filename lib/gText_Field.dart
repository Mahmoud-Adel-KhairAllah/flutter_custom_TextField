import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GTextField extends StatefulWidget {
  GTextField(
      {super.key,
      required this.typeKeyboard,
      required this.labelText,
      required this.controller,
      this.isSecure = false,
      required this.icon,
      required this.focusNode});
  final TextInputType typeKeyboard;
  final String labelText;
  final TextEditingController controller;
  late bool isSecure;
  final Icon icon;
  bool isvisable = false;
  final FocusNode focusNode;
  @override
  State<GTextField> createState() => _GTextFieldState();
}

class _GTextFieldState extends State<GTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
       // textInputAction: TextInputAction.continueAction,
        
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(widget.focusNode),
        keyboardType: widget.typeKeyboard,
        decoration: InputDecoration(
          
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            labelText: widget.labelText,
            prefixIcon: widget.icon,
              prefixIconColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return Colors.green;
          }
          if (states.contains(MaterialState.error)) {
            return Colors.red;
          }
          return Colors.grey;
        }),
            suffixIcon: widget.isSecure
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        widget.isvisable = !widget.isvisable;
                        print(widget.isvisable);
                      });
                    },
                    child: Icon(widget.isvisable
                        ? Icons.visibility
                        : Icons.visibility_off)):
                // : TextButton(
                //     onPressed: () {
                //       setState(() {
                //         widget.controller.clear();
                //       });
                //     },
                //     child: Icon(Icons.clear)
                //     ),
                null
                  ),
        obscureText: widget.isSecure ? !widget.isvisable : widget.isSecure,
        obscuringCharacter: '*',
        onChanged: (value) {
          setState(() {
            widget.controller.text = value;
          });
        },
      ),
    );
  }
}

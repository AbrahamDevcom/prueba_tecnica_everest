import 'package:flutter/material.dart';
import '../theme/colors_theme.dart';

class CustomDialogPermissionRebuilded extends StatelessWidget {
  final String title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback? positiveBtnPressed, negativeBtnPressed;
  final IconData? iconData;
  final bool? centerAll;
  const CustomDialogPermissionRebuilded({
    Key? key,
    required this.title,
    required this.content,
    required this.positiveBtnText,
    required this.negativeBtnText,
    this.iconData,
    this.positiveBtnPressed,
    this.negativeBtnPressed,
    this.centerAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          // Bottom rectangular box
          margin: const EdgeInsets.only(top: 40), // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: centerAll == false ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                content,
                style: const TextStyle(color: Colors.white),
              ),
              ButtonBar(
                buttonMinWidth: 100,
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (positiveBtnPressed != null)
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: ColorsTheme.secondaryColor),
                      child: Text(
                        negativeBtnText,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  if (positiveBtnPressed == null)
                    SizedBox(
                      width: 250,
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: ColorsTheme.secondaryColor),
                        onPressed: negativeBtnPressed ?? () => Navigator.of(context).pop(),
                        child: Text(
                          negativeBtnText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  if (positiveBtnPressed != null)
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: ColorsTheme.greenbtn),
                      onPressed: positiveBtnPressed,
                      child: Text(
                        positiveBtnText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
            backgroundColor: Colors.white,
            // Top Circle with icon
            maxRadius: 40.0,
            child: Icon(
              iconData,
              color: Colors.black,
              size: 45,
            )),
      ],
    );
  }
}

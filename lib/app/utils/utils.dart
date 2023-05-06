import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/services.dart';

import '../ui/global_widgets/custom_dialog_permission.dart';
import '../ui/theme/colors_theme.dart';

class Utils {
  static errorTopSnackBar(BuildContext context, {String? message, String? title}) {
    AnimatedSnackBar(
            builder: ((context) {
              return Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          // Top Circle with icon
                          maxRadius: 20.0,
                          child: Icon(Icons.info, color: Colors.red)),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            SizedBox(
                              width: 200,
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          if (message != null)
                            SizedBox(
                              width: 200,
                              child: Text(
                                message,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: TextStyle(fontSize: title != null ? 10 : 15, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            duration: const Duration(seconds: 5),
            mobileSnackBarPosition: MobileSnackBarPosition.top,
            snackBarStrategy: RemoveSnackBarStrategy(),
            desktopSnackBarPosition: DesktopSnackBarPosition.topRight)
        .show(context);
  }

  static successTopSnackBar(BuildContext context, {String? message, String? title}) {
    AnimatedSnackBar(
            builder: ((context) {
              return Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 75, 136, 73),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          // Top Circle with icon
                          maxRadius: 20.0,
                          child: Icon(
                            Icons.info,
                            color: Color.fromARGB(255, 75, 136, 73),
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            SizedBox(
                              width: 200,
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          if (message != null)
                            SizedBox(
                              width: 200,
                              child: Text(
                                message,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(fontSize: title != null ? 10 : 15, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            duration: const Duration(seconds: 5),
            mobileSnackBarPosition: MobileSnackBarPosition.top,
            snackBarStrategy: RemoveSnackBarStrategy(),
            desktopSnackBarPosition: DesktopSnackBarPosition.topRight)
        .show(context);
  }

  static String getCodeOfUrl(Uri uri) {
    try {
      String link = uri.path;
      Uint8List codeParteBytes = base64.decode(link.split("~~~")[1]);
      String decodeString = utf8.decode(codeParteBytes);
      return decodeString;
    } catch (e) {
      return "0";
    }
  }

  static String getCodeOfUrlByPath(String link) {
    try {
      // String link = uri.path;
      Uint8List codeParteBytes = base64.decode(link.split("~~~")[1]);
      String decodeString = utf8.decode(codeParteBytes);
      return decodeString;
    } catch (e) {
      return "0";
    }
  }

  static validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no luce como un correo';
  }

  static bool validateEmailBool(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value ?? '') ? true : false;
  }

  static bool isNumber(String? value) {
    RegExp regExp = RegExp(r'^[0-9]+$');
    return regExp.hasMatch(value ?? '') ? true : false;
  }

  static validateText(String? value) {
    return (value != null && value.length >= 2) ? null : 'El texto debe tener mas de 2 caracteres';
  }

  static validateTextMas(String? value, int max) {
    return (value != null && value.length > max) ? null : 'El texto debe tener mas de $max caracteres';
  }

  static validateNameLength(String? value, int max, int min) {
    return (value != null && value.length > max && value.length < min)
        ? null
        : 'El texto debe tener mayor a $max caracteres y menor a $min caracteres';
  }

  static validateExt(String? value) {
    return (value != null && value != 'Ext') ? null : 'Debe ingresar un dato en este campo';
  }

  static validatepPassword(String? value) {
    return (value != null && value.length >= 4 && value.length <= 25) ? null : 'La contraseña debe tener más de 4 caracteres';
  }

  static validatepPasswordRepeat(String? value, String? value2) {
    return (value != null && value.length >= 4 && value.length <= 25 && value == value2) ? null : 'Las contraseña no son iguales';
  }

  static validatePhone(String? value) {
    return (value != null && value.length >= 8) ? null : 'El telefono debe de ser de 8 caracteres';
  }

  static showLoaderDialog(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static changeNativeNavigationBarColor(BuildContext context, Color color) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(systemNavigationBarColor: color, systemNavigationBarIconBrightness: Brightness.light));
    }
  }

  static validateTextWithMin(String? value, int number) {
    return (value != null && value.length > number) ? null : 'Este campo es obligatorio';
  }

  static Future<void> dialogCustom(
      {required BuildContext context,
      required String title,
      required String content,
      IconData? iconData,
      String? onActionText,
      String? onActionTextNegative,
      bool? barrierDismissible,
      Function? onAction,
      Function? onActionNegative,
      bool? centerAll}) async {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible ?? true,
        builder: (context) {
          return CustomDialogPermissionRebuilded(
            title: title,
            content: content,
            iconData: iconData,
            positiveBtnText: onActionText ?? "Ok",
            negativeBtnText: onActionTextNegative ?? "Volver",
            centerAll: centerAll,
            positiveBtnPressed: onAction == null
                ? null
                : () async {
                    onAction();
                  },
            negativeBtnPressed: onActionNegative == null
                ? null
                : () async {
                    onActionNegative();
                  },
          );
        });
  }

  static TextStyle negrillas() {
    return const TextStyle(
      color: ColorsTheme.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    );
  }

  static String capitalize(String text) {
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  static TextStyle defaultStyleLabels() {
    return const TextStyle(color: ColorsTheme.secondaryColor, fontSize: 15, fontWeight: FontWeight.bold);
  }

  // static TextStyle defaultTableTexts() {
  //   return const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
  // }

  static TextStyle defaultTableTextsHeader() => const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);

  static TextStyle defaultTableTextsBody() => const TextStyle(
        color: Colors.white,
        fontSize: 17,
      );

  static Future<Uint8List> imageToUint8List(ImageProvider imageProvider) async {
    final completer = Completer<Uint8List>();
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener(
        (imageInfo, _) async {
          final byteData = await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
          completer.complete(byteData?.buffer.asUint8List());
        },
      ),
    );
    return completer.future;
  }
}

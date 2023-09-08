import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tgh_task/utils/real_size_function.dart';

FToast _initializeToast(BuildContext context) {
  final toast = FToast();
  toast.init(context);
  return toast;
}

Future showErrorToast(BuildContext context, String message) async {
  _initializeToast(context).showToast(
    child: _Toast(
      msg: message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      color: Colors.redAccent,
      textColor: Colors.white,
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 3),
  );
}

Future showPositiveToast(BuildContext context, String message) async {
  _initializeToast(context).showToast(
    child: _Toast(
      msg: message,
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      color: Colors.greenAccent,
      textColor: Colors.white,
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 3),
  );
}

class _Toast extends StatelessWidget {
  final String msg;
  final Icon icon;
  final Color color;
  final Color textColor;
  const _Toast(
      {Key? key,
      required this.msg,
      required this.icon,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: RelSize.height(context, 50),
      padding: EdgeInsets.symmetric(
          vertical: RelSize.height(context, 5),
          horizontal: RelSize.width(context, 10)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          28,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: icon,
          ),
          const SizedBox(
            width: 4,
          ),
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                msg,
                // style: AppTypography.regularOption
                //     .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

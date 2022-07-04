import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

showAlertDialog(
  BuildContext context, {
  required String title,
  String? content,
  Function? onConfirm,
  Function(BuildContext)? onCancel,
  String okText = 'OK',
  String cancelText = 'Cancel',
}) {
  showDialog(
    context: context,
    builder: (c) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          content ?? '',
                          style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.normal),
                        )
                      ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (onCancel != null) {
                            onCancel.call(c);
                          } else {
                            Navigator.pop(c);
                          }
                        },
                        child: Text(
                          cancelText,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          onConfirm?.call();
                          Navigator.pop(context);
                        },
                        child: Text(
                          okText,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    },
  );
}

showLoadingBlocked(BuildContext context, {String? message, required Future<void> Function(BuildContext) next}) {
  next(context);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              constraints: const BoxConstraints(maxHeight: 100, minWidth: 100),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(message ?? "Tunggu...", style: const TextStyle(fontSize: 14)),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

showDialogBottomSheet(
  context, {
  required Image image,
  required String textBody,
  String buttonText = "Grant, and Continue",
  Function? onConfirm,
  double? height,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        width: double.infinity,
        height: height ?? (MediaQuery.of(context).size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: 20),
            Text(
              textBody,
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            if (onConfirm != null)
              MoizyButton.primary(
                text: buttonText,
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context);
                },
              )
            else
              MoizyButton.primary(
                text: "OK",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      );
    },
    backgroundColor: MoizyColors.light,
    elevation: 3,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
  );
}

showStackError(context, {textBody}) {
  showDialogBottomSheet(
    context,
    image: Image.asset(
      'assets/img/remove.png',
      width: 100,
    ),
    height: 300,
    buttonText: "OK",
    textBody: textBody,
    onConfirm: () {
      // Navigator.pop(context);
    },
  );
}

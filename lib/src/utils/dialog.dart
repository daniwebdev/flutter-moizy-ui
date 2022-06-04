import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (c) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
            width: MediaQuery.of(context).size.width * .8,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            "Anda Yakin ?",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const Text("Simpan data ini",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ))
                        ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(c);
                          },
                          child: Text(
                            "Batal",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Ya",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                children:  [
                  const SizedBox(
                    height: 30,
                    width: 30,
                    child: const CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text( message ?? "Tunggu...", style: const TextStyle(fontSize: 14)),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

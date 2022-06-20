import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';
import 'package:provider/provider.dart';

class PassCodeWidget extends StatelessWidget {
  final dynamic Function(List<String>, _PassCodeState) onFinish;
  final bool? showFingerprint;
  final bool? showToLogin;
  final String? title;

  const PassCodeWidget({
    Key? key,
    required this.onFinish,
    this.showFingerprint,
    this.title,
    this.showToLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    int max = 6;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: ChangeNotifierProvider(
          create: (_) => _PassCodeState(),
          child: Consumer2<_PassCodeState, MoizyTheme>(
            builder: (context, passcodeState, moizyTheme, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title ?? '', style: theme.headline1),
                  const SizedBox(
                    height: 25,
                  ),
                  _InputIndicator(
                    length: 6,
                    filled: passcodeState.values.length,
                  ),
                  _KeyPadContainer(
                    showToLogin: showToLogin,
                    onKeyPress: (value) {
                      List<String> values = passcodeState.values;
                      if (values.length < max) {
                        passcodeState.add(value);

                        if(passcodeState.values.length == max) {

                          if(onFinish(passcodeState.values,passcodeState) == 'error') {
                            passcodeState.clear();
                          };

                        }

                      } else {
                        if(onFinish(passcodeState.values, passcodeState) == 'error') {
                          passcodeState.clear();
                        };
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  () {
                        if (showToLogin ?? true) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              // textStyle: theme.button,

                              primary: moizyTheme.getTheme?.primary,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Using Your Password"),
                          );
                        }
                        return null;
                      }() ??
                      SizedBox(
                        width: 0,
                      ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _InputIndicator extends StatelessWidget {
  final int length;
  final int filled;

  const _InputIndicator({Key? key, required this.length, required this.filled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: addSparatedList(
          List.generate(length, (index) {
            return Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: (index + 1) <= filled ? MoizyColors.primary : MoizyColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
          sparated: const SizedBox(
            width: 10,
          )),
    );
  }
}

class _KeyPadContainer extends StatelessWidget {
  final void Function(String) onKeyPress;
  final bool? showToLogin;

  const _KeyPadContainer({Key? key, this.showToLogin, required this.onKeyPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int len = context.watch<_PassCodeState>().values.length;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
        ),
        children: [
          _KeyPadButton(text: '1', onPressed: onKeyPress),
          _KeyPadButton(text: '2', onPressed: onKeyPress),
          _KeyPadButton(text: '3', onPressed: onKeyPress),
          _KeyPadButton(text: '4', onPressed: onKeyPress),
          _KeyPadButton(text: '5', onPressed: onKeyPress),
          _KeyPadButton(text: '6', onPressed: onKeyPress),
          _KeyPadButton(text: '7', onPressed: onKeyPress),
          _KeyPadButton(text: '8', onPressed: onKeyPress),
          _KeyPadButton(text: '9', onPressed: onKeyPress),
          ...(showToLogin) {
            if (showToLogin) {
              return [_KeyPadButton(
                icon: Icon(
                  Icons.fingerprint,
                  color: Theme.of(context).textTheme.headline3!.color,
                  size: 35,
                ),
              )];
            }
            return [
              _KeyPadButton(

              ),
            ];
          }(showToLogin),
          _KeyPadButton(text: '0', onPressed: onKeyPress),
          _KeyPadButton(
            text: 'DEL',
            icon: Icon(
              Icons.backspace_outlined,
              size: 30,
              color: Theme.of(context).textTheme.headline3!.color,
            ),
            onPressed: (text) {
              if (len > 0) {
                Provider.of<_PassCodeState>(context, listen: false).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _KeyPadButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final void Function(String)? onPressed;

  const _KeyPadButton({Key? key, this.onPressed, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool condition = !(icon == null && text == null) || (icon != null);

    if(icon != null) {
      condition = false;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: condition ? MoizyColors.light : Colors.transparent,
          elevation: condition ? 4 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: icon ??
            Text(
              text ?? '',
              style: Theme.of(context).textTheme.headline3!.copyWith(),
            ),
        onPressed: () {
          onPressed!(text!);
        },
      ),
    );
  }
}

class _PassCodeState extends ChangeNotifier {
  final List<String> _values = [];

  List<String> get values => _values;

  void add(String values) {
    _values.add(values);
    notifyListeners();
  }

  void pop() {
    _values.removeLast();

    notifyListeners();
  }

  void clear() {
    _values.clear();

    notifyListeners();
  }
}

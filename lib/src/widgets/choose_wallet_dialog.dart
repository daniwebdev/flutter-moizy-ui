import 'package:flutter/material.dart';
import 'package:moizy_ui/src/widgets/scaffold_custom.dart';

class ChooseWalletDialog extends StatelessWidget {
  final Function? onChoose;

  const ChooseWalletDialog({Key? key, this.onChoose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      backButtonIcon: Icons.close,
      title: 'Pilih Dompet',
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (BuildContext context, index) {
              return TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {
                  onChoose!(context);
                },
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* Icons */
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: Icon(
                            Icons.account_balance_wallet,
                            size: 20,
                          ),
                        ),
                      ),
              
                      /* Label Wallet */
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Bank BCA', style: Theme.of(context).textTheme.headline2),
                            Text('Rp. 1,000,000', style: Theme.of(context).textTheme.headline6),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 5),
      ),
    );
  }
}

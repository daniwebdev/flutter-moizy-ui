import 'package:flutter/material.dart';
import 'package:moizy_ui/src/widgets/list_custom.dart';
import 'package:moizy_ui/src/widgets/shimmer_widget.dart';

class TransactionItemWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final Color? colorImage;
  final bool isLastItem;

  const TransactionItemWidget({
    Key? key,
    this.isLastItem = false,
    this.image,
    this.title,
    this.colorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return ListItemCustom(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          /* ICON Transaction */
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(color: colorImage?.withAlpha(90), borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Image.network(
                image ?? 'https://ecs7.tokopedia.net/assets-tokopedia-lite/prod/icon144.png',
              ),
            ),
          ),

          /* Detail Transaction */
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title ?? '',
                    style: textTheme.bodyText1,
                  ),
                ),

                /* User Information */
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      maxRadius: 10,
                      backgroundImage: AssetImage('assets/img/noimage_person.png'),
                      backgroundColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('Ayah', style: textTheme.bodyText2,),
                  ],
                ),
              ],
            ),
          ),

          /* Amount of Transaction */
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "- Rp. 200,000",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFA6D6D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text("Beli Baju Lebaran"),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionItemShimmer extends StatelessWidget {
  const TransactionItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          /* ICON Transaction */
          const ShimmerWidget.circle(width: 50, height: 50),
          const SizedBox(
            width: 6,
          ),
          /* Detail Transaction */
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: ShimmerWidget.rectangle(
                    height: 15,
                    width: double.infinity,
                  ),
                ),

                /* Data Information */
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    ShimmerWidget.circle(width: 20, height: 20),
                    SizedBox(
                      width: 6,
                    ),
                    ShimmerWidget.rectangle(
                      height: 14,
                      width: 100,
                    )
                  ],
                ),
              ],
            ),
          ),

          /* Amount of Transaction */
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: const [
          //     Padding(
          //       padding: EdgeInsets.only(bottom: 8),
          //       child: ShimmerWidget.rectangle(
          //         height: 14,
          //         width: 100,
          //       ),
          //     ),
          //     ShimmerWidget.rectangle(
          //       height: 14,
          //       width: 100,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}

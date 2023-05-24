import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qatar_app/provider.dart';

class TotalBox extends StatefulWidget {
  const TotalBox({Key? key}) : super(key: key);

  @override
  State<TotalBox> createState() => _TotalBoxState();
}

class _TotalBoxState extends State<TotalBox> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ProvLists>(context);
    double total = 0;
    for (int i = 0; i < pro.item.length; i++) {
      total = total + pro.item[i].amount;
    }

    return Container(
      alignment: Alignment.topCenter,
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ريال ',
              style: TextStyle(
                  color: Colors.brown[500],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              total.toStringAsFixed(2),
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}

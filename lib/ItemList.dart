import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:qatar_app/provider.dart';
import 'mazeItem.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';

class ItemList extends StatefulWidget {
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final titleinput = TextEditingController();
  final amountinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ProvLists>(context);
    final item = pro.item;

    return Column(
      children: [
        Container(
          height: 400,
          child: ListView.builder(
            itemBuilder: (cx, index) {
              return Dismissible(
                key: UniqueKey(),
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10),
                  height: 80,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 250,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item[index].title,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('d / M / y')
                                    .format(item[index].date),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 100,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(500)),
                        alignment: Alignment.center,
                        child: Text(
                          item[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                onDismissed: (DismissDirection direction) =>
                    pro.remveItem(index),
              );
            },
            itemCount: item.length,
          ),
        ),
        SizedBox(
          height: 20,
        ),
// the bottom sheet ==================================================
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext) => Card(
                      elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            TextField(
                              keyboardType: TextInputType.text,
                              maxLength: 30,
                              decoration:
                                  InputDecoration(labelText: 'The Title'),
                              controller: titleinput,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'The Amount'),
                              controller: amountinput,
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: ElevatedButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'تاكيد',
                                    style: (TextStyle(fontSize: 20)),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  pro.addItem(double.parse(amountinput.text),
                                      titleinput.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'اضافة',
              style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}

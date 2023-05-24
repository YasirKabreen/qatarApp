import 'package:flutter/cupertino.dart';

import 'mazeItem.dart';

class ProvLists extends ChangeNotifier {
  final List<MazeItem> _item = [
    MazeItem(
      title: 'مشتريات من الروابي',
      amount: 44.92,
      date: DateTime.now(),
    ),
    MazeItem(
      title: 'تصليح المكيف',
      amount: 50.69,
      date: DateTime.now(),
    ),
    MazeItem(
      title: ' الموية الاسبوعية',
      amount: 64.80,
      date: DateTime.now(),
    ),
    MazeItem(
      title: 'تصليح السخان',
      amount: 78.95,
      date: DateTime.now(),
    ),
    MazeItem(
      title: 'فاتورة النت',
      amount: 15.89,
      date: DateTime.now(),
    ),
  ];

  List<MazeItem> get item => [..._item];

  void addItem(ax, tx) {
    _item.add(
      MazeItem(
        amount: ax,
        title: tx,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void remveItem(int x) {
    _item.removeAt(x);
    notifyListeners();
  }
}

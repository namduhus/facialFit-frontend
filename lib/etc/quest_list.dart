import 'package:flutter/material.dart';

class QuestList extends StatelessWidget {
  final List<String> items =
      List<String>.generate(5, (index) => "quest: $index"); //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest Title',
      home: Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset("assets/images/questicon1.png"),
              title: Text(items[index]),
              subtitle: Text('퀘스트내용  $index'),
              trailing: Image.asset("assets/images/questreward3.png"),
              selected: index < 3, //이거 다시 보기
              onTap: () {
                print('Tapped on item $index');
              },
            );
          },
        ),
      ),
    );
  }
}

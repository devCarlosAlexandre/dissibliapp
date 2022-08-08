import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';
  List<int> items = List<int>.generate(100, (int index) => index);
  doNothing(BuildContext context, index) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: ListView.builder(
          itemCount: items.length,
          addAutomaticKeepAlives: false,
          cacheExtent: 100.0,
          itemBuilder: (context, index) {
            return Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                extentRatio: 0.35,
                dismissible: DismissiblePane(
                  onDismissed: () async {},
                ),
                motion: const ScrollMotion(),
                children: <Widget>[
                  SlidableAction(
                    onPressed: doNothing(context, index),
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing(context, index),
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Editar',
                  ),
                ],
              ),
              child: Card(
                child: ListTile(
                  title: Text(
                    items[index].toString(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

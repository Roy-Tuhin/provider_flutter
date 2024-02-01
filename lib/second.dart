import 'package:flutter/material.dart';
import 'package:provider_flutter/list_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
//  final List<int> numbers; //! why final?
  const SecondPage({
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberlistProvider>(
        builder: ((context, myNumberProviderModel, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text("widget.title"),
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(myNumberProviderModel.numbers.last.toString()),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: myNumberProviderModel.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(
                              myNumberProviderModel.numbers[index].toString());
                        }),
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  myNumberProviderModel.add();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            )));
  }
}

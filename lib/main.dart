import 'package:flutter/material.dart';
import 'package:provider_flutter/list_provider.dart';
import 'package:provider_flutter/second.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumberlistProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberlistProvider>(
        builder: ((context, myNumberProviderModel, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(myNumberProviderModel.numbers.last.toString()),
                  Expanded(
                    child: ListView.builder(
                        itemCount: myNumberProviderModel.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(
                              myNumberProviderModel.numbers[index].toString());
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondPage()));
                      },
                      child: const Text("Go to second page")),
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

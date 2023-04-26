import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SolidController _controller = SolidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solid bottom sheet example"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Image.asset("assets/cardImg.png"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Flutter rules?",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('NOPE'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    ElevatedButton(
                      child: const Text('YEAH'),
                      onPressed: () {
                        /* ... */
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: SolidBottomSheet(
        controller: _controller,
        draggableBody: true,
        headerBar: Container(
          color: Theme.of(context).primaryColor,
          height: 50,
          child: const Center(
            child: Text("Swipe me!"),
          ),
        ),
        body: Container(
          color: Colors.white,
          height: 30,
          child: Center(
            child: Text(
              "Hello! I'm a bottom sheet :D",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.stars),
          onPressed: () {
            _controller.isOpened ? _controller.hide() : _controller.show();
          }),
    );
  }
}

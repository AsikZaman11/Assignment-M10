
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<String> item1 = [];
  List<String> item2 = [];
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ))
      ]),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 30,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                        controller: textEditingController1,
                        decoration: InputDecoration(
                          hintText: 'Enter your to do here',
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        )),
                    SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                        controller: textEditingController2,
                        decoration: InputDecoration(
                          hintText: 'Enter your to do here',
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        item1.add(textEditingController1.text);
                        item2.add(textEditingController2.text);
                        textEditingController1.clear();
                        textEditingController2.clear();
                        setState(() {});
                      },
                      child: Text('ADD'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                    )
                  ],
                )),
              ),
            ),
            Expanded(
              flex: 70,
              child: ListView.builder(
                itemCount: item1.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: (() {
                                    Navigator.pop(context);
                                    textEditingController1.text = item1[index];
                                    textEditingController2.text = item2[index];
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Form(
                                              child: Column(
                                            children: [
                                              TextFormField(
                                                  controller:
                                                      textEditingController1,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Enter your to do here',
                                                    enabledBorder:
                                                        OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(),
                                                  )),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              TextFormField(
                                                  controller:
                                                      textEditingController2,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Enter your to do here',
                                                    enabledBorder:
                                                        OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(),
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  item1[index] =
                                                      textEditingController1
                                                          .text;
                                                  item2[index] =
                                                      textEditingController2
                                                          .text;
                                                  textEditingController1
                                                      .clear();
                                                  textEditingController2
                                                      .clear();
                                                  Navigator.pop(context);
                                                  print(item1);
                                                  print(item2);
                                                  setState(() {});
                                                },
                                                child: Text('Edit Done'),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.redAccent),
                                              )
                                            ],
                                          )),
                                        );
                                      },
                                    );
                                  }),
                                  child: Text('Edit'),
                                ),
                                TextButton(
                                  onPressed: (() {
                                    item1.removeAt(index);
                                    item2.removeAt(index);
                                    Navigator.pop(context);
                                    setState(() {});
                                  }),
                                  child: Text('Delete'),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                    ),
                    tileColor: Color.fromARGB(255, 218, 214, 214),
                    title: Text(item1[index]),
                    subtitle: Text(item2[index]),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

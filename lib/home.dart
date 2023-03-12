import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List todo = [];
  @override
  void initState() {
    todo.add("cycling");
    todo.add("add");
    todo.add("cycling");
    todo.add("add");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "NOTE APP",
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                letterSpacing: 4),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.red,
              size: 35,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Add Todo"),
                      content: TextField(
                        decoration: const InputDecoration(hintText: "To do's"),
                        onChanged: (String valu) {
                          input = valu;
                        },
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                todo.add(input);
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Add ",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    );
                  });
            }),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: todo.length,
              itemBuilder: (BuildContext contect, int index) {
                return Dismissible(
                    key: Key(todo[index]),
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(
                          todo[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              todo.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}

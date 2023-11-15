import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Bando 08", "Harga": 2},
    {"id": 2, "name": "Bando 2 cagak", "Harga": 3},
    {"id": 3, "name": "Bando 20 DN", "Harga": 1},
    {"id": 4, "name": "Bando 3 Daun", "Harga": 2},
    {"id": 5, "name": "Bando 30", "Harga": 2},
    {"id": 6, "name": "Bando 35", "Harga": 2},
    {"id": 7, "name": "Bando 47", "Harga": 3},
    {"id": 8, "name": "Bando 50", "Harga": 3},
    {"id": 9, "name": "Bando 75", "Harga": 7},
    {"id": 10, "name": "Bando 12", "Harga": 3},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }


  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Color.fromARGB(255, 185, 64, 255),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle:
                              Text('Harga Rp.${_foundUsers[index]["Harga"].toString()}.000'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Do nothing or add custom action if needed
                            },
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action when the button is pressed (e.g., add data)
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

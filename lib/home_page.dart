import './contact_app.dart';
import 'package:flutter/material.dart';

import 'add_page.dart';
import 'list .dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _site_da_webController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  String searchText = '';

  bool isSearchClicked =
      false; // List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 199, 201, 218),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintText: 'Search..'),
                ),
              )
            : const Text('Contacts List'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
              icon: Icon(isSearchClicked ? Icons.close : Icons.search))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    contacts.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                const Icon(Icons.list, size: 300),
                                const Text(
                                  'No Contact yet',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 200, // Some height

                            child: ListView.builder(
                              itemCount: contacts.length,
                              itemBuilder: (context, index) => getRow(index),
                            ),
                          ),
                  ],
                )),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Add_Page())),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0
              ? Color.fromARGB(255, 19, 67, 225)
              : Color.fromARGB(255, 96, 107, 222),
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].first_name[0],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].first_name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              contacts[index].telephone.toString(),
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 145,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _fnameController.text = contacts[index].first_name;
                  _telephoneController.text =
                      contacts[index].telephone.toString();
                  _lnameController.text = contacts[index].last_name;
                  _emailController.text = contacts[index].email;
                  _site_da_webController.text = contacts[index].site_da_work;
                  _workController.text = contacts[index].work;
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Text("edit"),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    contacts.removeAt(index);
                  });
                },
                child: Text("delete"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

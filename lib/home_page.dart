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
//             FloatingActionButton(onPressed: ()=>     Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => Add_Page()))
// // (Navigator.of(context).push(MaterialPageRoute(builder: (context)=>add()))

// // )
// , child: Icon(Icons.add))
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

  // Widget add() {
  //   return Scaffold(
  //     body: Column(children: [
  //       TextField(
  //         controller: _fnameController,
  //         decoration: const InputDecoration(
  //             hintText: 'Contact First Name',
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(
  //               Radius.circular(10),
  //             ))),
  //       ),
  //       const SizedBox(height: 10),
  //       TextField(
  //         controller: _lnameController,
  //         decoration: const InputDecoration(
  //             hintText: 'Contact Last Name',
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(
  //               Radius.circular(10),
  //             ))),
  //       ),
  //       const SizedBox(height: 10),
  //       TextField(
  //         controller: _telephoneController,
  //         keyboardType: TextInputType.number,
  //         maxLength: 10,
  //         decoration: const InputDecoration(
  //             hintText: 'Contact Number',
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(
  //               Radius.circular(10),
  //             ))),
  //       ),
  //       const SizedBox(height: 10),
  //       TextField(
  //         controller: _emailController,
  //         keyboardType: TextInputType.emailAddress,
  //         maxLength: 10,
  //         decoration: const InputDecoration(
  //             hintText: 'Email',
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(
  //               Radius.circular(10),
  //             ))),
  //       ),
  //       const SizedBox(height: 10),
  //       TextField(
  //         controller: _workController,
  //         keyboardType: TextInputType.text,
  //         maxLength: 10,
  //         decoration: const InputDecoration(
  //             hintText: 'Work',
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(
  //               Radius.circular(10),
  //             ))),
  //       ),
  //       const SizedBox(height: 10),
  //       TextField(
  //         controller: _site_da_webController,
  //         keyboardType: TextInputType.text,
  //         maxLength: 10,
  //         decoration: const InputDecoration(
  //             hintText: 'site da web',
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(
  //               Radius.circular(10),
  //             ))),
  //       ),
  //       const SizedBox(height: 10),

  //       // const SizedBox(height: 10),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           ElevatedButton(
  //               onPressed: () {
  //                 //

  //                 String first_name = _fnameController.text.trim();
  //                 num telephone = _telephoneController.toString() as num;
  //                 String last_name = _lnameController.text;
  //                 String email = _emailController.text;
  //                 String work = _workController.text;
  //                 String site_da_work = _workController.text;

  //                 if (first_name.isNotEmpty) {
  //                   setState(() {
  //                     _fnameController.text = '';
  //                     _workController.text = '';
  //                     _emailController.text = '';
  //                     _telephoneController.text = '';
  //                     _site_da_webController.text = '';
  //                     _lnameController.text = '';
  //                     Navigator.of(context).pop();
  //                     contacts.add(Contact(
  //                         first_name: first_name,
  //                         email: email,
  //                         telephone: telephone,
  //                         work: work,
  //                         site_da_work: site_da_work,
  //                         last_name: last_name));
  //                   });
  //                 }
  //                 //
  //               },
  //               child: const Text('Save')),
  //           ElevatedButton(
  //               onPressed: () {
  //                 //
  //                 String first_name = _fnameController.text.trim();
  //                 num telephone = _telephoneController.toString() as num;
  //                 String last_name = _lnameController.text;
  //                 String email = _emailController.text;
  //                 String work = _workController.text;
  //                 String site_da_work = _workController.text;
  //                 if (first_name.isNotEmpty) {
  //                   setState(() {
  //                     _fnameController.text = '';
  //                     _workController.text = '';
  //                     _emailController.text = '';
  //                     _telephoneController.text = '';
  //                     _site_da_webController.text = '';
  //                     _lnameController.text = '';
  //                     contacts[selectedIndex].first_name = first_name;
  //                     contacts[selectedIndex].telephone = telephone;
  //                     contacts[selectedIndex].last_name = last_name;
  //                     contacts[selectedIndex].email = email;
  //                     contacts[selectedIndex].site_da_work = site_da_work;
  //                     contacts[selectedIndex].work = work;

  //                     selectedIndex = -1;
  //                   });
  //                 }
  //                 //
  //               },
  //               child: const Text('Update')),
  //         ],
  //       )
  //     ]),
  //   );
  // }

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

              // InkWell(
              //     onTap: () {
              //       //
              //       _fnameController.text = contacts[index].first_name;
              //       _telephoneController.text =
              //           contacts[index].telephone.toString();
              //       setState(() {
              //         selectedIndex = index;
              //       });
              //       //
              //     },
              //     child: const Icon(Icons.edit)),
              // InkWell(
              //     onTap: (() {
              //       //
              //       setState(() {
              //         contacts.removeAt(index);
              //       });
              //       //
              //     }),
              //     child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}

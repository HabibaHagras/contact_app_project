import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'contact_app.dart';
import 'home_page.dart';
import 'list .dart';

class Add_Page extends StatefulWidget {
  const Add_Page({super.key});

  @override
  State<Add_Page> createState() => _Add_PageState();
}

class _Add_PageState extends State<Add_Page> {
  XFile? image;

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _site_da_webController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  // List<Contact> contacts = List.empty(growable: true);
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Contacts List'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                FloatingActionButton(
                  onPressed: () {
                    myAlert();
                  },
                  child: Icon(Icons.camera_enhance),
                ),
                image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                      )
                    : Text(
                        "No Image",
                        style: TextStyle(fontSize: 20),
                      ),
                const SizedBox(height: 10),
                TextField(
                  controller: _fnameController,
                  decoration: const InputDecoration(
                      hintText: 'Contact First Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _lnameController,
                  decoration: const InputDecoration(
                      hintText: 'Contact Last Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _telephoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Contact Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _workController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Work',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _site_da_webController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'site da web',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                        

                          String first_name = _fnameController.text.trim();
                          String telephone = _telephoneController.text;
                          String last_name = _lnameController.text;
                          String email = _emailController.text;
                          String work = _workController.text;
                          String site_da_work = _workController.text;

                          if (first_name.isNotEmpty) {
                            setState(() {
                              _fnameController.text = '';
                              _workController.text = '';
                              _emailController.text = '';
                              _telephoneController.text = '';
                              _site_da_webController.text = '';
                              _lnameController.text = '';
                              // Navigator.of(context).pop();
                              contacts.add(Contact(
                                  first_name: first_name,
                                  email: email,
                                  telephone: telephone,
                                  work: work,
                                  site_da_work: site_da_work,
                                  last_name: last_name));
                        
                            })
                            
                            ;
                          }
                          //
                        },
                        child: const Text('Save')),
                        ElevatedButton(onPressed:(){    Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>const HomePage()
                              ));} , child: Text("home")),
                    ElevatedButton(
                        onPressed: () {
                          //
                          String first_name = _fnameController.text.trim();
                          String telephone = _telephoneController.toString();
                          String last_name = _lnameController.text;
                          String email = _emailController.text;
                          String work = _workController.text;
                          String site_da_work = _workController.text;
                          if (first_name.isNotEmpty) {
                            setState(() {
                              _fnameController.text = '';
                              _workController.text = '';
                              _emailController.text = '';
                              _telephoneController.text = '';
                              _site_da_webController.text = '';
                              _lnameController.text = '';
                              contacts[selectedIndex].first_name = first_name;
                              contacts[selectedIndex].telephone = telephone;
                              contacts[selectedIndex].last_name = last_name;
                              contacts[selectedIndex].email = email;
                              contacts[selectedIndex].site_da_work =
                                  site_da_work;
                              contacts[selectedIndex].work = work;

                              selectedIndex = -1;
                            });
                          }
                          //
                        },
                        child: const Text('Update')),
                  ],
                )
              ])),
        ));
  }
}

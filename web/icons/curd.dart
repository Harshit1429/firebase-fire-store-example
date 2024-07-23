import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore _firebase = FirebaseFirestore.instance;
CollectionReference _studentCollection = _firebase.collection("students");

class FirebaseCurd {
  static Future<bool> addUser({
    required Map<String, dynamic> req,
  }) async {
    DocumentReference documentReferencer =
    _studentCollection.doc(req["contact_no"]);
    bool response = false;
    var result = await documentReferencer.set(req).whenComplete(() {
      response = true;
    }).catchError((e) {
      print(e.toString());
      response = false;
    });

    return response;
  }
  static Stream<QuerySnapshot> readUser() {
    CollectionReference notesItemCollection = _studentCollection;

    return notesItemCollection.snapshots();
  }

  static Future<bool> deleteUser({
    required String userId,
  }) async {
    DocumentReference documentReferencer =
    _studentCollection.doc(userId);
    bool response = false;
    var result = await documentReferencer.delete().whenComplete(() {
      response = true;
    }).catchError((e) {
      print(e.toString());
      response = false;
    });

    return response;
  }
}
void vishnu(){
  // Map<String, dynamic> reqBody = {
  //   "first_name": Usermodal.FirstName,
  //   "last_name": Usermodal.LastName,
  //   "email_add": Usermodal.EmailAdd,
  //   "contact_no": Usermodal.PhoneNo,
  //   "address": Usermodal.Address,
  //   "password": _passWordController.text.toString().trim(),
  // };
  // var response = await FirebaseCurd.addUser(req: reqBody);
  // print(response);
}
void vishnu1(){
  final Stream<QuerySnapshot> collectionReference = FirebaseCurd.readUser();
  // body: StreamBuilder(
  //   stream: collectionReference,
  //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //     if (snapshot.hasData) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  //         child: (snapshot.data!.docs.isNotEmpty)
  //             ? ListView(
  //           children: snapshot.data!.docs.map((e) {
  //             return InkWell(
  //               onTap: () {
  //                 showModalBottomSheet(context: context, builder: (context) {
  //                   return Container(
  //                     child: Column(
  //                       children: [
  //                         Text("Name :"+" "+e["first_name"] + " " + e['last_name'],style: TextStyle(color: Colors.black,fontSize: 25)),
  //                         ButtonBar(
  //                           alignment: MainAxisAlignment.spaceBetween,
  //                           children: <Widget>[
  //                             TextButton(
  //                               style: TextButton.styleFrom(
  //                                 padding: const EdgeInsets.all(5.0),
  //                                 foregroundColor: Colors.blueAccent,
  //                                 textStyle:
  //                                 const TextStyle(fontSize: 20),
  //                               ),
  //                               child: const Text('Edit'),
  //                               onPressed: () {
  //                                 Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder: (context) =>
  //                                           login_page(value: e),
  //                                     ));
  //                               },
  //                             ),
  //                             TextButton(
  //                               style: TextButton.styleFrom(
  //                                 foregroundColor: Colors.red,
  //                                 textStyle:
  //                                 const TextStyle(fontSize: 20),
  //                               ),
  //                               child: const Text('Delete'),
  //                               onPressed: () async {
  //                                 var response =
  //                                 await FirebaseCurd.deleteUser(
  //                                     userId: e["contact_no"]);
  //
  //                                 setState(() {});
  //                               },
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   );
  //                 },);
  //               },
  //               child: Card(
  //                   elevation: 2,
  //                   child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                             e["first_name"] + " " + e['last_name'],style: TextStyle(color: Colors.black,fontSize: 25)),
  //
  //                       ])),
  //             );
  //           }).toList(),
  //         )
  //             : Center(
  //           child: Text(
  //             'There is not entry in database, Go back and add user',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(fontSize: 22),
  //           ),
  //         ),
  //       );
  //     }
  //     return Container();
  //   },
  // ),
}


















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:login/pages/Listofuser.dart';
//
//
// import '../firebase/firebase_curd.dart';
// import '../preference/shared_preference.dart';
// import 'firstpage.dart';
//
// import 'show page.dart';
// import 'usermodal.dart';
//
// class login_page extends StatefulWidget {
//   login_page( {super.key,this.value});
//
//   QueryDocumentSnapshot<Object?>? value;
//
//   @override
//   State<login_page> createState() => _login_pageState();
// }
//
// class _login_pageState extends State<login_page> {
//   var _globekey = GlobalKey<FormState>();
//   bool _eye = true;
//   bool _done = true;
//   List<Listofuser> UserList = [
//     Listofuser(hobby: "Reading", abcd: false),
//     Listofuser(hobby: "Writing", abcd: false),
//   ];
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailAddController = TextEditingController();
//   final TextEditingController _phoneNoController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _passWordController = TextEditingController();
//   final TextEditingController _other = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//   TextEditingController();
//   RegExp regex = new RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//   RegExp regex1 = new RegExp(r'[0-9]');
//   RegExp regex2 = new RegExp(
//       r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
//   RegExp regex3 = new RegExp('[a-zA-Z]');
//   RegExp regex4 = new RegExp('[0-9]');
//
//   int radioValue = 0;
//   Color _text1 = Colors.black;
//   Color _text2 = Colors.black;
//   Color _text3 = Colors.black;
//   Color _text4 = Colors.black;
//   Color _text5 = Colors.black;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//               backgroundColor: Colors.blue,
//               leading: InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.arrow_back)),
//               title: Text("Login Page")),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: _globekey,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 35),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _firstNameController,
//                         keyboardType: TextInputType.text,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(regex3)
//                         ],
//                         //autovalidateMode: AutovalidateMode.always,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter First Name";
//                           } else if (!value.contains(regex3)) {
//                             return "Please enter vaild name";
//                           }
//                         },
//                         decoration: InputDecoration(
//                             labelText: "First Name",
//                             hintText: "Enter Your First Name",
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15))),
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _lastNameController,
//                         keyboardType: TextInputType.text,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(regex3)
//                         ],
//                         decoration: InputDecoration(
//                             labelText: "Last Name(Optional)",
//                             hintText: "Enter Your Last Name",
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15))),
//                         //autovalidateMode: AutovalidateMode.always,
//                         validator: (value) {
//                           if (value!.contains(regex4)) {
//                             return "Please enter vaild name no use number and special charcter";
//                           }
//                         },
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _emailAddController,
//                         keyboardType: TextInputType.emailAddress,
//                         //autovalidateMode: AutovalidateMode.always,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter email";
//                           } else if (!value.contains(regex)) {
//                             return "Please enter vaild email";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                             labelText: "Email Address",
//                             hintText: "Enter Your Email Address",
//                             prefixIcon: Icon(Icons.email),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15))),
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _phoneNoController,
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(regex4)
//                         ],
//                         // autovalidateMode: AutovalidateMode.always,
//                         maxLength: 10,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter contact No";
//                           } else if (!value.contains(regex1)) {
//                             return "Please enter vaild contact No";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                             labelText: "Contact No",
//                             hintText: "Enter Your contact No",
//                             prefixIcon: Icon(Icons.phone),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15))),
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _addressController,
//                         keyboardType: TextInputType.text,
//                         minLines: 1,
//                         maxLines: 4,
//                         //autovalidateMode: AutovalidateMode.always,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter Address";
//                           }
//                         },
//                         decoration: InputDecoration(
//                             hintText: "Enter Your Address",
//                             labelText: "Address",
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15))),
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _passWordController,
//                         keyboardType: TextInputType.text,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter Password";
//                             //   } else if (value.length < 8) {
//                             //     return "Please Enter Minimum 8 character";
//                             //   } else if (!value.contains(RegExp(r'[A-Z]'))) {
//                             //     return "PLease Enter at least 1 Upper case Character";
//                             //   } else if (!value.contains(RegExp(r'[a-z]'))) {
//                             //     return "PLease Enter at least 1 Lower case Character";
//                             //   } else if (!value.contains(RegExp(r'[_\-==@\.;$]'))) {
//                             //     return "PLease Enter at least 1 Special Symbol Character";
//                             //   } else if (!value.contains(RegExp(r'[0-9]'))) {
//                             //     return "PLease Enter at least 1 Number Character";
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {
//                           setState(() {
//
//                             _text1 = value.length < 8 ? Colors.red : Colors.green;
//                             _text2 = !value.contains(RegExp(r'[A-Z]'))
//                                 ? Colors.red
//                                 : Colors.green;
//                             _text3 = !value.contains(RegExp(r'[a-z]'))
//                                 ? Colors.red
//                                 : Colors.green;
//                             text4 = !value.contains(RegExp(r'[\-==@\.;$]'))
//                                 ? Colors.red
//                                 : Colors.green;
//                             _text5 = !value.contains(RegExp(r'[0-9]'))
//                                 ? Colors.red
//                                 : Colors.green;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           labelText: "Password",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           suffixIcon: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   _eye = !_eye;
//                                 });
//                               },
//                               child: (_eye)
//                                   ? Icon(CupertinoIcons.eye_slash)
//                                   : Icon(CupertinoIcons.eye)),
//                         ),
//                         obscureText: _eye,
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("*  Minimum 8 Character.",
//                                     style: TextStyle(color: _text1)),
//                                 Text("*  At least 1 Upper case Character (A-Z).",
//                                     style: TextStyle(color: _text2)),
//                                 Text("*  At least 1 Lower case Character (a-z).",
//                                     style: TextStyle(color: _text3)),
//                                 Text("*  At least 1 Number (0-9).",
//                                     style: TextStyle(color: _text5)),
//                                 Text("*  At least 1 Special Symbol Character.",
//                                     style: TextStyle(color: _text4)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _confirmPasswordController,
//                         keyboardType: TextInputType.text,
//                         //autovalidateMode: AutovalidateMode.always,
//                         validator: (value) {
//                           var cpw =
//                           _confirmPasswordController.text.toString().trim();
//                           var pw = _passWordController.text.toString().trim();
//                           if (value!.isEmpty) {
//                             return "Please enter Confirm Password";
//                           } else if (cpw != pw) {
//                             return "Please Enter Same As Password";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           labelText: "Confirm Password",
//                           hintText: "Confirm Password",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           suffixIcon: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   _done = !_done;
//                                 });
//                               },
//                               child: (_done)
//                                   ? Icon(CupertinoIcons.eye_slash)
//                                   : Icon(CupertinoIcons.eye)),
//                         ),
//                         obscureText: _done,
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(" • Hobby : "),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 60),
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return Row(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Checkbox(
//                                         value: UserList[index].abcd,
//                                         onChanged: (value) {
//                                           setState(() {
//                                             UserList[index].abcd =
//                                             !UserList[index].abcd;
//                                           });
//                                         },
//                                       ),
//                                       Text(UserList[index].hobby),
//                                     ],
//                                   )
//                                 ],
//                               );
//                             },
//                             itemCount: UserList.length),
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 60, top: 10),
//                             child: Text("- Other :"),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 60, top: 10),
//                         child: TextFormField(
//                           controller: _other,
//                           decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5))),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(" • Gender : "),
//                           Radio(
//                             value: 1,
//                             groupValue: radioValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 radioValue = value!;
//                               });
//                             },
//                           ),
//                           Text("Male"),
//                           SizedBox(width: 20),
//                           Radio(
//                             value: 2,
//                             groupValue: radioValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 radioValue = value!;
//                               });
//                             },
//                           ),
//                           Text("Female"),
//                           SizedBox(width: 20),
//                           Radio(
//                             value: 3,
//                             groupValue: radioValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 radioValue = value!;
//                               });
//                             },
//                           ),
//                           Text("Other"),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           bottomNavigationBar: InkWell(
//             onTap: () async {
//               if (_globekey.currentState!.validate()) {
//
//               }
//               Usermodal.FirstName = _firstNameController.text.toString().trim();
//               Usermodal.LastName = _lastNameController.text.toString().trim();
//               Usermodal.EmailAdd = _emailAddController.text.toString().trim();
//               Usermodal.PhoneNo = _phoneNoController.text.toString().trim();
//               Usermodal.Address = _addressController.text.toString().trim();
//
//
//
//               // Map<String,dynamic> req = {
//               //   "first_name": Usermodal.FirstName,
//               //   "last_name": Usermodal.LastName,
//               //   "contact_no": Usermodal.PhoneNo,
//               // };
//               //
//               // var response = await FirebaseCurd.addUser(req: req);
//               // if(response){
//               // }else{
//               //
//               // }
//
//               Map<String, dynamic> reqBody = {
//                 "first_name": Usermodal.FirstName,
//                 "last_name": Usermodal.LastName,
//                 "email_add": Usermodal.EmailAdd,
//                 "contact_no": Usermodal.PhoneNo,
//                 "address": Usermodal.Address,
//                 "password": _passWordController.text.toString().trim(),
//               };
//
//               var response = await FirebaseCurd.addUser(req: reqBody);
//               print(response);
//
//               if (_firstNameController.text.isNotEmpty &&
//                   _lastNameController.text.isNotEmpty &&
//                   _emailAddController.text.isNotEmpty &&
//                   _phoneNoController.text.isNotEmpty &&
//                   _addressController.text.isNotEmpty &&
//                   _passWordController.text.isNotEmpty &&
//                   _confirmPasswordController.text.isNotEmpty) {
//                 _firstNameController.text = "";
//                 _lastNameController.text = "";
//                 _emailAddController.text = "";
//                 _phoneNoController.text = "";
//                 _addressController.text = "";
//                 _passWordController.text = "";
//                 _confirmPasswordController.text = "";
//                 _other.text = "";
//               }
//               //Navigator.of(context).pushAndRemoveUntil(
//               //     MaterialPageRoute(builder: (context) => ShowPage()),
//               //     (Route<dynamic> route) => false);
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
//               child: Container(
//                 height: 50,
//                 width: 600,
//                 decoration: BoxDecoration(
//                     color: Colors.blue, borderRadius: BorderRadius.circular(30)),
//                 child: Center(
//                     child: Text("Submit",
//                         style: TextStyle(fontSize: 20, color: Colors.white))),
//               ),
//             ),
//           ),
//         ));
//   }
// }



// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: FirstPage(),
//     debugShowCheckedModeBanner: false,
//   ));
//}






// class Response{
//   int? code;
//   String? message;
//   Response({this.code,this.message});
// }















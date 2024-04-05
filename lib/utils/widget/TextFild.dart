// import 'package:flutter/material.dart';

// class TextfildScreen extends StatefulWidget {
//   const TextfildScreen({super.key});

//   @override
//   State<TextfildScreen> createState() => _TextfildScreenState();
// }

// class _TextfildScreenState extends State<TextfildScreen> {
//   List<TextEditingController> controllers = [
//     TextEditingController(),
//     TextEditingController(),
//     TextEditingController(),
//     TextEditingController(),
//   ];

//   List<Widget> containers = [];

//   void addButtonPressed() {
//     List<String> values = [];
//     for (TextEditingController controller in controllers) {
//       values.add(controller.text);
//     }

//     setState(() {
//       containers.add(
//         GestureDetector(
//           onTap: () {
//             showEditDialog(values);
//           },
//           child: Container(
//             margin: EdgeInsets.all(5),
//             padding: EdgeInsets.all(10),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   for (int i = 0; i < values.length; i++)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Name${i + 1}: ${values[i]}"),
//                         SizedBox(height: 10),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });

//     for (TextEditingController controller in controllers) {
//       controller.clear();
//     }
//   }

//   Future<void> showEditDialog(List<String> values) async {
//     List<TextEditingController> editControllers = [];

//     for (String value in values) {
//       editControllers.add(TextEditingController(text: value));
//     }

//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Text("Edit Values"),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (int i = 0; i < values.length; i++)
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormField(
//                           controller: editControllers[i],
//                           textInputAction: TextInputAction.done,
//                           onChanged: (value) {},
//                           decoration: InputDecoration(
//                             labelText: "Name ${i + 1}",
//                             contentPadding: EdgeInsets.all(5),
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     for (int i = 0; i < values.length; i++) {
//                       values[i] = editControllers[i].text;
//                     }
//                     Navigator.of(context).pop();
//                     setState(() {});
//                   },
//                   child: Text("Save"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("Cancel"),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 for (int i = 0; i < controllers.length; i++)
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: controllers[i],
//                       textInputAction: TextInputAction.done,
//                       onChanged: (value) {},
//                       decoration: InputDecoration(
//                         counterText: "",
//                         labelText: "Name ${i + 1}",
//                         contentPadding: EdgeInsets.all(5),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: addButtonPressed,
//                   child: Text('Add Data'),
//                 ),
//                 SizedBox(height: 10),
//                 ...containers,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class TextfieldScreen extends StatefulWidget {
//   const TextfieldScreen({Key? key}) : super(key: key);

//   @override
//   State<TextfieldScreen> createState() => _TextfieldScreenState();
// }

// class _TextfieldScreenState extends State<TextfieldScreen> {
//   List<TextEditingController> controllers = [
//     TextEditingController(),
//     TextEditingController(),
//     TextEditingController(),
//     TextEditingController(),
//   ];

//   List<Widget> containers = [];

//   void addButtonPressed() {
//     List<String> values = [];
//     for (TextEditingController controller in controllers) {
//       values.add(controller.text);
//     }

//     setState(() {
//       containers.add(
//         GestureDetector(
//           onTap: () {
//             showEditDialog(values);
//           },
//           child: Container(
//             margin: EdgeInsets.all(5),
//             padding: EdgeInsets.all(10),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   for (int i = 0; i < values.length; i++)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Name ${i + 1}: ${values[i]}"),
//                         SizedBox(height: 10),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });

//     for (TextEditingController controller in controllers) {
//       controller.clear();
//     }
//   }

//   Future<void> showEditDialog(List<String> values) async {
//     List<TextEditingController> editControllers = [];

//     for (String value in values) {
//       editControllers.add(TextEditingController(text: value));
//     }

//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Text("Edit Values"),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (int i = 0; i < values.length; i++)
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormField(
//                           controller: editControllers[i],
//                           textInputAction: TextInputAction.done,
//                           onChanged: (value) {},
//                           decoration: InputDecoration(
//                             labelText: "Name ${i + 1}",
//                             contentPadding: EdgeInsets.all(5),
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     for (int i = 0; i < values.length; i++) {
//                       values[i] = editControllers[i].text;
//                     }
//                     Navigator.of(context).pop();
//                     setState(() {});
//                   },
//                   child: Text("Save"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("Cancel"),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 for (int i = 0; i < controllers.length; i++)
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: controllers[i],
//                       textInputAction: TextInputAction.done,
//                       onChanged: (value) {},
//                       decoration: InputDecoration(
//                         counterText: "",
//                         labelText: "Name ${i + 1}",
//                         contentPadding: EdgeInsets.all(5),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: addButtonPressed,
//                   child: Text('Add Data'),
//                 ),
//                 SizedBox(height: 10),
//                 ...containers,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: TextfieldScreen(),
//   ));
// }

import 'package:flutter/material.dart';

class TextfieldScreen extends StatefulWidget {
  const TextfieldScreen({Key? key}) : super(key: key);

  @override
  State<TextfieldScreen> createState() => _TextfieldScreenState();
}

class _TextfieldScreenState extends State<TextfieldScreen> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<Widget> containers = [];

  void addButtonPressed() {
    List<String> values = [];
    for (TextEditingController controller in controllers) {
      values.add(controller.text);
    }

    setState(() {
      containers.add(_buildContainer(values));
    });

    for (TextEditingController controller in controllers) {
      controller.clear();
    }
  }

  Widget _buildContainer(List<String> values) {
    return GestureDetector(
      onTap: () {
        showEditDialog(values);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < values.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name ${i + 1}: ${values[i]}"),
                    SizedBox(height: 10),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void showEditDialog(List<String> values) async {
    List<TextEditingController> editControllers = [];

    for (String value in values) {
      editControllers.add(TextEditingController(text: value));
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Edit Values"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < values.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: editControllers[i],
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            labelText: "Name ${i + 1}",
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < values.length; i++) {
                      values[i] = editControllers[i].text;
                    }
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < controllers.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllers[i],
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: "Name ${i + 1}",
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addButtonPressed,
                  child: Text('Add Data'),
                ),
                SizedBox(height: 10),
                ...containers,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

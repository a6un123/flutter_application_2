import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/homescreencontroller.dart';
import 'package:flutter_application_2/utilites/constants/colorsonstaints.dart';
import 'package:intl/intl.dart';

class TaskAddedscreen extends StatefulWidget {
  const TaskAddedscreen({super.key});

  @override
  State<TaskAddedscreen> createState() => _TaskAddedscreenState();
}

class _TaskAddedscreenState extends State<TaskAddedscreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskcontroller = TextEditingController();
    TextEditingController datecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 53, 73),
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
            onPressed: () async {
              await Homescreencontroller.addData(
                  tasks: taskcontroller.text, dates: datecontroller.text);
            
              Navigator.pop(context);
              setState(() {});
            },
            icon: Icon(Icons.done)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "New Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What is to be done?",
                      style: TextStyle(
                          color: Colorconstaints.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: taskcontroller,
                      decoration: InputDecoration(
                        hintText: "Enther Task Here",
                        filled: true,
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colorconstaints.Black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Due Date",
                        style: TextStyle(
                            color: Colorconstaints.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      readOnly: true,
                      controller: datecontroller,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Date not set",
                        suffixIcon: InkWell(
                          onTap: () async {
                            var selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now());
                            if (selectedDate != null) {
                              datecontroller.text =
                                  DateFormat("dd,MMMM,y").format(selectedDate);
                            }
                          },
                          child: Icon(
                            Icons.calendar_month,
                            color: Colorconstaints.Black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Notification",
                      style: TextStyle(color: Colorconstaints.blue),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Add to List",
                        style: TextStyle(
                            color: Colorconstaints.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Default",
                          style: TextStyle(color: Colorconstaints.white, fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colorconstaints.white,
                          size: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.list,
                          color: Colorconstaints.white,
                          size: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

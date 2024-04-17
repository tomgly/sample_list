import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:intl/intl.dart';
import 'collections/car.dart';

class EditPage extends StatefulWidget {
  const EditPage({required this.isar, required this.car});

  final Isar isar;
  final Car car;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late Car car;
  late TextEditingController nameController;
  late TextEditingController colorController;
  late TextEditingController yearController;

  @override
  void initState() {
    super.initState();
    car = widget.car;
    nameController = TextEditingController(text: car.name ?? "NO Name");
    colorController = TextEditingController(text: car.color ?? "No Color");
    yearController = TextEditingController(text: car.year ?? "No Year");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Car', style: TextStyle(color: Colors.black, fontSize: 25)),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "Car Name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: colorController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "Body Color",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: yearController,
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Year',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Select Year"),
                          content: Container(
                            width: 300,
                            height: 300,
                            child: YearPicker(
                              firstDate: DateTime(1980),
                              lastDate: DateTime(2024),
                              //initialDate: DateTime.now(),
                              selectedDate: DateFormat('yyyy').parse(car.year ?? "yyyy"),
                              onChanged: (DateTime value) {
                                Navigator.pop(context);
                                yearController.text = DateFormat('yyyy').format(value);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () async {
                  car
                    ..name = nameController.text
                    ..color = colorController.text
                    ..year = yearController.text;

                  widget.isar.writeTxn(() async {
                    await widget.isar.cars.put(car);
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
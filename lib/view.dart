import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'collections/car.dart';
import 'add.dart';
import 'edit.dart';

class ViewPage extends StatefulWidget {
  final Isar isar;

  ViewPage({required this.isar});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await widget.isar.cars.where().findAll();
    setState(() {
      cars = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData(); 
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample List', style: TextStyle(color: Colors.black, fontSize: 25)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [ Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await loadData();
            },
            child: Card( child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: cars.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (BuildContext context, int index) {
                final car = cars[index];
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    extentRatio: 0.4,
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditPage(isar: widget.isar, car: car),
                            ),
                          );
                          //loadData();
                        },
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        icon: Icons.more,
                      ),
                      SlidableAction(
                        onPressed: (_) async {
                          await widget.isar.writeTxn(() async {
                            return widget.isar.cars.delete(car.id);
                          });
                          //loadData();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Deleted'))
                          );
                        },
                        backgroundColor: Colors.red.shade500,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(car.name ?? "No Name", style: TextStyle(color: Colors.black)),
                    subtitle: Text("Color: " + (car.color ?? "No Color") + ", Year: " + (car.year ?? "No Year")),
                    tileColor: Color(0xffddffdd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  )
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ))
          ))
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPage(isar: widget.isar),
            ),
          );
          loadData();
          },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
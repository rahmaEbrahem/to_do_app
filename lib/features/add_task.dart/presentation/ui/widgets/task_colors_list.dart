import 'package:flutter/material.dart';

class TaskColorsList extends StatefulWidget {
  final Function(Color?) value;
  const TaskColorsList({super.key, required this.value});

  @override
  State<TaskColorsList> createState() => _TaskColorsListState();
}

class _TaskColorsListState extends State<TaskColorsList> {
  List<MaterialColor> taskcolors = [
    Colors.cyan,
    Colors.amber,
    Colors.brown,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
  ];
  var activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                activeIndex = index;
                widget.value(taskcolors[index]);
              });
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: taskcolors[index],
              child: activeIndex == index
                  ? Center(child: Icon(Icons.check))
                  : null,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 5);
        },
        itemCount: taskcolors.length,
      ),
    );
  }
}

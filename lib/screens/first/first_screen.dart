import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  String? uri = "https://cdn-icons-png.flaticon.com/512/219/219983.png";
  static const List<Map<String, dynamic>> discoverData = [
    {"title": "Cardio", "numberOfExercises": 10, "minutesOfDuration": 50},
    {"title": "Arms", "numberOfExercises": 6, "minutesOfDuration": 35},
    {"title": "Chest", "numberOfExercises": 5, "minutesOfDuration": 90},
    {"title": "Legs", "numberOfExercises": 20, "minutesOfDuration": 40},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSection(uri: uri),
              SizedBox(height: 20),
              StatsSection(columnsNumber: 2),
              Text(
                "Discover new workouts",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              NewWorkoutsSection(items: discoverData),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Keep the progress!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {
  final String? uri;

  const ProfileSection({super.key, this.uri});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Omar", style: TextStyle(fontSize: 32)),
              Text("Let's check your activity", style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child:
                  (widget.uri != null) &&
                          (widget.uri is String) &&
                          widget.uri!.isNotEmpty
                      ? Image.network(widget.uri!, fit: BoxFit.cover)
                      : Icon(Icons.account_circle, size: 80),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  final int columnsNumber;
  final double gridHeight = 300;
  final double columnGap = 20;
  final double rowGap = 20;

  const StatsSection({super.key, required this.columnsNumber});

  double lenghtOfCell(int numberOfCell) {
    double result = (((gridHeight / columnsNumber) * numberOfCell) - rowGap);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: gridHeight,
          child: StaggeredGrid.extent(
            maxCrossAxisExtent: constraints.maxWidth / columnsNumber,
            mainAxisSpacing: rowGap,
            crossAxisSpacing: columnGap,
            children: [
              StaggeredGridTile.extent(
                crossAxisCellCount: 1,
                mainAxisExtent: lenghtOfCell(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(221, 221, 221, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    spacing: 30,
                    children: [
                      Text(
                        "Finished",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "12",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StaggeredGridTile.extent(
                crossAxisCellCount: 1,
                mainAxisExtent: lenghtOfCell(1),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(221, 221, 221, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "In Progress",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Workouts",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              StaggeredGridTile.extent(
                crossAxisCellCount: 1,
                mainAxisExtent: lenghtOfCell(1),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(221, 221, 221, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time Spent",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "62",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Minutes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewWorkoutsSection extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const NewWorkoutsSection({super.key, required this.items});

  @override
  State<NewWorkoutsSection> createState() => _NewWorkoutsSectionState();
}

class _NewWorkoutsSectionState extends State<NewWorkoutsSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemBuilder: (context, index) {
          var currentItem = widget.items[index];
          return WorkoutItem(
            title: currentItem["title"],
            numberOfExercises: currentItem["numberOfExercises"],
            minutesOfDuration: currentItem["minutesOfDuration"],
          );
        },
      ),
    );
  }
}

class WorkoutItem extends StatefulWidget {
  final String title;
  final int numberOfExercises;
  final int minutesOfDuration;

  const WorkoutItem({
    super.key,
    required this.title,
    required this.numberOfExercises,
    required this.minutesOfDuration,
  });

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}

class _WorkoutItemState extends State<WorkoutItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(
          255, // Canal alfa (opacidad)
          Random().nextInt(256), // Canal rojo (0-255)
          Random().nextInt(256), // Canal verde (0-255)
          Random().nextInt(256), // Canal azul (0-255)
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -15,
            top: 20,
            child: Image.network(
              width: 100,
              "https://cdn-icons-png.flaticon.com/512/8171/8171559.png",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${widget.numberOfExercises} Exersices",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "${widget.minutesOfDuration} Minutes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

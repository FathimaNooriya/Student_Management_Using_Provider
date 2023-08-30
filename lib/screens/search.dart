import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stulast/database/db_functions/db_functions.dart';
import 'package:stulast/database/db_model/db_model.dart';
import 'package:stulast/screens/student_dtails.dart';
import 'package:provider/provider.dart';

class searchStudents extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.close_rounded))
    ];

    // TODO: implement buildActions
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));

    // TODO: implement buildLeading
    //   throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return
        //  ValueListenableBuilder(
        //   valueListenable:StudentProvider().studentList,
        //   builder:
        //       (BuildContext context, List<StudenNewtModel> value, Widget? child) {
        Consumer<StudentProvider>(
      builder: (context, value, child) {
        return SafeArea(
            child: Center(
          child: ListView.builder(
            itemCount: value.studentList.length,
            itemBuilder: (context, index) {
              if (value.studentList[index].name
                  .toLowerCase()
                  .contains(query.toLowerCase())) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            FileImage(File(value.studentList[index].image)),
                      ),
                      title: Text("${value.studentList[index].name}"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => student_datails_page(
                              name: value.studentList[index].name,
                              age: value.studentList[index].age,
                              stclass: value.studentList[index].stclass,
                              adress: value.studentList[index].adress,
                              image: value.studentList[index].image,
                              index: index),
                        ));
                      },
                    ),
                    Divider(),
                  ],
                );
              } else {
                return Text("No");
              }
            },
          ),
        ));
        //   },
        // );
      },
    );
    // TODO: implement buildResults
    //  throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return
        //  ValueListenableBuilder(
        //   valueListenable: StudentProvider().studentList,
        //   builder:
        //       (BuildContext context, List<StudenNewtModel> value, Widget? child) {
        Consumer<StudentProvider>(
      builder: (context, value, child) {
        return SafeArea(
            child: ListView.builder(
          itemCount: value.studentList.length,
          itemBuilder: (context, index) {
            if (value.studentList[index].name
                .toLowerCase()
                .contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          FileImage(File(value.studentList[index].image)),
                    ),
                    title: Text("${value.studentList[index].name}"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => student_datails_page(
                            name: value.studentList[index].name,
                            age: value.studentList[index].age,
                            stclass: value.studentList[index].stclass,
                            adress: value.studentList[index].adress,
                            image: value.studentList[index].image,
                            index: index),
                      ));
                    },
                  ),
                  Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
        ));
      },
    );

    // TODO: implement buildSuggestions
    // throw UnimplementedError();
  }
}

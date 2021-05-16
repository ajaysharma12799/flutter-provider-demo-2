import 'package:flutter/material.dart';
import 'package:flutter_state_managment_2/provider/TaskModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Widget _buildForm(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.tealAccent,
              ),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.tealAccent,
              ),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.pinkAccent,
              ),
              child: TextButton(
                onPressed: () =>
                    Provider.of<TaskProvider>(context, listen: false)
                        .addTaskItem(
                            titleController.text, descriptionController.text),
                child: Text(
                  "Ok",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Expanded(child: Consumer<TaskProvider>(
      builder: (context, todo, child) {
        return ListView.builder(
          itemCount: todo.taskItem.length,
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    bottom: 5,
                    left: 30,
                    right: 32,
                  ),
                  title: Text(
                    todo.taskItem[index].title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    todo.taskItem[index].description,
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Provider"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              _buildForm(context),
              SizedBox(
                height: 30,
              ),
              _buildList(context),
            ],
          ),
        ));
  }
}

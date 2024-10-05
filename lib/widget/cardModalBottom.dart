import 'package:flutter/material.dart';

class cardModalBottom extends StatelessWidget {
  cardModalBottom({
    super.key,
    required this.addTask,
  });
  final Function addTask;

  TextEditingController controller = TextEditingController();

  void _handleOnClick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Typing in here !',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => _handleOnClick(context),
                  child: Text('Add task')),
            ),
          ],
        ),
      ),
    );
  }
}

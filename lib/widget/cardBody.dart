import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class cardBody extends StatelessWidget {
  cardBody({
    required this.item,
    required this.handleDelete,
    required this.index,
    super.key,
  });

  var item;
  var index;
  final handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 173, 220, 253)
            : const Color.fromARGB(255, 253, 216, 224),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4B4B),
                fontSize: 20,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: Icon(
                color: Color(0xFF4B4B4B),
                Icons.delete_outlined,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

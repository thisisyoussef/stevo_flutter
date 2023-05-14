import 'package:flutter/material.dart';

//Widget for the screens: A floating container with custom contents in that takes you to a new screen when you tap on it.
//The container also has a border and a shadow. 
//The container also has a title and a subtitle that are displayed on the top of the container.
//The DialogBox widget takes in arguments for the title and subtitle. It also takes in an argument for the contents of the container.

class DialogBox extends StatelessWidget {
  const DialogBox({required this.title, required this.subtitle, required this.contents});

  final String title;
  final String subtitle;
  final Widget contents;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped on $title');
        //add navigation to new screen here
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            Expanded(child: contents),
       
          ],
        ),
      ),
    );
  }
}

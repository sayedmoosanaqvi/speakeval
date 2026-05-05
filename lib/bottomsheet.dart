import 'package:flutter/material.dart';

class BottomSheets extends StatelessWidget {
  const BottomSheets({super.key});

  void showbottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.grey,

      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("CHoose ANy Of The Options"),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.teal),
                title: Text("Open Camera"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album, color: Colors.teal),
                title: Text("Attach Photos"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.file_download_done_sharp,
                  color: Colors.teal,
                ),
                title: Text("Attach Files"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet Tutorial"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showbottomsheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black87,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text("Display Sheet"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          actions : [
          Icon(Icons.search,color: Colors.white,),
          SizedBox(width: 10),
          Icon(Icons.more_horiz_outlined,color: Colors.white,),
          SizedBox(width: 20)
          ],


          backgroundColor: Colors.teal,
          title: const Text('WhatsApp', style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            indicatorColor: Colors.white, // color of the underline
            indicatorWeight: 4,
            labelColor: Colors.white, // color of the selected tab
            unselectedLabelColor:
                Colors.white70, // color of the unselected tabs

            tabs: const [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Center(child: Text('Camera Screen')),
            Center(child: Text('Chats Screen')),
            Center(child: Text('Status Screen')),
            Center(child: Text('Calls Screen')),
          ],
        ),
      ),
    );
  }
}

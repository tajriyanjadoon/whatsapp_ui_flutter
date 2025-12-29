import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: false,
          title: const Text('WhatsApp', style: TextStyle(color: Colors.white)),

          actions: [
            const Icon(Icons.search, color: Colors.white),
            const SizedBox(width: 10),

            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              itemBuilder: (context) => const [
                PopupMenuItem(value: 1, child: Text('New group')),
                PopupMenuItem(value: 2, child: Text('New broadcast')),
                PopupMenuItem(value: 3, child: Text('Linked devices')),

                PopupMenuItem(value: 4, child: Text('Starred messages')),
              ],
            ),

            const SizedBox(width: 10),
          ],

          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            //camera
            Center(child: Text('Camera Screen')),
            //chats
            Scrollbar(
              thumbVisibility: true, // always show scrollbar
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade500,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text('User $index'),
                    subtitle: Text('Hello!  message from User $index.'),
                    trailing: Text('12:0${index} PM'),
                  );
                },
              ),
            ),

            // STATUS TAB
            // STATUS TAB
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // First item is "My Status"
                  return ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade500,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.add, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    title: const Text('My Status'),
                    subtitle: const Text('Tap to add status update'),
                  );
                }

                // Green-bordered users
                if (index <= 3) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Label
                      if (index == 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Recent updates',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      // Status tile
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 3),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade500,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                        title: Text('User $index'),
                        subtitle: Text(
                          index % 2 == 0 ? 'Today, 8:00 AM' : 'Yesterday, 6:00 PM',
                        ),
                      ),

                      // Divider after 3rd green user
                      if (index == 3)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Viewed updates',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  );

                }

                // Grey-bordered users
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 3),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade500,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  title: Text('User $index'),
                  subtitle: Text(
                    index % 2 == 0 ? 'Today, 8:00 AM' : 'Yesterday, 6:00 PM',
                  ),
                );
              },
            ),


            //calls
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade500,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('User $index'),
                  subtitle: Text(
                    index % 2 == 0 ? 'missed voice call' : 'missed audio call',
                  ),

                  trailing: Icon(
                    index % 2 == 0 ? Icons.video_call : Icons.call,
                    color: Colors.green,
                    size: 16,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

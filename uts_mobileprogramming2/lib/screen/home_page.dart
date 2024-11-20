import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int? _selectedIndex;
  late TabController _tabController;

  // Daftar gambar yang akan ditampilkan
  final List<String> itemImages = [
    'assets/audiR8.jpeg',
    'assets/lamborghini.jpeg', 
    'assets/mclaren.jpeg', 
    'assets/bmwM4.jpeg',
    'assets/porsche.jpeg', 
    'assets/ferarri.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.teal,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Tab 1'),
            Tab(icon: Icon(Icons.star), text: 'Tab 2'),
            Tab(icon: Icon(Icons.person), text: 'Tab 3'),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.teal.shade50,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.teal),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'NurulSetianingtyas@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.teal),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.teal),
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.teal),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.teal.shade50,
            child: Row(
              children: [
                Container(
                  width: 120,
                  color: Colors.teal.shade100,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Card(
                          margin: EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          color: _selectedIndex == index
                              ? Colors.teal.shade300
                              : Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal.shade300,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              'Item ${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.teal.shade800,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Welcome to Home Page!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: _selectedIndex == null
                            ? Center(
                                child: Text(
                                  'Select an item from the list',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.teal.shade600,
                                  ),
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Menampilkan gambar berdasarkan indeks
                                  Image.asset(
                                    itemImages[_selectedIndex!], // Ambil gambar berdasarkan indeks yang dipilih
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 16),
                                  // Teks Detail Item
                                  Text(
                                    'Details of Item ${_selectedIndex! + 1}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal.shade800,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              'Content for Tab 2',
              style: TextStyle(fontSize: 18, color: Colors.teal.shade800),
            ),
          ),
          Center(
            child: Text(
              'Content for Tab 3',
              style: TextStyle(fontSize: 18, color: Colors.teal.shade800),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.teal.shade100,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.teal.shade400,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

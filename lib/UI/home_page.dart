import 'package:flutter/material.dart';
import 'package:veggie_box/UI/cart.dart';
import 'package:veggie_box/UI/profile.dart';
import 'package:veggie_box/UI/reusable_widget.dart'; // Ensure Profile is imported for navigation

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff43992D),
      ),
      body: HomeContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/vegetable1.png',
      'assets/images/vegetable2.png',
      'assets/images/vegetable3.png'
    ];

    final List<Map<String, dynamic>> vegetables = [
      {
        'name': 'Kangkung',
        'price': 6000,
        'image': 'assets/images/kangkung.png'
      },
      {'name': 'Tomat', 'price': 12000, 'image': 'assets/images/tomat.png'},
      {'name': 'Cabe', 'price': 4000, 'image': 'assets/images/cabai.png'},
    ];

    final List<Map<String, dynamic>> packages = [
      {
        'name': 'Sayur Sop',
        'price': 20000,
        'image': 'assets/images/sayursop.png'
      },
      {
        'name': 'Cah Kangkung',
        'price': 25000,
        'image': 'assets/images/cahkangkung.png'
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            width: 370,
            decoration: BoxDecoration(color: Color(0xff43992D)),
            child: SizedBox(
              // height: 200,
              child: PageView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Image.asset(imageList[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pilihan Sayur',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: vegetables.length,
                  itemBuilder: (context, index) {
                    final vegetable = vegetables[index];
                    return Card(
                      child: Column(
                        children: [
                          Image.asset(
                            vegetable['image'],
                            height: 50,
                            width: double.infinity,
                          ),
                          Text(
                            vegetable['name'],
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text('Rp ${vegetable['price']},-',
                                  style: TextStyle(fontSize: 10)),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                height: 20,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartPage(),
                                      ),
                                    );
                                  },
                                  child: const Text('+'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                const Text('Paket Sayur',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: packages.length,
                  itemBuilder: (context, index) {
                    final package = packages[index];
                    return Card(
                      child: Column(
                        children: [
                          Image.asset(
                            package['image'],
                            height: 50,
                            width: double.infinity,
                          ),
                          Text(package['name'],
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text('Rp ${package['price']},-',
                                  style: TextStyle(fontSize: 10)),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                height: 20,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartPage(),
                                      ),
                                    );
                                  },
                                  child: const Text('+'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

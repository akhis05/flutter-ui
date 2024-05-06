import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Discover the most modern furniture",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                // Aksi yang ingin Anda lakukan saat tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shadowColor: Colors.grey[20],
                elevation: 5.0,
              ),
              child: Text(
                "Add To Cart".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: MyListView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  MyListView({Key? key}) : super(key: key);

  final List<String> categories = [
    "All",
    "Living Room",
    "Bedroom",
    "Dining Room",
    "Kitchen"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 35,
          child: CustomListView(
            categories: categories,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 200,
          child: CustomListView(
            categories: categories,
            scrollDirection: Axis.vertical,
          ),
        ),
        SizedBox(
          height: 200,
          child: CustomListView(
            categories: categories,
            scrollDirection: Axis.vertical,
          ),
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.categories,
    required this.scrollDirection,
  }) : super(key: key);

  final List<String> categories;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      children: List.generate(
        categories.length,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Text(categories[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
          );
        },
      ),
    );
  }
}

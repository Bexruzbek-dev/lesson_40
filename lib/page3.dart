import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_40/page1.dart';
import 'package:lesson_40/page2.dart';

enum MenuOptions { gallery, list, tile }

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OLX",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gap(10),
                const Text(
                  "BIZ 1000 DAN ORTIQ ELONLARNI TOPDIK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Gap(30),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.change_circle_rounded,
                  ),
                ),
                PopupMenuButton<MenuOptions>(
                  icon: Icon(Icons.more_vert),
                  onSelected: (MenuOptions result) {
                    if (result == MenuOptions.gallery) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Page1();
                          },
                        ),
                      );
                    } else if (result == MenuOptions.list) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Page2();
                          },
                        ),
                      );
                    } else if (result == MenuOptions.tile) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Page3();
                          },
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<MenuOptions>>[
                    const PopupMenuItem<MenuOptions>(
                      value: MenuOptions.gallery,
                      child: ListTile(
                        leading: Icon(Icons.photo),
                        title: Text('Галерея'),
                      ),
                    ),
                    const PopupMenuItem<MenuOptions>(
                      value: MenuOptions.list,
                      child: ListTile(
                        leading: Icon(Icons.list),
                        title: Text('Список'),
                      ),
                    ),
                    const PopupMenuItem<MenuOptions>(
                      value: MenuOptions.tile,
                      child: ListTile(
                        leading: Icon(Icons.grid_on),
                        title: Text('Плитка'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MyGridView(),
          ],
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(20, (index) {
    return {
      'image':
          'https://frankfurt.apollo.olxcdn.com/v1/files/nsg46y6w6p162-UZ/image;s=1000x700', // replace with your image URL
      'title': 'Kia Soul 2023',
      'subtitle': 'Йил янги без пробег',
      'price': '952 380 000 сўм',
      'location': 'Ташкент, Сергелиский район',
      'date': '13 май 2024 г.'
    };
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, // Adjust the aspect ratio as needed
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      item['image']!,
                      height: 90,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    item['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(item['subtitle']!),
                  SizedBox(height: 4.0),
                  Text(
                    item['price']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text('${item['location']!}\n${item['date']!}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
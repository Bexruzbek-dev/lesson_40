import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_40/page1.dart';
import 'package:lesson_40/page3.dart';

enum MenuOptions { gallery, list, tile }

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final scrollcontroller = ScrollController();

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
              MyListView(),
            ],
          ),
        ));
  }
}

class MyListView extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(20, (index) {
    return {
      'image':
          'https://media.ed.edmunds-media.com/chevrolet/tahoe/2023/oem/2023_chevrolet_tahoe_4dr-suv_high-country_fq_oem_1_1600.jpg',
      'title': 'Cobalt 2024',
      'subtitle': 'Йил янги без пробег',
      'price': '952 380 000 сўм',
      'location': 'Ташкент, Сергелиский район',
      'date': '13 май 2024 г.'
    };
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  item['image']!,
                  height: 200,
                ),
                Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      item['title']!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4.0),
                    Text(item['subtitle']!),
                    SizedBox(height: 4.0),
                    Text(
                      item['price']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    SizedBox(height: 4.0),
                    Text('${item['location']!} \n${item['date']!}'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

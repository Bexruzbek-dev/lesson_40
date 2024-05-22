import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Color? iconColor;

enum MenuOptions { gallery, list, tile }

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Map<String, String>> filteredProducts = [];
  final List<Map<String, String>> cars = [
    {
      'name': 'Toyota Corolla',
      'price': '120 000 000 сум',
      'year': '2020',
      'address': 'Ташкент, Мирзо-Улугбекский район',
      'about':
          'Очень хороший автомобиль в отличном состоянии. Пробег 50,000 км.',
      'imageUrl':
          'https://orientmotors.uz/uploads/images/product/Toyota/corolla/corolla-12t-1-642.jpg',
    },
    {
      'name': 'Chevrolet Malibu',
      'price': '150 000 000 сум',
      'year': '2019',
      'address': 'Ташкент, Яккасарайский район',
      'about':
          'Машина в идеальном состоянии, все ТО пройдены вовремя. Пробег 30,000 км.',
      'imageUrl':
          'https://www.gazeta.uz/media/img/2017/04/odeCxw14932250895921_b.jpg',
    },
    {
      'name': 'Hyundai Sonata',
      'price': '180 000 000 сум',
      'year': '2021',
      'address': 'Ташкент, Сергелийский район',
      'about':
          'Полный комплект, без аварий, гаражное хранение. Пробег 10,000 км.',
      'imageUrl': 'https://avtoremont.uz/d/novaya-hyundai-sonata-2021.jpg',
    },
    {
      'name': 'Honda Accord',
      'price': '200 000 000 сум',
      'year': '2018',
      'address': 'Ташкент, Чиланзарский район',
      'about': 'Отличное состояние, не битая, не крашеная. Пробег 40,000 км.',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Honda_Accord_%28CV3%29_EX_eHEV%2C_2021%2C_front.jpg/280px-Honda_Accord_%28CV3%29_EX_eHEV%2C_2021%2C_front.jpg',
    },
    {
      'name': 'BMW 5 Series',
      'price': '350 000 000 сум',
      'year': '2017',
      'address': 'Ташкент, Юнусабадский район',
      'about': 'Полный привод, люк, кожа, все опции. Пробег 70,000 км.',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/BMW_5-Series_G38_Li_Facelift_Shishi_01_2022-04-23.jpg/1200px-BMW_5-Series_G38_Li_Facelift_Shishi_01_2022-04-23.jpg',
    },
    {
      'name': 'Mercedes-Benzs',
      'price': '400 000 000 сум',
      'year': '2019',
      'address': 'Ташкент, Шайхантахурский район',
      'about': 'Состояние нового авто, полный фарш, пробег 20,000 км.',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSelf6SNmUjLspaEC3_TniJlpkyll0R9CUatD1fIvttlg&s',
    },
    {
      'name': 'Audi A4',
      'price': '300 000 000 сум',
      'year': '2020',
      'address': 'Ташкент, Бектемирский район',
      'about': 'Сервисная книжка, 1 владелец, не битая. Пробег 15,000 км.',
      'imageUrl':
          'https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/a4-tdiavant-601.jpg',
    },
    {
      'name': 'Kia Optima',
      'price': '220 000 000 сум',
      'year': '2018',
      'address': 'Ташкент, Алмазарский район',
      'about': 'Машина в отличном состоянии, родной пробег 25,000 км.',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod/images/2020-kia-optima-mmp-1-1567538336.jpg?crop=0.770xw:0.872xh;0.0928xw,0.128xh&resize=768:*',
    },
    {
      'name': 'Mazda 6',
      'price': '250 000 000 сум',
      'year': '2019',
      'address': 'Ташкент, Мирабадский район',
      'about': 'Отличное состояние, все ТО пройдены. Пробег 35,000 км.',
      'imageUrl':
          'https://s.auto.drom.ru/i24216/c/photos/fullsize/mazda/mazda6/gen473_mazda_mazda6_774061.jpg',
    },
    {
      'name': 'Ford Fusion',
      'price': '210 000 000 сум',
      'year': '2021',
      'address': 'Ташкент, Юкоричирчикский район',
      'about': 'Машина как новая, один владелец. Пробег 10,000 км.',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/7/71/2019_Ford_Fusion_Titanium_Energi%2C_front_2.29.20.jpg',
    },
    {
      'name': 'BYD Xan',
      'price': '740 000 000 сум',
      'year': '2024',
      'address': 'Ташкент, Юкоричирчикский район',
      'about': 'Машина как новая, один владелец. Пробег 0,00 км.',
      'imageUrl':
          'https://frankfurt.apollo.olxcdn.com/v1/files/ev77c1vbwz4p-UZ/image;s=1280x1280',
    },
  ];
  //

  MenuOptions _selectedView = MenuOptions.gallery;

  @override
  void initState() {
    super.initState();
    filteredProducts = cars; // Show all products by default
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = cars;
      } else {
        filteredProducts = cars.where((car) {
          return car['name']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  Widget _buildGalleryView() {
    return Column(
      children: filteredProducts.map((product) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      product['imageUrl']!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: const Text(
                        'ТОП',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['price']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product['address']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['about']!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const Gap(10),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildListView() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: filteredProducts.map((product) {
        return ListTile(
          leading: Image.network(
            product['imageUrl']!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(product['name']!),
          subtitle: Text(product['price']!),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {},
        );
      }).toList(),
    );
  }

  Widget _buildTileView() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: filteredProducts.map((product) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  product['imageUrl']!,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['price']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

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
                const Gap(10),
                const Text(
                  "BIZ 1000 DAN ORTIQ ELONLARNI TOPDIK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const Gap(30),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.change_circle_rounded,
                  ),
                ),
                PopupMenuButton<MenuOptions>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (MenuOptions result) {
                    setState(() {
                      _selectedView = result;
                    });
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
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: _filterProducts,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Gap(20),
            Builder(
              builder: (BuildContext context) {
                switch (_selectedView) {
                  case MenuOptions.gallery:
                    return _buildGalleryView();
                  case MenuOptions.list:
                    return _buildListView();
                  case MenuOptions.tile:
                    return _buildTileView();
                  default:
                    return _buildGalleryView();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

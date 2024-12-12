import 'package:practise_app/packages/packages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    final w = MediaQuery.of(context).size.width * 1;
    final favProvider = Provider.of<FavouriteProvider>(context, listen: true);
    favProvider.getAllData();
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      body: SizedBox(
        child: Stack(children: [
          Container(
            height: h * 0.35,
            width: w,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage('assets/addidaslinelogo.png'), fit: BoxFit.fill),
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(120, 20),bottomRight: Radius.elliptical(120,20))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: Text(
                'My Favourites',
                style: appStyle(38, Colors.white, FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 65),
              child: ListView.builder(
                itemCount: favProvider.fav.length,
                itemBuilder: (context, int index) {
                  final shoe = favProvider.fav[index];
                  String imageUrl = shoe['image'] ?? ''; // If imageUrl is null, use an empty string
                  if (imageUrl.isEmpty) {
                    imageUrl = 'https://via.placeholder.com/150'; // Default placeholder image if imageUrl is empty
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Slidable(
                        key: ValueKey(shoe['id']),
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            flex: 1,
                            onPressed: (context){
                              favProvider.deleteFav(shoe['key']);
                              favProvider.ids.removeWhere(
                                    (element) => element == shoe['id'],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const MainScreen(),
                                  ));
                              setState(() {
                              });
                            },
                            backgroundColor: const Color(0xff000000),
                            foregroundColor: Colors.white,
                            label: 'Delete',
                          )
                        ]),
                        child: Container(
                          height: h * 0.11, width: w,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CachedNetworkImage(
                                  imageUrl:imageUrl,
                                      //'https://image.goat.com/375/attachments/product_template_pictures/images/020/806/444/original/507844_00.png.png',
                                  width: 70, height: 70,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 3,),
                                  FittedBox(
                                    child: Text('${shoe['name']} Shoe',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: appStyle(
                                          16, Colors.black, FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(shoe['category'],
                                    style: appStyle(
                                        16, Colors.grey, FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text('${shoe['price']} PK',
                                        style: appStyle(
                                            16, Colors.black, FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      //Text('Size  8.0',style: appStyle(16, Colors.grey, FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          favProvider.deleteFav(shoe['key']);
                                          favProvider.ids.removeWhere(
                                            (element) => element == shoe['id'],
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainScreen(),
                                              ));
                                          setState(() {
                                          });
                                        },
                                        child: const Icon(
                                          Icons.favorite,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40,right: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen(),));
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

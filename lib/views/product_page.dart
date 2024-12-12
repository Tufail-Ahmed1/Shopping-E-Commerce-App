import 'package:practise_app/packages/packages.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final Future<List<SneakersModel>> _maleShoes;
  @override
  void initState() {
    super.initState();
    _maleShoes = Helper().getSneakers();
  }
  int? selectedSizeIndex;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    final w = MediaQuery.of(context).size.width * 1;
    final favProvider = Provider.of<FavouriteProvider>(context, listen: true);
    favProvider.getFavourite();
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    cartProvider.getCart();

    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, prodProvider, child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: h,
                leadingWidth: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: FutureBuilder(
                    future: _maleShoes,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return const Center(child: Text('No data available'));
                        }
                        final sneakers = snapshot.data!;
                        List<Sneaker> allSneakers = [];

                        // Loop through all SneakersModel and flatten the sneakers list
                        for (var sneakersModel in sneakers) {
                          allSneakers.addAll(sneakersModel
                              .sneakers); // Add all Sneaker objects from this SneakersModel
                        }
                        return Stack(
                          children: [
                            SizedBox(
                              height: h, width: w,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: allSneakers.length,
                                onPageChanged: (page) {
                                  prodProvider.activePage = page;
                                },
                                itemBuilder: (context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                          height: h * 0.5, width: w,
                                          color: const Color(0xffe2e2e2),
                                          child: CachedNetworkImage(
                                            imageUrl: allSneakers[index].gridPictureUrl,
                                            fit: BoxFit.contain,
                                          )),
                                      Consumer<FavouriteProvider>(
                                        builder: (context, favProvider, child) {
                                          return Positioned(
                                            top: 120,
                                            right: 30,
                                            child: GestureDetector(
                                                onTap: () {
                                                  if (favProvider.ids.contains(widget.key)) {
                                                    Navigator.push(context, MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FavouritePage(),
                                                        ));
                                                  } else {
                                                    favProvider.createFav({
                                                      'id': allSneakers[index].id,
                                                      'name': allSneakers[index].nickname,
                                                      'category': allSneakers[index].gender[0],
                                                      'price': allSneakers[index].retailPriceCents,
                                                      'imageUrl': allSneakers[index].gridPictureUrl[0],
                                                    });
                                                    setState(() {});
                                                  }
                                                },
                                                child: favProvider.ids.contains(
                                                    allSneakers[index].id) ? const Icon(Icons.favorite_rounded, color: Colors.black,)
                                                    : const Icon(Icons.favorite_border_outlined, color: Colors.black,
                                                      )),
                                          );
                                        },
                                      ),
                                      Positioned(
                                        height: h,
                                        bottom: 55,
                                        left: 0,
                                        right: 10,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List<Widget>.generate( 4, (index) {
                                              return Padding(padding: const EdgeInsets.symmetric(horizontal: 3),
                                                child: CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor:
                                                      prodProvider.activePage != index ? Colors.white : Colors.black,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 350),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(40),
                                            child: Container(
                                              height: h * 0.6,
                                              width: double.infinity,
                                              color: Colors.white,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('${allSneakers[index].nickname} Shoe',
                                                          style: appStyle(32, Colors.black, FontWeight.bold),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              allSneakers[index].gender[0].name,
                                                              style: appStyle(20, Colors.grey, FontWeight.bold),
                                                            ),
                                                            const SizedBox(width: 20,),
                                                            RatingBar.builder(
                                                              onRatingUpdate:
                                                                  (value) {
                                                                //print value
                                                              }, 
                                                              initialRating: 3.5, minRating: 1,
                                                              itemCount: 5, itemSize: 25,
                                                              allowHalfRating: true,
                                                              direction: Axis.horizontal,
                                                              itemBuilder: (context, index) {
                                                                return const Icon(Icons.star, color: Colors.black, size: 12,
                                                                );
                                                              },
                                                            ),
                                                            const SizedBox(width: 6,),
                                                            Text('10',style: appStyle(18, Colors.black, FontWeight.bold),),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${allSneakers[index].retailPriceCents.toString()} PK',
                                                              style: appStyle(22, Colors.black, FontWeight.bold),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              'Colors',
                                                              style: appStyle(18, Colors.grey, FontWeight.bold),
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            const CircleAvatar(
                                                              radius: 8,
                                                              backgroundColor:
                                                                  Colors.black,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const CircleAvatar(
                                                              radius: 8,
                                                              backgroundColor:
                                                                  Colors.grey,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 20,),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text('Select a size',
                                                                  style: appStyle(18, Colors.black, FontWeight.bold),),
                                                                const SizedBox(width: 10,),
                                                                Text('View size guide',
                                                                  style: appStyle(15, Colors.grey, FontWeight.bold),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),
                                                            SizedBox(
                                                              width: double.infinity, height: 50,
                                                              child: ListView.builder(
                                                                itemCount: allSneakers.length,
                                                                scrollDirection: Axis.horizontal,
                                                                shrinkWrap: true,
                                                                itemBuilder: (context, index) {

                                                                  bool isSelected = selectedSizeIndex == index;
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      setState(() {
                                                                        selectedSizeIndex = isSelected ? null : index; // Toggle selection
                                                                      });
                                                                    },
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(5.0),
                                                                      child: CircleAvatar(
                                                                        radius: 25,
                                                                        backgroundColor:isSelected? Colors.black:Colors.grey,
                                                                        child: Text(allSneakers[index].sizeRange[index].toString(),
                                                                          style: appStyle(15,Colors.white, FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                           const Divider(
                                                              height: 10,
                                                              endIndent: 10,
                                                              color: Colors.grey,
                                                              indent: 5,
                                                            ),
                                                            const SizedBox(height: 10,),
                                                            Text(allSneakers[index].name,
                                                              style: appStyle(20, Colors.black, FontWeight.bold),
                                                            ),
                                                            Text('${allSneakers[index].name}, ${allSneakers[index].storyHtml.toString()} ',
                                                              style: appStyle(15, Colors.grey, FontWeight.bold),
                                                              maxLines: 3,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: h * 0.05, width: double.infinity,
                                                              child: MaterialButton(
                                                                color: Colors.black,
                                                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                                                onPressed: () {
                                                                  if(cartProvider.ids.contains(allSneakers[index].id)){
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritePage(),));
                                                                  }
                                                                  else {
                                                                    cartProvider
                                                                        .createCart(
                                                                        {
                                                                          'id': allSneakers[index].id,
                                                                          'name': allSneakers[index].nickname,
                                                                          'category': allSneakers[index].gender[0].name,
                                                                          'price': allSneakers[index].retailPriceCents,
                                                                          'sizes': allSneakers[index].sizeRange[0],
                                                                          'imageUrl': allSneakers[index].gridPictureUrl,
                                                                        });
                                                                  }
                                                                  Navigator.pop(
                                                                      context);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Text('Add to Cart',
                                                                  style: appStyle(18, Colors.white, FontWeight.w400),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

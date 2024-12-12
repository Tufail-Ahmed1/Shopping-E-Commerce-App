import 'package:practise_app/packages/packages.dart';
import 'new_shoe.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.h,
    required Future<List<SneakersModel>> maleShoes,
  }): _maleShoes = maleShoes;

  final double h;
  final Future<List<SneakersModel>> _maleShoes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * 0.45,
          child:FutureBuilder<List<SneakersModel>>(
            future: _maleShoes,
            builder: (context, snapshot) {
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

              for (var sneakersModel in sneakers) {
                allSneakers.addAll(sneakersModel.sneakers);
              }
              return ListView.builder(
                itemCount: allSneakers.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final sneaker = allSneakers[index];
                  return GestureDetector(
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage(),));
                    },
                    child: ProductCard(
                      name: sneaker.nickname,
                      id: sneaker.id.toString(),
                      category: sneaker.gender[0].name,
                      price: sneaker.retailPriceCents.toString(),
                      image: sneaker.gridPictureUrl,
                    ),
                  );
                },
              );
            },
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Shoes',
                  style: appStyle(20, Colors.black, FontWeight.bold),
                ),
               const  Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductShowAll(),));
                  },
                  child: Text(
                    'Show all',
                    style:
                    appStyle(17, Colors.black, FontWeight.bold),
                  ),
                ),
                const Icon(Icons.arrow_right,size: 30),
              ],
            ),
            SizedBox(
              height: h * 0.14,
              child: FutureBuilder<List<SneakersModel>>(
                future: _maleShoes,
                builder: (context, snapshot) {
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

                   for (var sneakersModel in sneakers) {
                    allSneakers.addAll(sneakersModel.sneakers);
                   }
                   return ListView.builder(
                    itemCount: allSneakers.length,
                     shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final sneaker = allSneakers[index];

                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage(),));
                        },
                        child: NewShoes(
                          imageUrl: sneaker.gridPictureUrl,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
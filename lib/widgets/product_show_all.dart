import 'package:practise_app/packages/packages.dart';
import 'filter_btm.dart';

class ProductShowAll extends StatefulWidget {
  const ProductShowAll({super.key});

  @override
  State<ProductShowAll> createState() => _ProductShowAllState();
}

class _ProductShowAllState extends State<ProductShowAll> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 3, vsync: this);

  Helper helper = Helper();

  late Future<List<SneakersModel>> _maleShoes;
  late Future<List<SneakersModel>> _femaleShoes;
  late Future<List<SneakersModel>> _kidsShoes;

  void getMale() {
    _maleShoes = helper.getSneakers();
    _femaleShoes=helper.getFemale();
    _kidsShoes=helper.getSneakers();

  }

  @override
  void initState() {
    super.initState();
    getMale();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    final w = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SizedBox(
        child: Stack(
          children: [
          Container(
          height: h * 0.35,
          width: w,
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/addidaslinelogo.png'), fit: BoxFit.fill),
              borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(120, 20),bottomRight: Radius.elliptical(120,20)
          ),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,35,8,0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){ Navigator.pop(context);},
                          icon: const Icon(Icons.close,color: Colors.white,)),
                      const Spacer(),
                      IconButton(
                          onPressed: ()=>filter(),
                          icon: const Icon(Icons.menu,color: Colors.white)),
                    ],
                  ),
                ),
                TabBar(
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appStyle(22, Colors.white, FontWeight.bold),
                    tabs: const [
                      Tab(text: 'Men Shoes'),
                      Tab(text: 'Women Shoes'),
                      Tab(text: 'Kids Shoes'),
                    ]),
              ],
            ),
          ),
            Padding(
              padding: EdgeInsets.only(top: h*0.18,right: 10,left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: TabBarView(
                  controller: _tabController,
                    children: [
                      SizedBox(
                        height: h*0.2,
                        child: ShowAllFuture(maleShoes: _maleShoes),
                      ),
                      SizedBox(
                        height: h*0.2,
                        child: ShowAllFuture(maleShoes: _femaleShoes),
                      ),
                      SizedBox(
                        height: h*0.2,
                        child: ShowAllFuture(maleShoes: _kidsShoes),
                      ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> filter(){
    return showModalBottomSheet(
      backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        barrierColor: Colors.white54,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height*0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const FilterBtm()
          );
        }
    );
  }
}

class ShowAllFuture extends StatelessWidget {
  const ShowAllFuture({
    super.key,
    required Future<List<SneakersModel>> maleShoes,
  }) : _maleShoes = maleShoes;

  final Future<List<SneakersModel>> _maleShoes;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _maleShoes,
        builder: (context, snapshot) {
           if (snapshot.hasData) {
            final sneakers = snapshot.data;
            List<Sneaker> allSneakers = [];
            for (var sneakersModel in sneakers!) {
              allSneakers.addAll(sneakersModel.sneakers);
            }
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: allSneakers.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 240,
                  crossAxisCount: 2,
                  childAspectRatio: 16 / 9,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  final sneaker = allSneakers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const ProductPage(),));
                    },
                    child: ShowAllCard(
                      imageUrl: sneaker.gridPictureUrl,
                      name: sneaker.nickname,
                      price: sneaker.retailPriceCents,
                    ),
                  );
                },
              );
            }
            else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
          return const Center(child: CircularProgressIndicator(),);
        },
    );
  }
}

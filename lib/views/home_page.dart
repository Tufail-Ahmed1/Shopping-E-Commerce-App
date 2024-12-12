import 'package:practise_app/packages/packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  Helper helper = Helper();

  late Future<List<SneakersModel>> _maleShoes;
  late Future<List<SneakersModel>> _femaleShoes;
  late Future<List<SneakersModel>> _kidsShoes;

  void getMale() {
    _maleShoes = helper.getSneakers();
    _femaleShoes = helper.getFemale();
    _kidsShoes = helper.getSneakers();
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
      backgroundColor: const Color(0xffe2e2e2),
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(120, 10),bottomRight: Radius.elliptical(120,10))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Athletic Shoes',
                    style:
                        appStyleWithHt(38, Colors.white, FontWeight.bold, 1.2),
                  ),
                  Text(
                    'Collection',
                    style:
                        appStyleWithHt(38, Colors.white, FontWeight.bold, 1.5),
                  ),
                  TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      tabs: const [
                        Tab(text: 'Men Shoes'),
                        Tab(text: 'Women Shoes'),
                        Tab(text: 'Youth Shoes'),
                      ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.260),
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeWidget(h: h, maleShoes: _maleShoes),
              ),
              HomeWidget(h: h, maleShoes: _femaleShoes),
              HomeWidget(h: h, maleShoes: _kidsShoes),
            ]),
          ),
        ],
      ),
    ));
  }
}

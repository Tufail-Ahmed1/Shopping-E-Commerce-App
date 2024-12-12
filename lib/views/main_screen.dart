import 'package:practise_app/packages/packages.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages=[
       const HomePage(),
       const SearchPage(),
       const FavouritePage(),
       const CartPage(),
      const Profile(),
    ];
    return Consumer<MainScreenProvider>(
      builder: (context, mainProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xffe2e2e2),
          body: pages[mainProvider.pageIndex],
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BtmNavWidget(onTap: (){mainProvider.pageIndex=0;},
                      icon: mainProvider.pageIndex==0? const Icon(Icons.home,color: Colors.white,size: 35,):const Icon(Icons.home_outlined,color: Colors.blueGrey,size: 33,)),
                    BtmNavWidget(onTap: (){mainProvider.pageIndex=1;},
                        icon: mainProvider.pageIndex==1?const Icon(Icons.search,color: Colors.white,size: 35,):const Icon(Icons.search,color: Colors.blueGrey,size: 33,)),
                    BtmNavWidget(onTap: (){mainProvider.pageIndex=2;},
                        icon: mainProvider.pageIndex==2?const Icon(Icons.favorite_rounded,color: Colors.white,size: 35,):const Icon(Icons.favorite_border_outlined,color: Colors.blueGrey,size: 33,)),
                    BtmNavWidget(onTap: (){mainProvider.pageIndex=3;},
                        icon: mainProvider.pageIndex==3?const Icon(Icons.add_shopping_cart,color: Colors.white,size: 35,):const Icon(Icons.add_shopping_cart_outlined,color: Colors.blueGrey,size: 33,)),
                    BtmNavWidget(onTap: (){mainProvider.pageIndex=4;},
                        icon: mainProvider.pageIndex==4?const Icon(Icons.perm_identity,color: Colors.white,size: 35,):const Icon(Icons.perm_identity_outlined,color: Colors.blueGrey,size: 33,)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}






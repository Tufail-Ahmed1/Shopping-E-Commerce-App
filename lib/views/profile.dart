import 'package:practise_app/packages/packages.dart';

class Profile extends StatelessWidget {
   const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      appBar: AppBar(
        backgroundColor: const Color(0xffe2e2e2),
        leading: const Icon(Icons.qr_code_scanner),
        actions: [
          Text('Pakistan |',style: appStyle(18, Colors.black, FontWeight.bold),),
          const SizedBox(
           width: 5,
          ),
          const Icon(Icons.settings),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('assets/ik.png'),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello, Tufail',style: appStyle(12, Colors.black, FontWeight.bold),),
                          Text('tufailmallah39@gmail.com',style: appStyle(12, Colors.black, FontWeight.bold),),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                       onTap: (){},
                        child: const Icon(Icons.login),
                      ),
                    ],
                  ),
                ),
               const SizedBox(height: 20,),
                Container(
                  height: 180,width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        ListTileProfile(
                          title: 'My Orders',
                          icon: const Icon(Icons.burst_mode_sharp),
                          onTap: (){},
                        ),
                        ListTileProfile(
                          title: 'My Favourites',
                          icon: const Icon(Icons.favorite_border),
                          onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritePage(),));
                          },
                        ),
                        ListTileProfile(
                          title: 'Cart',
                          icon: const Icon(Icons.shopping_bag),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(),));
                          },
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 10,),
                Container(
                    height: 130,width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        ListTileProfile(
                          title: 'Coupons',
                          icon: const Icon(Icons.badge_outlined),
                          onTap: (){},
                        ),
                        ListTileProfile(
                          title: 'My Store',
                          icon: const Icon(Icons.shopify),
                          onTap: (){},
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 10,),
                Container(
                    height: 170,width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        ListTileProfile(
                          title: 'Shipping Address',
                          icon: const Icon(Icons.location_on_outlined),
                          onTap: (){},
                        ),
                        ListTileProfile(
                          title: 'Settings',
                          icon: const Icon(Icons.settings),
                          onTap: (){},
                        ),
                        ListTileProfile(
                          title: 'Log out',
                          icon: const Icon(Icons.logout),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({
    super.key, required this.title, required this.icon, required this.onTap,
  });
  final String title;
  final Widget icon;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title,style: appStyle(15, Colors.black, FontWeight.w400),),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}

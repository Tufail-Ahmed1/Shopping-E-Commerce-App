import 'package:practise_app/packages/packages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    final w = MediaQuery.of(context).size.width * 1;
    final cartProvider=Provider.of<CartProvider>(context,listen: true);
    cartProvider.getCartData();

    return Scaffold(
      backgroundColor:const Color(0xffe2e2e2),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h*0.05,),
                Text('My Cart',style: appStyle(32, Colors.black, FontWeight.bold),),
                SizedBox(height: h*0.01,),
                SizedBox(
                  height: h*0.62,
                  child: ListView.builder(
                    itemCount: cartProvider.cart.length,
                    itemBuilder: (context, index) {
                      final data=cartProvider.cart[index];
                      String imageUrl = data['image'] ?? '';
                      if (imageUrl.isEmpty) {
                        imageUrl = 'https://via.placeholder.com/150';
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context){
                                      cartProvider.deleteCart(data['key']);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen(),));
                                    },
                                    backgroundColor: const Color(0xff000000),
                                    foregroundColor: Colors.white,
                                    label: 'Delete',
                                  )
                                ]),
                            child: Container(
                              height: h*0.11,
                              width: w,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        height: 35,width: 35,
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
                                        ),
                                        child: IconButton(
                                          onPressed: (){
                                            cartProvider.deleteCart(data['key']);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen(),));
                                          },
                                          icon: const Icon(Icons.delete,color: Colors.white,size: 20,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: CachedNetworkImage(imageUrl: imageUrl,width: 70,height: 70,fit:BoxFit.fill,),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 3,),
                                      Text('${data['name']} Shoe',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: appStyle(16, Colors.black, FontWeight.bold)),
                                      const SizedBox(height: 5,),
                                      Text('For ${data['category']}',style: appStyle(16, Colors.grey, FontWeight.bold),),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('${data['price']} PK',style: appStyle(16, Colors.black, FontWeight.bold),),
                                          const SizedBox(width: 20,),
                                          Text('Size  ${data['sizes']}',style: appStyle(16, Colors.grey, FontWeight.bold),),
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
                                            child: Consumer<ProductProvider>(
                                              builder: (context, provider, child) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        provider.decrement();
                                                      },
                                                      child: const Icon(Icons.minimize_outlined,size: 20,color: Colors.black),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Text(provider.counter.toString(),style: appStyle(18, Colors.black, FontWeight.bold),),
                                                    GestureDetector(
                                                      onTap: (){
                                                        provider.increment();
                                                      },
                                                      child: const Icon(Icons.add,size: 20,color: Colors.black),
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
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
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: appStyle(20, Colors.black, FontWeight.bold),),
                    Text('${cartProvider.calculateTotal()} Pk',style: appStyle(25, Colors.black, FontWeight.bold),),
                  ],
                ),
               const SizedBox(height: 5,),
                SizedBox(
                  width: double.infinity,
                  height: h*0.06,
                  child: MaterialButton(
                    color: Colors.black,
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: (){},
                    child: Text('Proceed  to  Checkout',style: appStyle(18, Colors.white.withOpacity(0.85), FontWeight.bold),),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

import 'package:practise_app/packages/packages.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.name, required this.id, required this.category, required this.price, required this.image,});
  final String name,id,category,price;
  final String image;
  @override
  State<ProductCard> createState() => _ProductCardState();
}
class _ProductCardState extends State<ProductCard> {
  bool selected =true;
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height*1;
    final w=MediaQuery.of(context).size.height*1;
    final imageUrl= widget.image.isNotEmpty?widget.image:'https://via.placeholder.com/150';
    final favProvider=Provider.of<FavouriteProvider>(context,listen: true);
    favProvider.getFavourite();
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,20,0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: h, width: w*0.38,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: h*0.28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                     // image: DecorationImage(image: NetworkImage(widget.image),fit:BoxFit.cover,),
                    ),
                    child: Center(child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,)),
                  ),
                  Positioned(
                    top: 12,right: 15,
                    child: GestureDetector(
                      onTap: () async {
                        if(favProvider.ids.contains(widget.id)){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouritePage(),));
                        }
                        else
                          {
                            favProvider.createFav(
                              {
                                'id': widget.id,
                                'name': widget.name,
                                'category': widget.category,
                                'price': widget.price,
                                'imageUrl': widget.image,
                              }
                            );
                          }
                        setState(() {

                        });
                      },
                      child: favProvider.ids.contains(widget.id)? const Icon(Icons.favorite_rounded,color: Colors.black,size: 28,):const Icon(Icons.favorite_border_outlined,color: Colors.black,),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.name} Shoe',style: appStyleWithHt(32, Colors.black, FontWeight.bold, 1.1),maxLines: 1,overflow: TextOverflow.visible,),
                    Text('${widget.category} Running',style: appStyleWithHt(18, Colors.grey, FontWeight.bold, 1.5),),
                  ],
                ),
              ),
              SizedBox(height: h*0.01,),
              Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.price} PK',style: appStyle(22, Colors.black, FontWeight.bold),),
                    Row(
                      children: [
                        Text('Color',style: appStyle(20, Colors.grey, FontWeight.bold),),
                        const SizedBox(width: 5,),
                        const CircleAvatar(
                          radius: 8,backgroundColor: Colors.black,
                        ),
                        const SizedBox(width: 5,),
                        const CircleAvatar(
                          radius: 8,backgroundColor: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

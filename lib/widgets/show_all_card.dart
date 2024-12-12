import 'package:practise_app/packages/packages.dart';


class ShowAllCard extends StatelessWidget {
  const ShowAllCard({super.key, required this.imageUrl, required this.name, required this.price});
  final String imageUrl,name;
  final int price;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    final w = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: h*0.15,width: w,
                    color: Colors.white,
                    child: CachedNetworkImage(imageUrl: imageUrl),
                  ),
                  Positioned(
                    top: 10,right: 12,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(Icons.favorite_border_outlined,color: Colors.black,),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              FittedBox(child: Text(name,style: appStyle(20, Colors.black, FontWeight.bold),)),
              FittedBox(child: Text('${price.toString()} PK',style: appStyle(18, Colors.black, FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}

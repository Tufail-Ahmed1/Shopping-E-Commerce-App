import 'package:practise_app/packages/packages.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    final w = MediaQuery.of(context).size.width * 1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h,
        width: w * 0.32,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 0.8,
                spreadRadius: 1,
                offset: Offset(0, 1),
              )
            ]),
        child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,)
      ),
    );
  }
}
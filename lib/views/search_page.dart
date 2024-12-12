import 'package:practise_app/packages/packages.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search=TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff1e1f22),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: search,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Search for a product',
            filled: true,fillColor: Colors.white,
            prefixIcon: const Icon(Icons.camera_alt,),
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/search3D.png'),fit: BoxFit.fitHeight,),
        ),
      ),
    );
  }
}

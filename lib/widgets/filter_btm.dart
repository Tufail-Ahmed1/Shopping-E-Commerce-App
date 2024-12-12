import 'package:practise_app/packages/packages.dart';

class FilterBtm extends StatefulWidget {
  const FilterBtm({super.key});

  @override
  State<FilterBtm> createState() => _FilterBtmState();
}

class _FilterBtmState extends State<FilterBtm> {
  List<String> brand=[
    'assets/addidas.png',
    'assets/jordan.png',
    'assets/nike.png',
    'assets/puma.png',
  ];
  int price=15000;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * 1;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: h*0.2,width: double.infinity,
        child: Column(
          children: [
            Text('Filter',style: appStyleWithHt(30, Colors.black, FontWeight.bold,1.1),),
            const SizedBox(height: 30),
            Text('Gender',style: appStyleWithHt(20, Colors.black, FontWeight.bold,1.1),),
            const SizedBox(height: 10),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Btn(text: 'Men',onPressed: (){},colour: Colors.black,),
               Btn(text: 'Women',onPressed: (){},colour: Colors.grey,),
               Btn(text: 'Kids',onPressed: (){},colour: Colors.grey,),
             ],
           ),
            const SizedBox(height: 30),
            Text('Category',style: appStyleWithHt(20, Colors.black, FontWeight.bold,1.1),),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Btn(text: 'Shoes',onPressed: (){},colour: Colors.black,),
                Btn(text: 'Apparels',onPressed: (){},colour: Colors.grey,),
                Btn(text: 'Latest',onPressed: (){},colour: Colors.grey,),
              ],
            ),
            const SizedBox(height: 30,),
            Text('Price',style: appStyleWithHt(20, Colors.black, FontWeight.bold,1.1),),
            const SizedBox(height: 10),
            Text(
              "Selected Price: ${price.toString()} PK",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 500,max: 50000,
              activeColor: Colors.black,
              label: price.toString(),
              divisions: 9,
              autofocus: true,
              inactiveColor: Colors.grey,
              value: price.toDouble(),
              onChanged: (value) {
                setState(() {
                  price=value.round();
                });
              },
            ),
            const SizedBox(height: 30,),
            Text('Brand',style: appStyleWithHt(20, Colors.black, FontWeight.bold,1.1),),
            const SizedBox(height: 10),
            Container(
              height: h*0.15,color: Colors.white,
              child: ListView.builder(
                itemCount: brand.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 55,width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                              image: DecorationImage(image: AssetImage(brand[index]),fit: BoxFit.contain)
                            ),
                          ),
                        ],
                      ),
                    );
                  },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Btn extends StatelessWidget {
  const Btn({
    super.key,required this.text,required this.onPressed,required this.colour
  });
  final String text;
  final VoidCallback onPressed;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        height: 40,
        color: Colors.white,
        focusColor: Colors.white,
        elevation: 5,
        autofocus: true,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPressed,
        child: Text(text,style: appStyleWithHt(18, colour, FontWeight.bold,1.01),),
      ),
    );
  }
}

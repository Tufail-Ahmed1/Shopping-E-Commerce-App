import 'package:practise_app/packages/packages.dart';

TextStyle appStyle(double size,Color color,FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fw);
}

TextStyle appStyleWithHt(double size,Color color,FontWeight fw,ht){
  return GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fw,height: ht);
}

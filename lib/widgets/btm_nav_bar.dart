import 'package:practise_app/packages/packages.dart';

class BtmNavWidget extends StatelessWidget {
  const BtmNavWidget({super.key, required this.icon,required this.onTap});
  final VoidCallback onTap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 36,width: 36,
          child: icon
      ),
    );
  }
}
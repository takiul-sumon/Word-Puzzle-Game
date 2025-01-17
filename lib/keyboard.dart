import 'package:flutter/material.dart';

const Keylist = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['Z','X','C','V','B','N','M',]
];

class KeyBoardView extends StatelessWidget {
  const KeyBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          for(int i=0; i<Keylist.length; i++)
        Row(children: Keylist[i].map((e)=> null).toList();)
        ],
      ),
    );
  }
}
class VirtualKey extends StatelessWidget{
  final String  letter;
  final bool extended;
  final Function(String ) onPress;
  VirtualKey({super.key,required this.letter, required this.extended, required this.onPress})
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: ,style: ElevatedButton.styleFrom(),);
  }

}
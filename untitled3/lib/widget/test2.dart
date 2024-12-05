class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(scrollDirection: Axis.horizontal,itemCount: 4,itemBuilder: (BuildContext context, int index){
      return Container(width: 200,height: 100,decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(20)),child: Column(children: [
        Container(decoration: BoxDecoration(border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(20)),width: 400,height: 300,child:
        Image(image:
        AssetImage("lib/assets/images/Home Photo.png"),width: 400,height: 30,fit:BoxFit.fill ,),),
      ],),);},);
  }
}

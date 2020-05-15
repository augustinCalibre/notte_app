
// import 'package:moor_ffi/database.dart';
import 'package:flutter/material.dart';
// import 'package:note_app/db/notedb.dart';
// import 'package:provider/provider.dart';

class ListeNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration :BoxDecoration(
           color:Theme.of(context).primaryColor,
           image: DecorationImage(
             image:AssetImage('assets/images/note.png'),
             fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(Theme.of(context).accentColor.withOpacity(0.2), BlendMode.darken),),
          
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(90),
            ),
      
    ),
    // child:buildnote(context) ,
       
       );}

      // Widget buildnote(BuildContext context){
      //   final database=Provider.of<AppDatabase>(context);
      //   return StreamBuilder(
      //     stream: database.watchAllNote(),
      //     initialData: [NoteData(description: 'hey',titre: 'HH',date: null,etat:false)],
      //     builder: (context, snapshot){
      //       List<NoteData> note=snapshot.data;
      //       print(note);
      //       if (note.length==0){
      //         return Center(
      //           child:CircularProgressIndicator(),
      //         );
      //       }else{
      //       return  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 2),
      //       scrollDirection: Axis.vertical,
      //       itemCount: note.length, 
      //       itemBuilder: (_,index){
      //         final notes=note[index];
      //         return Padding(
      //        padding:EdgeInsets.only(left: 20,top: 20,right:10),
      //         child:Container(
      //          height: MediaQuery.of(context).size.width*0.4,
         
      //         decoration: BoxDecoration( 
      //     color: Colors.deepOrange,
      //       borderRadius: BorderRadius.only(
      //       topLeft:Radius.circular(30),
      //       bottomRight:Radius.circular(30),
            
      //       ),

      //    ),
      //    child: Column(children: [
      //      Container(
      //        height:MediaQuery.of(context).size.height*0.1,
      //        width: MediaQuery.of(context).size.width,
      //        decoration: BoxDecoration( 
      //      color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //       topLeft:Radius.circular(30),
      //       bottomRight:Radius.circular(30),
      //       ),
      //       ),
      //       child: Center(
      //         child:Text(notes.titre,style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),),
      //       ),
      //      ),
      //      Expanded(child: ClipRRect(
      //        borderRadius: BorderRadius.only(
            
      //       bottomRight:Radius.circular(30),
      //       ),
      //        child:Container(
      //        height:MediaQuery.of(context).size.height*0.1,
      //        width: MediaQuery.of(context).size.width,
      //        decoration: BoxDecoration( 
      //      color:Colors.deepOrange,
      //       borderRadius: BorderRadius.only(
            
      //       bottomRight:Radius.circular(30),
      //       ),
            
      //       ),
      //       child: Column(children: [
      //         Text(notes.description, style:TextStyle(
      //           color: Colors.white,
      //           fontSize: 20,
      //         )),
      //         Expanded(
      //           child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //           IconButton(icon: Icon(Icons.edit, color: Colors.white,),iconSize: 15, onPressed: null,),
      //         IconButton(icon: Icon(Icons.delete, color: Colors.white,),iconSize: 15,onPressed: null,)
      //         ],))
      //       ],),),
      //      ),),
      //    ],),
      //  ))
      //  ;});
      //       }
           
      //     },
      //   );
      // }
}
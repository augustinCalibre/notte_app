import 'package:flutter/material.dart';
import 'package:note_app/class/listnote.dart';
import 'package:note_app/db/notedb.dart';
import 'package:note_app/ui/llistenote.dart';

// import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
   
  DateTime dateTime;
  String titre;
  String description;
  bool choix=false;
  
  NoteData itemNote;
  bool value=false;
  TextEditingController titrecontroller;
  TextEditingController destcontroller;
  bool select = false;
  
  @override
  void initState() {
    super.initState();
    titrecontroller=TextEditingController();
    destcontroller=TextEditingController();s
  }

  hauteur(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  largeur(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: textstyle('Mes Notes', Colors.black, 25, FontWeight.w500),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: textstyle('Pour une nouvelle Experience ', Colors.blueGrey,
                  15, FontWeight.w400)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: textstyle('Les Plus Recentes Note ', Colors.deepOrange,
                  15, FontWeight.w400)),
            
          Container(
            height: hauteur(context) * 0.2,
            child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:notet.length ,
      itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 20,
        width: MediaQuery.of(context).size.width/2,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
        
        child: Column(children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/2,
            
            decoration: BoxDecoration(
          borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10) ),
          color: Theme.of(context).accentColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           Padding(
             padding: EdgeInsets.only(left:13),
             child:  textstyle(notet[index].etat==true ?'En Cours': 'Tache Effectué',Colors.white70,15,FontWeight.w300),
           ),
          SizedBox(height: 10,),
           
           Padding(
             padding: EdgeInsets.only(left:13),
             child:  textstyle(notet[index].titre,Colors.white,18,FontWeight.w600),
           ),
              
            ],
          ),
        ),
        

          
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              child: Container(
              decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),

            ),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(icon: Icon(Icons.edit,color:Colors.white),iconSize: 20,onPressed: null,),
              Padding(
                padding: EdgeInsets.only(right:10),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                textstyle(notet[index].date,Colors.white,15,FontWeight.w300) ,
                Icon(Icons.delete,color: Colors.white,),
              ],),)
            ],)
            ),
                )
          ),
        ],),
        

      );
     },
    ),
          ),
          
          Container(
              height: hauteur(context) * 0.1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textstyle(
                        'Note Actuelle', Colors.black, 20, FontWeight.w700),
                    Container(
                        height: 20,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                    
                        child: Center(
                          child: textstyle('${notet.length}', Colors.white, 10,
                              FontWeight.w900),
                        )),
                  ],
                ),
              )),
          
          Divider(height: 2),
          // SizedBox(height: 5),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: FloatingActionButton(
                        tooltip: 'Nouvelle Note',
                        backgroundColor: Colors.deepOrange,
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            select = !select;
                          });
                        })),
              ],
            ),
          ),
          SizedBox(height: 2),
          select == true ? tool() : news(),
        ],
      ),
    );
  }

  Text textstyle(String text, Color color, double size, FontWeight font) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: font,
        ));
  }

  Widget news() {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
            color: Theme.of(context).primaryColor
          ),
          width: largeur(context),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                textstyle('        Ajouter une Nouvelle note', Colors.white, 20,
                    FontWeight.w500),

                    SizedBox(height:10),
                Expanded(
                    child: Container(
                  
                  child: Column(
                    children: [
                      Container(
                        width: largeur(context),
                        height: hauteur(context) * 0.1,
                        child: Form(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.lerp(
                                  BorderRadius.circular(20),
                                  BorderRadius.circular(5),
                                  0.5)),
                          width: largeur(context),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  'Titre:',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller:titrecontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Le titre de votre Note',
                                      hintStyle:
                                          TextStyle(color: Colors.deepOrange),


                                    ),
                                    onChanged: (String title){
                                      setState(() {
                                        titre=title;
                                        
                                      });

                                    },

                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                      SizedBox(height:8),
                      Container(
                        width: largeur(context),
                        height: hauteur(context) * 0.1,
                        child: Form(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.lerp(
                                  BorderRadius.circular(20),
                                  BorderRadius.circular(5),
                                  0.5)),
                          width: largeur(context),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  'Description:',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                  
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller:destcontroller,
                                    onChanged: (String title){
                                      setState(() {
                                        description=title;
                                        
                                      });

                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Description',
                                      hintStyle:
                                          TextStyle(color: Colors.deepOrange),
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),

                      SizedBox(height:10),
                      Container(
                         decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.lerp(
                                  BorderRadius.circular(20),
                                  BorderRadius.circular(5),
                                  0.5)),
                          width: largeur(context),

                        height: 70,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                textstyle('Date', Colors.blue[400]  ,15, FontWeight.w900),
                                 IconButton(icon: Icon(Icons.calendar_today,color:Colors.deepOrange),onPressed: ()async{
                                   dateTime=await showDatePicker(
                                     context: context,
                                     initialDate: DateTime.now(),
                                     firstDate: DateTime(1980), 
                                     lastDate: DateTime(2050),
                                     
                                     );
                                     
                                 },),
                              ],
                            ),
                            Column(
                              children: [
                                textstyle('important', Colors.blue[400],  15, FontWeight.w900),
                                Checkbox(
                                value: value,
                                onChanged: (newValue){
                                  setState(() {
                                    value=newValue;
                                    }
                                              );
                                },
                                activeColor: Colors.deepOrange,
                                checkColor: Colors.deepOrange.withOpacity(0.4),
                                

                                ),
                              ],
                            ),
                            Column(
                              children: [
                                textstyle('Enregistrer', Colors.blue[400],  15, FontWeight.w400),
                                 IconButton(icon: Icon(Icons.save,color:Colors.deepOrange), onPressed: (){
                                  //  final database =Provider.of<AppDatabase>(context);
                                   setState(() {
                                    print(titre);
                                     print(dateTime);
                                     print(description);
                                     print(value);
                                    AppDatabase().addNote(
                                       NoteData(
                                       titre: titre,
                                       description: description,
                                       date:dateTime,
                                       etat:value,
                                       ),
                                       );
                                        
                                     
                                   });
                                   titrecontroller.clear();
                                   destcontroller.clear();
                                 })
                              ],
                            ),
                           
                            
                            
                            
                            
                          ],


                        )
                      )

                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }

  Widget tool() {
    return Expanded(
      child: Container(
        decoration :BoxDecoration(
           color:Theme.of(context).accentColor,
          
          borderRadius: BorderRadius.only(
            topRight:Radius.circular(500),
           
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(padding:EdgeInsets.only(left:20),
          child:textstyle('vos Notes', Colors.white, 20, FontWeight.w500),),
          SizedBox(height: 15,),
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.only(
            topLeft:Radius.circular(90),
            ),
            child:ListeNote(),
          )),
        ],)
      ),
    );
  }

  

}

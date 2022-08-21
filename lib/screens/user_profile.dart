import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/user_profile_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({ Key? key }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,)
          ,Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               SizedBox(height: 5,),
              Icon(Icons.arrow_back,
              size: 30,),

              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    CircleAvatar(radius: 50, backgroundImage: AssetImage("images/1a.jpeg"),),

                    Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 30, width: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 170, 33),
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.edit,color: Colors.white,size: 15,)),
                  ),]),
              ),

              Icon(Icons.mode_night,
              size: 30,),
               SizedBox(height: 20,),



            ],
          )

       ,SizedBox(height: 30,),

       Text("Mohammed Khamis",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
       SizedBox(height:15),
       Text("MKhamis560@gmail.com",style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
       SizedBox(height:25),
       Container(
         height: 50,
         width: 300,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color: Color.fromARGB(255, 243, 170, 33)
         ),
         child: const Center(
           child: Text("Upgrade to Pro", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
         ),
       ),

        SizedBox(height: 30,),

        Expanded(child: ListView(children: [

          ProfileListItem(
            icon: Icons.privacy_tip_outlined,
            text: "Privacy",
          ),

            ProfileListItem(
            icon: Icons.settings_outlined,
            text: "Setting",
          ),

            ProfileListItem(
            icon: Icons.auto_awesome_outlined,
            text: "Appearance",
          ),

            ProfileListItem(
            icon: Icons.info_outline,
            text: "Help & Support",
          ),

            ProfileListItem(
            icon: Icons.privacy_tip_outlined,
            text: "Add Another Account",
          ),




        ],),),

  ElevatedButton(

            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 243, 170, 33),
              fixedSize: const Size(150, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),

            onPressed: () {},
            child: const Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
          ),


       ],
      ),

    );
  }


}



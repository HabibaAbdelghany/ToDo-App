import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/theme.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = " ";
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),   
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,

      title: Text(
        textAlign: TextAlign.center,

        _payload.toString().split('|')[0],
        style:TextStyle(color: Get.isDarkMode ?Colors.white:darkGreyClr ),

        )
        ),
      body: SafeArea(
        child: Column(
          children: [
                          const  SizedBox(height: 10,),

            Column(children:  [
              Text('Hello, Habiba',
              style: TextStyle(fontSize:26,fontWeight: FontWeight.bold,
              color: Get.isDarkMode ?Colors.white:darkGreyClr 
              ),),
              const  SizedBox(height: 10,),
              Text('You Have A New Reminder',style: 
              TextStyle(fontSize: 15,fontWeight: FontWeight.w300,
              color: Get.isDarkMode? Color.fromARGB(255, 192, 180, 180) :darkGreyClr),),
                            const  SizedBox(height: 10,),

              ],
              ),

          Expanded(child: Container(
padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
margin: const EdgeInsets.symmetric(horizontal: 20,vertical:15),
decoration:BoxDecoration(
  borderRadius: BorderRadius.circular(30),
color: primaryClr) ,
child: SingleChildScrollView(child:
 Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(children:const [
      Icon(Icons.text_format_outlined,
      color: Colors.white,
      size: 30,),
      SizedBox(width: 10,),
Text('Title',
              style: TextStyle(fontSize:26,fontWeight: FontWeight.bold,
              color: Colors.white ,
              ),),
 
                
    ],),
 const SizedBox(height: 10,),
  Text(
        _payload.toString().split('|')[0],
        style:const TextStyle(color: Colors.white ,fontSize: 20),
),



  const  SizedBox(height: 10,),
Row(children:const [
      Icon(Icons.description,
      color: Colors.white,
      size: 30,),
      SizedBox(width: 20,),
Text('Description',
              style: TextStyle(fontSize:26,fontWeight: FontWeight.bold,
              color: Colors.white ,
              ),),

                
    ],),
  const SizedBox(height: 10,),

  Text(
        _payload.toString().split('|')[1],
                  style:const  TextStyle(color: Colors.white,fontSize: 20),

textAlign: TextAlign.justify,),
  const SizedBox(height: 10,),

Row(children:const [
      Icon(Icons.calendar_month_outlined,
      color: Colors.white,
      size: 30,),
      SizedBox(width: 10,),
Text('Date',
              style: TextStyle(fontSize:26,fontWeight: FontWeight.bold,
              color: Colors.white ,
              ),),
 
               
    ],),
 const SizedBox(height: 10,),
 
Text(
        _payload.toString().split('|')[2],
                  style:const TextStyle(color: Colors.white ,fontSize: 20),
),],

),),


          )),
          const  SizedBox(height: 10,),


          ],
        ),
      ),
    );
  }
  
}

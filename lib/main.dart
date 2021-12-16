// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:crypto_tracker/services/api_services.dart';
import 'dart:core';
import 'dart:async';

import 'dart:math' as math;
void main(){
  runApp(CryptoTracker());
}


class CryptoTracker extends StatelessWidget {
  const CryptoTracker({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crypto Tracker",

      debugShowCheckedModeBanner: false,

      home: HomePage(),
      
    );
  }
}






//HomePage 



class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List? all_assets=[];

  List? crypto_currencies=[];
  String cry_name='';

  Future<List>? _ccurr;
  @override

  void initState(){
    super.initState();
    // print("hello");
      _ccurr= APIService.instance.readJson();
      // print(_ccurr);
     toList();

      
  }

  void toList() async{
    // print('tolist');
      List ? data=await _ccurr;
      // print("data= $data");
      setState(() {
        all_assets=data;

      });

     for (int i=0;i<int.parse((all_assets?.length).toString());i++){
         {
          if (all_assets?[i]["type_is_crypto"]==1){
            // print(all_assets?[i]['name']);

            crypto_currencies?.add(all_assets?[i]);


          }
         }}
    }

    
  @override
  Widget build(BuildContext context) {
    // print(_ccurr);
    // print(all_assets);
    return Scaffold(
      
      
      body: Container(
        // color: Colors.red,

        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context ).size.width*1,
              height: MediaQuery.of(context ).size.width*0.03,

              child: DecoratedBox(
                decoration: BoxDecoration(
                  // color: Colors.pink[900],
                ),
                ),
              ),
            
            Container(
              // color: Colors.black,
              width: MediaQuery.of(context ).size.width*1,
              height: MediaQuery.of(context ).size.width*0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                Text(
                  'Crypto Tracker',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context ).size.width*0.057,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  ),
                ],
              ),
            ),

            // Padding(padding: EdgeInsets.only(top:MediaQuery.of(context ).size.width*0.3)),
            
            
            Container(
              margin:EdgeInsets.symmetric(vertical: MediaQuery.of(context ).size.width*0.3),
              // color: Colors.pink[300],
              height: MediaQuery.of(context ).size.width*1.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: crypto_currencies?.length,
                
                itemBuilder: (context , index){
                  
                // if (all_assets?[i]["type_is_crypto"]==0){
                //     print
                // }
                
                  return Card(
                    shadowColor: Colors.black,
                    child: Container(
                      
                      // color: Colors.green,
                      width: MediaQuery.of(context ).size.width*0.7,
                      decoration: BoxDecoration(
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          // offset: Offset.zero,
                          color: Colors.black,
                          blurRadius: 40.0,
                        ),]
                        // border: Border.all()
                        
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            // width:MediaQuery.of(context ).size.width*0.01 ,
                            height:MediaQuery.of(context ).size.width*0.07,
                            
                          ),
                          Text(
                            ((crypto_currencies?[index]['asset_id']).toString()),

                            style: TextStyle(
                              fontSize: MediaQuery.of(context ).size.width*0.05,
                              fontWeight: FontWeight.bold,
                            
                            ),
                          ),
                          Text(
                            crypto_currencies?[index]['name'],

                            style: TextStyle(
                              fontSize: MediaQuery.of(context ).size.width*0.08,
                              fontWeight: FontWeight.bold,
                              
                            ),

                          ),
                          SizedBox(
                            // width:MediaQuery.of(context ).size.width*0.01 ,
                            height:MediaQuery.of(context ).size.width*0.07,
                            
                          ),
                          Text(
                            'Current Price',
                            style:TextStyle(
                              fontSize: MediaQuery.of(context ).size.width*0.05,
                            ),
                          ),
                          Text(
                            ((crypto_currencies?[index]['price_usd']).toString()),

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context ).size.width*0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            // width:MediaQuery.of(context ).size.width*0.01 ,
                            height:MediaQuery.of(context ).size.width*0.07,
                            
                          ),

                          Text(
                            'Total Volume',
                            style:TextStyle(
                              fontSize: MediaQuery.of(context ).size.width*0.05,
                            ),
                          ),
                          Text(
                            ((crypto_currencies?[index]['volume_1mth_usd']).toString()),
                            style:TextStyle(
                              fontSize: MediaQuery.of(context ).size.width*0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // height: MediaQuery.of(context ).size.height*0.1,
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
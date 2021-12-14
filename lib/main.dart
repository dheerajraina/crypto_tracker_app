import 'package:flutter/material.dart';
import 'package:crypto_tracker/services/api_services.dart';
import 'dart:core';
import 'dart:async';
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
    print("hello");
      _ccurr= APIService.instance.readJson();
      // print(_ccurr);
     toList();

      
  }

  void toList() async{
    print('tolist');
      List ? data=await _ccurr;
      // print("data= $data");
      setState(() {
        all_assets=data;

      });

    //  for (int i=0;i<int.parse((all_assets?.length).toString());i++){
    //      {
    //       if (all_assets?[i]["type_is_crypto"]==1){
    //         print(all_assets?[i]['name']);

    //         crypto_currencies?.add(all_assets?[i]);


    //       }
    //      }}
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
              height: MediaQuery.of(context ).size.width*0.1,

              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.pink[900],
                ),
                ),
              ),
            
            Container(
              // color: Colors.black,
              width: MediaQuery.of(context ).size.width*1,
              height: MediaQuery.of(context ).size.width*0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
            Expanded(
              child: ListView.builder(
                
                itemCount: crypto_currencies?.length,
                itemBuilder: (context , index){
                  
                // if (all_assets?[i]["type_is_crypto"]==0){
                //     print
                // }
                
                  return Card(
                    child: ListTile(
                      title: Text(crypto_currencies?[index]['name']),
                    subtitle: Text ((crypto_currencies?[index]['price_usd']).toString()),   
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
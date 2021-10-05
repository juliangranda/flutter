import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  //const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//listen:false es para que no escuche ningun cambio que esta ocurriendo en ese auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
           builder: (BuildContext context , AsyncSnapshot<String> snapshot){

             
            if(!snapshot.hasData)
              return Text('espere');
/*             if( snapshot.data == ''){

            } */
            Future.microtask((){
              Navigator.of(context).pushReplacementNamed('login');
            });
            
            return Container();

              


           }
           )
      ),
    );
  }
}
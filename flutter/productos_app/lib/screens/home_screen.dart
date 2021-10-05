import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
//listen:false evita escuchar los cambios de estado y evita que se redibuje el widget
    final authService = Provider.of<AuthService>(context, listen: false);

    if(productsService.isloading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('productos'),
        //actions para ponerlo en la otra esquina de al lado
        leading: IconButton(
          onPressed: (){
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
        }, 
        icon: Icon(Icons.login_outlined)),
      ),

      //listview builder ,es mejor pq es mas perezoso ,es decir, solo va a crear los widgets cuando se necesiten en la pantalla y no los va a dejar activos solo cuando es necesario 
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: (){
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],
          ))
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

//se crea una nueva instancia de un nuevo producto para que no ponga problema de que tiene valores nulos
            productsService.selectedProduct = new Product(
              available: false,
              name: '',
              price: 0
              );
            Navigator.pushNamed(context, 'product');
          },
        ),
      
    );
  }
}
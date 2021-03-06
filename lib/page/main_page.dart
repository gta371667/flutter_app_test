import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/main_page_bloc.dart';
import 'package:flutter_app/route/bloc_provider.dart';
import 'package:flutter_app/route/my_route.dart';
import 'package:flutter_app/route/route_mixin.dart';
import 'package:flutter_app/route/route_name.dart';
import 'package:flutter_app/tool/discount_shape.dart';

@ARoute(url: RouteName.mainPage)
class MainPage extends StatefulWidget {
  final MyRouteOption option;

  MainPage(this.option) : super();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RouteMixin {
  MainPageBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<MainPageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            children: [
              Material(
                color: Colors.orange,
                shape: DiscountShape(
                  count: 1,
                  radius: Radius.circular(5),
                ),
                child: Align(
                  child: Text("page1"),
                ),
              ),
             Material(
               color: Colors.orange,
               shape: Border.all(),
               child: Align(
                 child: Text("page1"),
               ),
             ),
             FlatButton(
               color: Colors.grey,
               child: Text("page1"),
               onPressed: () {
                 pushPage(RouteName.page1, context);
               },
             ),
             FlatButton(
               color: Colors.grey,
               child: Text("page1"),
               onPressed: () {
                 pushPage(RouteName.page1, context);
               },
             ),
            ],
          ),
        ),
      ),
    );
  }
}

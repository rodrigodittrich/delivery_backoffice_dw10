import '../../core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/styles/colors_app.dart';
import '../template/base_layout.dart';

class HomePage extends StatefulWidget {

  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages  {
   @override
   Widget build(BuildContext context) {
       return BaseLayout(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Login')),
                ),
              ),
              Container(
                color: context.colors.primary,
                child: SizedBox(
                  width: 200,
                  height: 50,
                  //width: context.percentWidth(.5),
                  //height: context.percentHeight(.9),
                  child: ElevatedButton(onPressed: (){}, child: const Text('botão')),
                ),
               ),
            ],
          ),
       );
  }
}
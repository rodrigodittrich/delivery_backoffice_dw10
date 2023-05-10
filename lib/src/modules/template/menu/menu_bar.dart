import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import 'menu_button.dart';
import 'menu_enum.dart';

class MenuBar extends StatefulWidget {

  const MenuBar({ Key? key }) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  Menu? selectedMenu;

   @override
   Widget build(BuildContext context) {
    return Container(  
      width: context.percentHeight(.30),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: (){
          
              }, 
              icon: const Icon(Icons.keyboard_double_arrow_right),
            ),
          ),
          const SizedBox(
              height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Menu.values.length,
            itemBuilder: (context, index) {
              final menu = Menu.values[index];
              return MenuButton(
                menu: menu, 
                menuSelected: selectedMenu,
                onPressed: (menu) {
                  setState(() {
                    selectedMenu = menu;
                  });
                },
              );
            },
          )
        ],
      ),
    );
  }
}
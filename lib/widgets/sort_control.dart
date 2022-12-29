import 'package:flutter/material.dart';

Widget sortControl() {
  return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 100,),
              const Text(
                "Sort by ", style: TextStyle(color: Colors.white60, fontSize: 18),),
              const SizedBox(width: 20,),
              DropdownButton<String>(
                underline: Container(),
                style: const TextStyle(color: Colors.white,),
                iconEnabledColor: Colors.white,
                items: [
                  DropdownMenuItem(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0), child: Text("Duration"),),
                  ),
                ],
                onChanged: (selected) {},
                autofocus: true,
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.view_list, size: 35, color: Colors.white,),
              SizedBox(width: 20,),
              Icon(Icons.view_module, size: 35, color: Colors.white,),
              SizedBox(width: 100,)
            ],
          ),
        ],
      ),
  );
}
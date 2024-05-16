import 'package:flutter/material.dart';

class FilterRecetteList extends StatelessWidget {
  const FilterRecetteList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: const Text(
              "Text_1",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_1"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_1"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: const Text(
              "Text_1",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_1"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_1"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_1"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_2"),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
            ),
            child: const Text("Text_3"),
          )
        ],
      ),
    );
  }
}

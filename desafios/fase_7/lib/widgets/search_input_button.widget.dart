import 'package:flutter/material.dart';

class SearchInputButton extends StatelessWidget {
  const SearchInputButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 10,
            ),
            child: Row(
              children: [
                Image.asset("assets/images/location.png"),
                const Text(
                  "Pesquise aqui",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.mic,
                  color: Colors.grey,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                const CircleAvatar(
                  radius: 17,
                  child: Text("EM"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

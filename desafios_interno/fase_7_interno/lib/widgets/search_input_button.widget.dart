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
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 10,
              top: 5,
              bottom: 5,
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/location.png",
                ),
                const Text(
                  "Pesquise aqui",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.mic,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(
                  width: 20,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 16,
                  child: Text("EM"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

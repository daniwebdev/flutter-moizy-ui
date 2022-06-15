import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String? placeholder;

  const SearchInput({Key? key, this.placeholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50,
      child:  TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: placeholder ?? 'Search',
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

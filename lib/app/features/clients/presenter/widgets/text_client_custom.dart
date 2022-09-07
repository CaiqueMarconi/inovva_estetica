import 'package:flutter/material.dart';
import '../stores/clients_store.dart';

class TextClientCustom extends StatelessWidget {
  final ClientsStore clientsStore;
  final String textSubTitle;
  final String text;
  const TextClientCustom({
    Key? key,
    required this.clientsStore,
    required this.textSubTitle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return RichText(
      text: TextSpan(
        text: '$textSubTitle: ',
        style: TextStyle(
          fontSize: width * 0.015,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: width * 0.013,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

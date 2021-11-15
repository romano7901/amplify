import 'package:flutter/material.dart';

class LoadingViewIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
import 'package:flutter/material.dart';

Widget textHeading(String text,Color color){
return Text(
                    text,
                    textAlign: TextAlign.left,
                    style:  TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: color,
                    ),
                  );
}

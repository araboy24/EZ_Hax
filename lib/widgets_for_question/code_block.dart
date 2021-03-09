import 'package:flutter/material.dart';

class CodeBlock extends StatefulWidget {
  final String code;


  const CodeBlock({this.code});

  @override
  _CodeBlockState createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {

  @override
  Widget build(BuildContext context) {
    String codeWithNewLines = widget.code.replaceAll("\\n", '\n');
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey,
          width: 2,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          codeWithNewLines,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

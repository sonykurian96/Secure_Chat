import 'package:flutter/material.dart';
import '../app_theme.dart';

class BuildChatComposer extends StatefulWidget {
  @override
  _BuildChatComposerState createState() => _BuildChatComposerState();
}

class _BuildChatComposerState extends State<BuildChatComposer> {
  double _inputHeight = 50;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_checkInputHeight);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _checkInputHeight() async {
    int count = _textEditingController.text.split('\n').length;

    if (count == 0 && _inputHeight == 50.0) {
      return;
    }
    if (count <= 5) {  // use a maximum height of 6 rows
      // height values can be adapted based on the font size
      var newHeight = count == 0 ? 50.0 : 28.0 + (count * 18.0);
      setState(() {
        _inputHeight = newHeight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      // height: 150,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              // height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        controller: _textEditingController,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type your message ...',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                    color: Colors.grey[500],
                  ),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: MyTheme.kAccentColor,
            child: Icon(
              Icons.mic,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}




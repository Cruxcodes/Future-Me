import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatResponse extends ConsumerStatefulWidget {
  const ChatResponse({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatResponse> createState() => _ChatResponseState();
}

class _ChatResponseState extends ConsumerState<ChatResponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(

          ),
          child: SpinKitThreeBounce(

          ),
        ),
      ),
    );
  }
}

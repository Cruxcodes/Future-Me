import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components/btn.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 6),
                      color: Color(0xff000000).withOpacity(0.3),
                    ),
                  ]),
              child: SpinKitThreeBounce(
                size: 20,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: BTN(text: "Accept"),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: BTN(text: "Another task list",greyedOut: true),
            ),
          ],
        ),
      ),
    );
  }
}

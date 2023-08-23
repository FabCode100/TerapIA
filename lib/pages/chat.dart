import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topBar(),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                _userMessage(),
                _aiMessage(),
                _userMessage(),
                _aiMessage(),
                _userMessage(),
                _aiMessage(),
              ],
            ),
          ),
          _input(),
        ],
      ),
    );
  }

  Container _input() {
    return Container(
          width: 360,
          height: 75,
          decoration: const BoxDecoration(
            color: Color(0xff333333),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 270,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                  ),
                  child: Text(
                    'Type anything here...',
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.send,
                color: Color(0xffD9D9D9),
              ),
            ],
          ),
        );
  }

  Container _aiMessage() {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
      width: 300,
      height: 125,
      decoration: BoxDecoration(
        color: const Color(0xff6CAEDF),
        borderRadius: BorderRadius.circular(44),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.smart_toy,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Text(
                  'AI message',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 240, top: 50),
            child: Row(
              children: [
                Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.thumb_down_alt_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _userMessage() {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
      width: 300,
      height: 125,
      decoration: BoxDecoration(
        color: const Color(0xff72B340),
        borderRadius: BorderRadius.circular(44),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.account_circle,
                color: Color(0xffFFFFFF),
              ),
            ),
            Text(
              'User message',
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Container _topBar() {
    return Container(
      width: 361,
      height: 75,
      color: const Color(0xff333333),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.menu,
            color: Color(0xffD9D9D9),
          ),
          Text(
            'Conversation’s title',
            style: TextStyle(
                color: Color(0xffD9D9D9),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.add,
            color: Color(0xffD9D9D9),
          )
        ],
      ),
    );
  }
}

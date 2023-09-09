import 'package:flutter/material.dart';
import 'package:frontend/models/terapia.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/constants/api.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Future<List<String>> fetchMessages() async {
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Check if the data is a list
      // ignore: unnecessary_type_check
      if (data is List) {
        final List<String> messages = data
            .map((e) => e['content'] != null ? e['content'].toString() : '')
            .toList();

        return messages;
      } else {
        // Handle the case where the data is not a list as expected
        throw Exception('API response does not contain a list of messages');
      }
    } else {
      // Handle non-200 status codes here, e.g., log an error message
      print('API request failed with status code ${response.statusCode}');
      throw Exception('Failed to load messages');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMessages().then((messages) {
      setState(() {
        _messages = messages;
      });
    });
  }

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int counter = 1;
  Future<void> postData(String message) async {
    final response = await http.post(
      Uri.parse(api),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': counter++,
        'content': message,
        'timestamp': '2023-09-02T02:42:37.816538Z',
        'emotion': 'example',
        'advice': 'example',
        'conversation': 1,
        'sender': 1,
      }),
    );

    if (response.statusCode == 201) {
      // Data was successfully posted
      print('Message saved: $message');
      // Use setState to trigger a rebuild of the widget
      setState(() {
        _messages.add(message);
      });
      _controller.clear(); // Clear the text field

      // Scroll to the latest message
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    } else {
      // Handle errors, e.g., show an error message
      print('Failed to save message: ${response.statusCode}');
    }
  }

  List<String> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversation’s title',
          style: TextStyle(
              color: Color(0xffD9D9D9),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff333333),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.add),
          )
        ],
      ),
      drawer: const NavigationDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44),
                  ),
                  color: const Color(
                      0xff72B340), // Set the background color to blue
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        _messages[index],
                        style:
                            const TextStyle(color: Colors.white), // Text color
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xff333333),
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Type anything here',
                  fillColor: Color(0xffD9D9D9),
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Color(0xff333333))),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: const Color(0xffD9D9D9),
            onPressed: () {
              final message = _controller.text;
              if (message.isNotEmpty) {
                postData(message);
              }
            },
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: const Color(0xff333333),
        child: ListView(
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 185,
                      height: 50,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Color(0xffD9D9D9), width: 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'New Chat',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 55,
                      height: 50,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Color(0xffD9D9D9), width: 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        onPressed: () {},
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Text(
                'Today',
                style: TextStyle(
                    color: Color(0xffCCCCCC),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Text(
                'Yesterday',
                style: TextStyle(
                    color: Color(0xffCCCCCC),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Text(
                'Last 7 days',
                style: TextStyle(
                    color: Color(0xffCCCCCC),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Text(
                'Last 30 days',
                style: TextStyle(
                    color: Color(0xffCCCCCC),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 18,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.messenger_outline_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Divider(
                thickness: 1.8,
                color: Color(0xffD9D9D9),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.account_box,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  Text(
                    'User’s Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: Icon(
                      Icons.settings,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:frontend/pages/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 90),
        const Center(
          child: Text(
            'Sign up',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Color(0XFF333333)),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 29,
                right: 29,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: AutofillHints.nickname,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 32,
                left: 29,
                right: 29,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: AutofillHints.email,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 32,
                left: 29,
                right: 29,
                bottom: 32,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: AutofillHints.password,
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            SizedBox(
              width: 254,
              height: 66,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff72B340))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF)),
                ),
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1.8,
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1.8,
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 41,
            ),
            SizedBox(
              width: 302,
              height: 62,
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Color(0xff333333), width: 1.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                ),
                onPressed: () {},
                child: const Text(
                  'Continue with Google',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

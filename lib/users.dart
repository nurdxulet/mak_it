import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({
    Key? key,
    required this.jsonResponse,
  }) : super(key: key);

  final List jsonResponse;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: jsonResponse.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 80,
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                      height: 80,
                      width: 92,
                      child: const Icon(
                        Icons.person_outline,
                        color: Color(0xffBBBBBD),
                        size: 50,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${jsonResponse[index]['name']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${jsonResponse[index]['email']}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff8A8A8F),
                        ),
                      ),
                      Text(
                        '${jsonResponse[index]['phone']}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

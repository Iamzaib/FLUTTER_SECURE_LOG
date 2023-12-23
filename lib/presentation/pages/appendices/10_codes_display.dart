// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:securelog/presentation/pages/appendices/ten_codes.dart';

class TenCodesDisplay extends StatelessWidget {
  const TenCodesDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10 Codes'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 30,
              ),
              child: Row(
                children: [
                  Text('Codes'),
                  SizedBox(
                    width: 90,
                  ),
                  Text('Meaning')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TenCodes(
              tenCodes: '10-1 ',
            ),
            TenCodes(
              tenCodes: '10-2 ',
            ),
            TenCodes(
              tenCodes: '10-3 ',
            ),
            TenCodes(
              tenCodes: '10-4 ',
            ),
            TenCodes(
              tenCodes: '10-5 ',
            ),
            TenCodes(
              tenCodes: '10-6 ',
            ),
            TenCodes(
              tenCodes: '10-7 ',
            ),
            TenCodes(
              tenCodes: '10-8 ',
            ),
            TenCodes(
              tenCodes: '10-9 ',
            ),
            TenCodes(
              tenCodes: '10-10',
            ),
            TenCodes(
              tenCodes: '10-  ',
            ),
            TenCodes(
              tenCodes: '10-  ',
            ),
            TenCodes(
              tenCodes: '10-  ',
            ),
          ],
        ),
      ),
    );
  }
}

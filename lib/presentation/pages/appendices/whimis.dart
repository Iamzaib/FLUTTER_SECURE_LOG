import 'package:flutter/material.dart';
import 'package:securelog/presentation/pages/appendices/whimis_helper.dart';

import 'appendices_title.dart';

class Whimis extends StatelessWidget {
  const Whimis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WHIMIS'),
      ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              AppendicesTitle(conversionTitle: 'WHIMIS'),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50,
            ),
            child: Column(
              children: [
                WhimisHelper(
                  whimisSymble: 'assets/images/Compressed_gas.png',
                  whimisClass: 'Compressed Gas',
                ),
                WhimisHelper(
                  whimisSymble: 'assets/images/Fire.png',
                  whimisClass: 'Flamable and Combustible Material',
                ),
                WhimisHelper(
                  whimisSymble: 'assets/images/Oxidizing.png',
                  whimisClass: 'Oxidizing Material',
                ),
                // WhimisHelper(
                //   whimisSymble: 'assets/images/skull.png',
                //   whimisClass:
                //       'Material Causing Immediate and Serious Toxic Effect',
                // ),
                WhimisHelper(
                  whimisSymble: 'assets/images/Causing_other toxic_effects.png',
                  whimisClass: 'Material Causing Other Toxic Effects',
                ),
                WhimisHelper(
                  whimisSymble: 'assets/images/Biohazardous.png',
                  whimisClass: 'Biodazardous Infectious Materials',
                ),

                WhimisHelper(
                  whimisSymble: 'assets/images/Corrosive.png',
                  whimisClass: 'Corrosive Material',
                ),
                WhimisHelper(
                  whimisSymble: 'assets/images/Dangerous_reactiove.png',
                  whimisClass: 'Dangerously Reactive Material',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

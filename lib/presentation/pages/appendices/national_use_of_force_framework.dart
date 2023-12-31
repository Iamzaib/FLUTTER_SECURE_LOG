// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'appendices_title.dart';

class NationalForceFramwork extends StatelessWidget {
  const NationalForceFramwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('National Use of Force Framework'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppendicesTitle(
                    conversionTitle: 'National Use of Force Framework'),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/images/UseOfForce.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Container(
              child: const Text(
                'The officer continuosly assesses the situation \n and acts in a reasonable manner to ensure officer and public safety',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: const Text(
                'The Assassment Process',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  'When guards responds to or becomes involed in a situation, they must be prepared to assess the immediate characteristics of the situation. Each of these may become part of the guard\'s assessment process: \n \u2022 The Enviroment \n \u2022 Number of Subjects Involed \n \u2022 Perception of Subject\'s Abilities \n \u2022 Knowledge of a Subject \n \u2022 Time and Distance \n \u2022 Potential Attack Signs',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: const Text(
                'Use of Force Response Options',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Guards Communication',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  'The simple presence or appearance of a guard may have a dramatic impact on a situation and may be percieved as a visible sign of authority. Uniforms and recognized vehicles may change or alter a Subject\'s behavior.',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Effective Communication',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  'An Officer\'s use of vebal and non-verbal (body language) communications can manage or control a Subject\'s behavior.',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Physical Control Options',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  'The model dispays two levels of physical contro options: \nsoft and hard.  \nPhysical control options mean any physical skill utilized to control the actions of a Subject that does not involed the use of a weapon. \n \nSoft control techniques are control based and are not intended or designed to cause injury. Hard control techniques are designed to stop the behavior or actions of the subject and have a probability of injury associated to them.',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Intermediate Weapons',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  'This level of response option involves weapons that are not intended to cause serious injury or death. Impact weapons and aerosols fall under the heading..',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Lethal Force',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  'This level or response option involves the use of any weapon or technique that is intended to or reasonably likely to cause serious bodly harm or death.',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

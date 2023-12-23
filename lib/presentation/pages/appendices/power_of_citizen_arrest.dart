// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'appendices_title.dart';

class PowerOfCitizenArrest extends StatelessWidget {
  const PowerOfCitizenArrest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power of Citizen Arrest'),
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
                AppendicesTitle(conversionTitle: 'Power of Citizen Arrest')
              ],
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
                  'Important Considerations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
                  'Making a citizen\'s arrest without carefully considering the risk factors may have serious unitended consequences for you and others involved. In most cases, an arrest consists of either actually seizing or touching a person\'s body in an effert to datain them. Before deciding whether to make a citizen\'s arrest, you should be aware of the citizen\'s Arrest Lawa and consider the folowwing: \n\n\u2022 Is it feasible for a peace officer to intervene? if so, report the crime to the police instead of taking action on your own. \n\n\u2022 Your personal safety and that of others could be compermised by attempting an arrest. Relevant consideration would include whether the suspect is alone and whether they possess a weapon. \n\n\u2022 Will you be able to turn over the suspect to the police without delay once an arrest is made? \n\n\u2022 Do you have a reasonable belief regading the suspec\'s criminal conduct?',
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
                  '\n If you proceed to the arrest of a person, you should follow thee steps: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: const Text(
                  '\n 1. Tell the suspect plainly that you are making a citizen\'s arrest and that you are holding him or her until police arrive. \n\n 2. Call the police. \n\n 3. Call the security company you work for. \n\n 4. Ask explicitly for his or her cooperation untill police arrive. \n\n 5. Avoid using force, if at all possible, and use it to the minimum possible otherwise. \n\n 6. Do not question or search the suspect or his or her possessions. Your purpose is only to temporarily detain him or her until police arrive. \n\n 7. When police arrive, state in plain facts of what happened. \n\n 8. Fill an incident report in client\'s file',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'For more information on the legal powers, please consult your employee handbook',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

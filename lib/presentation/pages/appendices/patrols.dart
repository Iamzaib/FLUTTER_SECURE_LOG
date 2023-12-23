import 'package:flutter/material.dart';
import 'patrol_container.dart';

import 'appendices_title.dart';

class Patrols extends StatelessWidget {
  const Patrols({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patrols'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const AppendicesTitle(conversionTitle: 'Patrols'),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Purpose of a patrol is to Detect, Deter, and Report.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Detect any unussual activities taking place including safety hazards and security concerns.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Deter any prohibited activities on your site by your presence in uniform.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'When on patrol (interior or exterior) - Check the following.',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Exits', patrolTextA: '- Locker rooms'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Fire equipment',
                    patrolTextA: '- Restricted areas'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Lights', patrolTextA: '- Telephone rooms'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Doors, locks',
                    patrolTextA: '- Boiler roomes'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Windows', patrolTextA: '- Loading area'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Washrooms', patrolTextA: '- Path and walks'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Stairwells', patrolTextA: '- Lobby area'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Parking lots', patrolTextA: '- Elevators'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Roof area', patrolTextA: '- Pool'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Basements', patrolTextA: '- Exercise rooms'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Fire panel room',
                    patrolTextA: '- Gates and fences'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PatrolContainer(
                    patrolText: '- Mechanical rooms', patrolTextA: ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Report all deficiencies in your notebook to forward to management for action taken as soon as possible.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

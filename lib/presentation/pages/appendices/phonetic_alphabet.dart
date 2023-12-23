// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../appendices/phonetic_alphabit_helper.dart';
import 'appendices_title.dart';

class PhoneticAlphabit extends StatelessWidget {
  const PhoneticAlphabit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phonetic alphabit'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const AppendicesTitle(conversionTitle: 'Phonectic Alphabet'),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhoneticAlphabetHelper(
                    phoneticAlphabet: 'A',
                    phoneticSound: 'ALPHA',
                    phoneticAlphabetTwo: 'N',
                    phoneticSoundTwo: 'NOVEMBER',
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'B',
                  phoneticSound: 'BRAVO',
                  phoneticAlphabetTwo: 'O',
                  phoneticSoundTwo: 'OSCAR',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'C',
                  phoneticSound: 'CHARLIE',
                  phoneticAlphabetTwo: 'P',
                  phoneticSoundTwo: 'PAPA',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'D',
                  phoneticSound: 'DELTA',
                  phoneticAlphabetTwo: 'O',
                  phoneticSoundTwo: 'OSCAR',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'E',
                  phoneticSound: 'ECHO',
                  phoneticAlphabetTwo: 'R',
                  phoneticSoundTwo: 'ROMEO',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'F',
                  phoneticSound: 'FOX-TROT',
                  phoneticAlphabetTwo: 'S',
                  phoneticSoundTwo: 'SIERRO',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'G',
                  phoneticSound: 'GULF',
                  phoneticAlphabetTwo: 'T',
                  phoneticSoundTwo: 'TANGO',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'H',
                  phoneticSound: 'HOTEL',
                  phoneticAlphabetTwo: 'U',
                  phoneticSoundTwo: 'UNIFORM',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'I',
                  phoneticSound: 'INDIA',
                  phoneticAlphabetTwo: 'V',
                  phoneticSoundTwo: 'VICTOR',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'J',
                  phoneticSound: 'JULIET',
                  phoneticAlphabetTwo: 'W',
                  phoneticSoundTwo: 'WHISKEY',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'K',
                  phoneticSound: 'KILO',
                  phoneticAlphabetTwo: 'X',
                  phoneticSoundTwo: 'XRAY',
                ),
              ],
            ),
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneticAlphabetHelper(
                  phoneticAlphabet: 'L',
                  phoneticSound: 'LIMA',
                  phoneticAlphabetTwo: 'Y',
                  phoneticSoundTwo: 'YANKEE',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1),
                    left: BorderSide(
                      width: 1,
                    ),
                    bottom: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                child: const Text(
                  'M',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1),
                    left: BorderSide(
                      width: 1,
                    ),
                    bottom: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    'MIKE',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1),
                    left: BorderSide(
                      width: 1,
                    ),
                    bottom: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                child: const Text(
                  'Z',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1),
                    left: BorderSide(
                      width: 1,
                    ),
                    right: BorderSide(
                      width: 1,
                    ),
                    bottom: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    'ZUKU',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

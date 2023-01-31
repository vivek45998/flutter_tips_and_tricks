import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ctrl/prctice_page_ctrl.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  var ctrl = Get.put(PracticePageCtrl());

  @override
  Widget build(BuildContext context) {
    return GetX<PracticePageCtrl>(
      builder: (ctrl) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    ctrl.canonicalizedMaps();
                  },
                  child: const Text("check_canonicalized"),
                ),
                InkWell(
                  onTap: () {
                    ctrl.generatorMainFunction(5);
                  },
                  child: const Text("generate Function"),
                ),
                Text("value=${ctrl.generateValue.value}"),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    ctrl.streamGeneratorFunction();
                  },
                  child: const Text("stream generateFunction"),
                ),
                Text("streamGenerateValue==${ctrl.streamGenerateValue.value}"),
                InkWell(
                    onTap: () {
                      ctrl.identicalFunction();
                    },
                    child: const Text("Identical object")),
                InkWell(
                    onTap: () {
                      ctrl.breakingString();
                    },
                    child: const Text("Breaking String"))
              ],
            ),
          ),
        );
      },
    );
  }
}

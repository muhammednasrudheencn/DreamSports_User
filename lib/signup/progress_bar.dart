import 'package:flutter/material.dart';

class SteperScreen extends StatefulWidget {
  const SteperScreen({super.key});

  @override
  State<SteperScreen> createState() => _SteperScreenState();
}

int currentstep = 0;

class _SteperScreenState extends State<SteperScreen> {
  final phonecontroller = TextEditingController();

  continuestep() {
    if (currentstep < 2) {
      setState(() {
        currentstep = currentstep + 1;
      });
    }
  }

  cancelstep() {
    if (currentstep > 0) {
      setState(() {
        currentstep = currentstep - 1;
      });
    }
  }

  ontapstep(int value) {
    setState(() {
      currentstep = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          currentStep: currentstep,
          onStepContinue: continuestep,
          onStepTapped: ontapstep,
          controlsBuilder: (context, controller) {
            return const SizedBox.shrink();
          },
          elevation: 0,
          type: StepperType.horizontal,
          steps: [
            Step(
                title: const Text(''),
                isActive: currentstep >= 0,
                state:
                    currentstep >= 0 ? StepState.complete : StepState.disabled,
                content: const Column(
                  children: [],
                )),
            Step(
                title: const Text(''),
                isActive: currentstep >= 1,
                state:
                    currentstep >= 1 ? StepState.complete : StepState.disabled,
                content: const Column(
                  children: [],
                )),
            Step(
                title: const Text(''),
                isActive: currentstep >= 2,
                state:
                    currentstep >= 2 ? StepState.complete : StepState.disabled,
                content: const Column(
                  children: [],
                )),
            // Step(
            //     title: const Text(''),
            //     isActive: currentstep >= 3,
            //     state:
            //         currentstep >= 3 ? StepState.complete : StepState.disabled,
            //     content: const Column(
            //       children: [],
            //     ))
          ],
        ),
      ),
    );
  }
}

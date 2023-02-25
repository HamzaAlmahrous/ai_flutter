import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/text_detector/presentation/bloc/text_detector_bloc.dart';
import '/features/text_detector/presentation/bloc/text_detector_events.dart';
import '/features/text_detector/presentation/bloc/text_detector_states.dart';
import '/features/text_detector/presentation/widgets/text_detector_dialog.dart';
import '/features/text_detector/presentation/widgets/text_detector_card.dart';
import '/core/services/service_locator.dart';

// ignore: must_be_immutable
class TextPositivityPage extends StatelessWidget {
  TextPositivityPage({super.key});

  late double height;
  late double width;
  List<Widget> textList = [];

  static const String routeName = 'TextPositivityHomePage';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return BlocProvider(
        create: (BuildContext context) => sl<TextDetectorBloc>()..add(AddExampleEvent()),
        child: BlocBuilder<TextDetectorBloc, TextDetectorState>(
            builder: (context, state) {
              if(state is AddExampleSuccessState){
                textList.add(TextDetectorCard(height: height, width: width, color: Colors.red, text: "this movie was a waste of time"));
                textList.add(TextDetectorCard(height: height, width: width, color: Colors.green, text: "I LOVE YOU"));
              }
          return Stack(
            children: [
              ListView.builder(
                itemCount: textList.length,
                itemBuilder: (_, index) {
                  return textList[index];
                },
              ),
              Container(
                margin: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      child: const Icon(Icons.add, size: 30.0),
                      onPressed: () {
                        dialogBuilder(context).then((value) {
                          if (value != null) {
                            BlocProvider.of<TextDetectorBloc>(context).add(DetectTextPositivityEvent(text: value));
                          }
                        });
                      }),
                ),
              ),
              BlocListener<TextDetectorBloc, TextDetectorState>(
                listener: (context, state) {
                  if (state is DetectTextPositivitySuccessState) {
                    textList.add(TextDetectorCard(
                        height: height,
                        width: width,
                        color: state.result == 1 ? Colors.green : Colors.red,
                        text: state.rawText),
                      );
                  }
                },
                child: Container(),
              ),
            ],
          );
        }),
      );
    });
  }
}

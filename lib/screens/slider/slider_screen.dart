import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';


class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  @override
  Widget build(BuildContext context) {

    // final sliderProvider = Provider.of<SliderProvider>(context,listen: false);

    return Scaffold(
      body: Consumer<SliderProvider>(
          builder: (context,value, child){
            print('Only this call');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                    min: 0,
                    max: 1,
                    value: value.value,
                    onChanged: (val){

                      value.setSliderValue(val);

                    }
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(value.value)
                        ),
                        child: const Center(
                          child: Text('Container 1'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration:  BoxDecoration(
                            color: Colors.red.withOpacity(value.value)
                        ),
                        child: const Center(
                          child: Text('Container 2'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
      ),

    );
  }
}

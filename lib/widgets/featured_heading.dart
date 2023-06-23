import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final screenSize;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child:screenSize.width<800?Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Featured',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color:Color(0xFF077bd7)
                  ),
                ),
                    SizedBox(height: 5,),
                       Text(
                        'Clue of the wooden cottage',
                        textAlign: TextAlign.end,
                      ),
                    
            ],
          ),
          Expanded(child: Container())
        ],
      ):  Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text(
              'Featured',
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF077bd7)
              ),
            ),
                Expanded(
                  child: Text(
                    'Wonder of Sri Lanka',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
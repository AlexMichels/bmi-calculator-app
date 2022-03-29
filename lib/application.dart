import 'dart:math';

class ApplicationBrain{
 
  ApplicationBrain({required this.weight, required this.height}){bmiCalculation();}

  final int height;
  final int weight;
  late double _bmi;
  
  String bmiCalculation(){
   _bmi = weight / pow(height/100, 2);
   return _bmi.toStringAsFixed(1);
  }

String getWeightstatus(){
  if (_bmi > 30){return 'overweight';}
  else if (_bmi > 25){return 'slightly overweight'; }
  else if(_bmi >20){return 'normal weight';}
  else {return 'underweight';}

}

String getRecommendation(){
  if (_bmi > 30){return 'You should start eating half than before';}
  else if (_bmi > 25){return 'how about Intermitted Fasting? Do you like to dring fruit juices?'; }
  else if(_bmi >20){return 'Keep going! Everthing fine';}
  else {return 'Try some weightgainer and set alarm to eat more regularly';}
  
}

}
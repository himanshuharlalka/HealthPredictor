import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_preprocessing/ml_preprocessing.dart';

void main() async {
  final rawCsvContent =
      await rootBundle.loadString('assets/datasets/Height_Arm.csv');
  final samples = DataFrame.fromRawCsv(rawCsvContent);
  final targetName = 'arm-length';
  samples.shuffle();
  final splits = splitData(samples, [0.8]);
  final trainData = splits[0];
  final testData = splits[1];
  final model = LinearRegressor.lasso(
    samples,
    targetName,
    iterationLimit: 90,
  );
  final error = model.assess(testData, MetricType.mape);

  print(error);
  await model.saveAsJson('armlength_model.json');

  final file = File('armlength_model.json');
   final encodedModel = await file.readAsString();
final model1 = LinearRegressor.fromJson(encodedModel);
final unlabelledData = await fromCsv('some_unlabelled_data.csv');
final prediction = model.predict(unlabelledData);
}

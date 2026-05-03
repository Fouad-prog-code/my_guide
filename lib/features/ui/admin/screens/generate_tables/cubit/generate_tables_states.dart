import 'package:my_guide/domain/entities/response/generate_tables/generate_tables_responset.dart';

abstract class GenerateTablesStates {}

class GenerateTablesinitStates extends GenerateTablesStates {}

class GenerateTablesLoadingStates extends GenerateTablesStates {}

class GenerateTablesErrorStates extends GenerateTablesStates {
  final String message;
  GenerateTablesErrorStates({required this.message});
}

class GenerateTablesSuccessStates extends GenerateTablesStates {
  GenerateTablesResponse generateTablesResponse;

  GenerateTablesSuccessStates({required this.generateTablesResponse});
}

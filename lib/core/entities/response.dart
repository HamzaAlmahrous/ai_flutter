import 'package:equatable/equatable.dart';

class Response extends Equatable{

  final String? statusMessage;
  final int? statusCode;
  final bool? success;

  const Response({required this.statusCode, required this.statusMessage, required this.success});

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
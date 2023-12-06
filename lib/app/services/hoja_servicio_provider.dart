import 'package:flutter/material.dart';
import 'package:proyecto_final/app/models/orden.dart';
import 'package:proyecto_final/app/repository/orden_repository.dart';

class HojaProvider with ChangeNotifier {
  final OrdenRepository _ordenRepository = OrdenRepository();

  List<OrdenData> _ordenList = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<OrdenData> get ordenList => _ordenList;

  Future<void> fetchOrdenLista() async {
    try {
      _isLoading = true;
      notifyListeners();

      _ordenList = await _ordenRepository.getAllOrden();
    } catch (error) {
      fetchOrdenLista();
      // Manejar el error según tus necesidades
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

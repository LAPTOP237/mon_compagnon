import 'package:flutter/material.dart';
import 'package:mon_compagnon/viewmodels/chambre_view_model.dart';
import 'package:provider/provider.dart';

class ChambreAddPage extends StatelessWidget {
  const ChambreAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
        leading: const Icon(
          // Icons.logout,
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          'Ajouter une Chambre',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ChambreViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Image.file(
                  //   File(viewModel.room.imageUrl),
                  //   height: 200,
                  // ),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        viewModel.room.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: viewModel.pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Ajouter une image',
                        style: TextStyle(color: Colors.white)),
                  ),
                  _buildTextField(
                    context,
                    label: 'Nom',
                    initialValue: viewModel.room.nom,
                    onChanged: viewModel.setNom,
                  ),
                  _buildTextField(
                    context,
                    label: 'Description',
                    initialValue: viewModel.room.description,
                    onChanged: viewModel.setDescription,
                  ),
                  _buildTextField(
                    context,
                    label: 'Prix',
                    initialValue: viewModel.room.prix.toString(),
                    onChanged: viewModel.setPrix,
                    keyboardType: TextInputType.number,
                  ),
                  _buildDropdownField(
                    context,
                    label: 'Niveau',
                    value: viewModel.room.niveau,
                    items: List.generate(10, (index) => index),
                    onChanged: viewModel.setNiveau,
                  ),
                  _buildCheckbox(
                    context,
                    label: 'Équipé',
                    value: viewModel.room.estEquipe,
                    onChanged: viewModel.toggleEstEquipe,
                  ),
                  _buildCheckbox(
                    context,
                    label: 'Libre',
                    value: viewModel.room.estLibre,
                    onChanged: viewModel.toggleEstLibre,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.saveRoom,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Enregistrer',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required String initialValue,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(labelText: label),
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: const TextStyle(
              color: Color.fromRGBO(61, 48, 162, 1),
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDropdownField<T>(
    BuildContext context, {
    required String label,
    required T value,
    required List<T> items,
    required Function(T) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          onChanged: (T? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString(),
                  style: const TextStyle(
                      color: Color.fromRGBO(61, 48, 162, 1),
                      fontWeight: FontWeight.bold)),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
    BuildContext context, {
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
          ),
          Text(label,
              style: const TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

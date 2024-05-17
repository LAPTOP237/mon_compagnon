import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mon_compagnon/viewmodels/chambre_view_model.dart';
import 'package:provider/provider.dart';

class ChambreDetailPage extends StatelessWidget {
  const ChambreDetailPage({super.key});

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
          'Detail de la Chambre',
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
                  if (viewModel.room.imageUrl != null)
                    // Image.file(
                    //   File(viewModel.cite.imageUrl),
                    //   height: 200,
                    // ),
                    Card(
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                          viewModel.room.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (viewModel.isEditing)
                    ElevatedButton(
                      onPressed: viewModel.pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                      ),
                      child: const Text('Changer l\'image',
                          style: TextStyle(color: Colors.white)),
                    ),
                  _buildTextField(
                    context,
                    label: 'Nom',
                    value: viewModel.room.nom,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setNom,
                  ),
                  _buildTextField(
                    context,
                    label: 'Description',
                    value: viewModel.room.description,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setDescription,
                  ),
                  _buildTextField(
                    context,
                    label: 'Prix',
                    value: viewModel.room.prix.toString(),
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setPrix,
                    keyboardType: TextInputType.number,
                  ),
                  _buildDropdownField(
                    context,
                    label: 'Niveau',
                    value: viewModel.room.niveau,
                    items: List.generate(10, (index) => index),
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setNiveau,
                  ),
                  _buildCheckbox(
                    context,
                    label: 'Équipé',
                    value: viewModel.room.estEquipe,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.toggleEstEquipe,
                  ),
                  _buildCheckbox(
                    context,
                    label: 'Libre',
                    value: viewModel.room.estLibre,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.toggleEstLibre,
                  ),
                  SizedBox(height: 20),
                  if (!viewModel.isEditing) ...[
                    ElevatedButton(
                      onPressed: viewModel.toggleEditing,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                      ),
                      child: const Text('Modifier',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          _showDeleteConfirmation(context, viewModel),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Supprimer',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: viewModel.saveRoom,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                      ),
                      child: const Text('Enregistrer',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: viewModel.cancelEdit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Annuler',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
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
    required String value,
    required bool enabled,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(labelText: label),
          enabled: enabled,
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
    required bool enabled,
    required Function(T) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          onChanged: enabled
              ? (T? newValue) {
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                }
              : null,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
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
    required bool enabled,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: enabled
                ? (bool? newValue) {
                    if (newValue != null) {
                      onChanged(newValue);
                    }
                  }
                : null,
          ),
          Text(label,
              style: const TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
      BuildContext context, ChambreViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmer la suppression'),
          content:
              const Text('Êtes-vous sûr de vouloir supprimer cette Chambre ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
              ),
              child:
                  const Text('Annuler', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => viewModel.deleteRoom(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Supprimer',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

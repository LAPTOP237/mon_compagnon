import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mon_compagnon/viewmodels/cite_view_model.dart';
import 'package:provider/provider.dart';

class CiteDetailPage extends StatelessWidget {
  const CiteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(61, 48, 162, 1),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: const Icon(
            Icons.bedroom_parent_outlined,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
        leading: const Icon(
          // Icons.logout,
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          'Detail de la Cité',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<CiteViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (viewModel.cite.imageUrl != null)
                    // Image.file(
                    //   File(viewModel.cite.imageUrl),
                    //   height: 200,
                    // ),
                    Card(
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                          viewModel.cite.imageUrl,
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
                    value: viewModel.cite.nom,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setName,
                  ),
                  _buildTextField(
                    context,
                    label: 'Description',
                    value: viewModel.cite.description,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setDescription,
                  ),
                  _buildTextField(
                    context,
                    label: 'Lieu',
                    value: viewModel.cite.lieu,
                    enabled: viewModel.isEditing,
                    onChanged: viewModel.setPlace,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await viewModel.setLocation();
                    },
                    child: AbsorbPointer(
                      child: _buildTextField(
                        context,
                        label: 'Localisation (Maps)',
                        value: viewModel.cite.localisation,
                        onChanged: null,
                        enabled: viewModel.isEditing,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      onPressed: viewModel.saveCity,
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
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(labelText: label),
          enabled: enabled,
          onChanged: onChanged,
          style: const TextStyle(
              color: Color.fromRGBO(61, 48, 162, 1),
              fontWeight: FontWeight.bold)),
    );
  }

  void _showDeleteConfirmation(BuildContext context, CiteViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmer la suppression'),
          content:
              const Text('Êtes-vous sûr de vouloir supprimer cette cité ?'),
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
              onPressed: () => viewModel.deleteCity(context),
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

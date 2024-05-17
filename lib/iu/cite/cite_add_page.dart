import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mon_compagnon/viewmodels/cite_view_model.dart';
import 'package:provider/provider.dart';

class CiteAddPage extends StatelessWidget {
  const CiteAddPage({super.key});

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
          'Ajouter une Cité',
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
                    initialValue: viewModel.cite.nom,
                    onChanged: viewModel.setName,
                  ),
                  _buildTextField(
                    context,
                    label: 'Description',
                    initialValue: viewModel.cite.description,
                    onChanged: viewModel.setDescription,
                  ),
                  _buildTextField(
                    context,
                    label: 'Lieu',
                    initialValue: viewModel.cite.lieu,
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
                        initialValue: viewModel.cite.localisation,
                        onChanged: null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.saveCity,
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
}

Widget _buildTextField(
  BuildContext context, {
  required String label,
  required String initialValue,
  required Function(String)? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(labelText: label),
        onChanged: onChanged,
        style: const TextStyle(
            color: Color.fromRGBO(61, 48, 162, 1),
            fontWeight: FontWeight.bold)),
  );
}

import 'package:flutter/material.dart';
import 'package:mon_compagnon/viewmodels/validation_request_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ValidationRequestPage extends StatelessWidget {
  const ValidationRequestPage({super.key});

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
          'Demande de validation de compte',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ValidationRequestViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildTextField(
                    context,
                    label: 'Nom complet',
                    value: viewModel.request.fullName,
                    onChanged: viewModel.setFullName,
                  ),
                  _buildDateField(
                    context,
                    label: 'Date de naissance',
                    value: viewModel.request.dateOfBirth,
                    onChanged: viewModel.setDateOfBirth,
                  ),
                  ElevatedButton(
                    onPressed: viewModel.pickFrontCniImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Télécharger la photo avant de la CNI',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        viewModel.request.frontCniImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: viewModel.pickBackCniImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Télécharger la photo arrière de la CNI',
                        style: TextStyle(color: Colors.white)),
                  ),
                  // Image.file(
                  //   File(viewModel.request.backCniImage!),
                  //   height: 100,
                  // ),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        viewModel.request.backCniImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SwitchListTile(
                    title: const Text('Responsable de cité'),
                    value: viewModel.request.isCityManager,
                    onChanged: viewModel.setIsCityManager,
                  ),
                  if (viewModel.request.isCityManager)
                    ElevatedButton(
                      onPressed: viewModel.pickCityDocument,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                      ),
                      child: const Text('Télécharger le document de la Cité',
                          style: TextStyle(color: Colors.white)),
                    ),
                  // Image.file(
                  //   File(viewModel.request.cityDocument!),
                  //   height: 100,
                  // ),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        viewModel.request.cityDocument,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.submitRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Soumettre',
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
    required String value,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(labelText: label),
          onChanged: onChanged,
          style: const TextStyle(
              color: Color.fromRGBO(61, 48, 162, 1),
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDateField(
    BuildContext context, {
    required String label,
    required DateTime value,
    required Function(DateTime) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: value,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            onChanged(pickedDate);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(labelText: label),
          child: Text(DateFormat('dd/MM/yyyy').format(value),
              style: const TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mon_compagnon/viewmodels/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          'PROFIL',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.logout,
                // Icons.settings_outlined,
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage(viewModel.profile.profileImageUrl),
                    child: viewModel.profile.isVerified
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                // Implement action for verified badge click
                              },
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.verified_user_outlined,
                                    color: Colors.green, size: 24),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                  const SizedBox(height: 16.0),
                  _buildProfileTextField(
                    context,
                    label: 'Nom Complet',
                    initialValue: viewModel.profile.fullName,
                    enabled: viewModel.isEditMode,
                    onChanged: viewModel.setFullName,
                  ),
                  _buildProfileTextField(
                    context,
                    label: 'Email',
                    initialValue: viewModel.profile.email,
                    enabled: viewModel.isEditMode,
                    onChanged: viewModel.setEmail,
                  ),
                  _buildProfileTextField(
                    context,
                    label: 'Téléphone WhatsApp',
                    initialValue: viewModel.profile.whatsapp,
                    enabled: viewModel.isEditMode,
                    onChanged: viewModel.setWhatsapp,
                  ),
                  _buildProfileTextField(
                    context,
                    label: 'Contact',
                    initialValue: viewModel.profile.contact,
                    enabled: viewModel.isEditMode,
                    onChanged: viewModel.setContact,
                  ),
                  _buildProfileTextField(
                    context,
                    label: 'Login',
                    initialValue: viewModel.profile.login,
                    enabled: viewModel.isEditMode,
                    onChanged: viewModel.setLogin,
                  ),
                  _buildProfileTextField(
                    context,
                    label: 'Password',
                    initialValue: viewModel.profile.password,
                    enabled: viewModel.isEditMode,
                    onChanged: viewModel.setPassword,
                    obscureText: true,
                  ),
                  if (viewModel.isEditMode)
                    Column(
                      children: [
                        _buildProfileTextField(
                          context,
                          label: 'Ancien mot de passe',
                          initialValue: viewModel.oldPassword,
                          enabled: viewModel.isEditMode,
                          onChanged: viewModel.setOldPassword,
                          obscureText: true,
                        ),
                        _buildProfileTextField(
                          context,
                          label: 'Confirmer mot de passe',
                          initialValue: viewModel.confirmPassword,
                          enabled: viewModel.isEditMode,
                          onChanged: viewModel.setConfirmPassword,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: viewModel.cancelChanges,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text('Annuler',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            ElevatedButton(
                              onPressed: viewModel.saveChanges,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(61, 48, 162, 1),
                              ),
                              child: const Text('Enregistrer',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  if (!viewModel.isEditMode)
                    ElevatedButton(
                      onPressed: viewModel.toggleEditMode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                      ),
                      child: const Text('Modifier',
                          style: TextStyle(color: Colors.white)),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileTextField(
    BuildContext context, {
    required String label,
    required String initialValue,
    required bool enabled,
    required Function(String) onChanged,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(labelText: label),
          enabled: enabled,
          onChanged: onChanged,
          obscureText: obscureText,
          style: const TextStyle(
              color: Color.fromRGBO(61, 48, 162, 1),
              fontWeight: FontWeight.bold)),
    );
  }
}

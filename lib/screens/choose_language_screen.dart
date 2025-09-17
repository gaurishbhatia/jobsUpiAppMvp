import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/status_bar.dart';
import 'login_screen.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String selectedLanguage = 'English';
  
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'EN'},
    {'name': 'Spanish', 'code': 'ES'},
    {'name': 'French', 'code': 'FR'},
    {'name': 'German', 'code': 'DE'},
    {'name': 'Arabic', 'code': 'AR'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Status Bar
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomStatusBar(),
              ),
              
              // Back Button
              Positioned(
                top: 60,
                left: 24,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black87,
                ),
              ),
              
              // Main Content
              Positioned(
                top: 120,
                left: 24,
                right: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose Language',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    const Text(
                      'Select your preferred language to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Language List
                    ...languages.map((language) => 
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          title: Text(
                            language['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Radio<String>(
                            value: language['name']!,
                            groupValue: selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedLanguage = language['name']!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: selectedLanguage == language['name']
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ).toList(),
                  ],
                ),
              ),
              
              // Continue Button
              Positioned(
                bottom: 48,
                left: 55,
                right: 55,
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
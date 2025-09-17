import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_button.dart';
import '../widgets/status_bar.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String selectedCountryCode = '+1';
  
  final List<Map<String, String>> countryCodes = [
    {'code': '+1', 'country': 'US'},
    {'code': '+44', 'country': 'UK'},
    {'code': '+91', 'country': 'IN'},
    {'code': '+33', 'country': 'FR'},
    {'code': '+49', 'country': 'DE'},
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter your phone number',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    const Text(
                      'We\'ll send you a verification code to confirm your number',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Phone Number Input
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Country Code Dropdown
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButton<String>(
                              value: selectedCountryCode,
                              underline: const SizedBox(),
                              items: countryCodes.map((country) {
                                return DropdownMenuItem<String>(
                                  value: country['code'],
                                  child: Text(
                                    '${country['country']} ${country['code']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCountryCode = value!;
                                });
                              },
                            ),
                          ),
                          
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[300],
                          ),
                          
                          // Phone Number Field
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                hintText: 'Phone number',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                              ),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Terms and Privacy
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By continuing, you agree to our ',
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Send Code Button
              Positioned(
                bottom: 48,
                left: 55,
                right: 55,
                child: CustomButton(
                  text: 'Send Code',
                  onPressed: () {
                    if (phoneController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            phoneNumber: '$selectedCountryCode ${phoneController.text}',
                          ),
                        ),
                      );
                    }
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
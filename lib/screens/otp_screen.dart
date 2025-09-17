import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_button.dart';
import '../widgets/status_bar.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> otpControllers = 
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> otpFocusNodes = 
      List.generate(6, (index) => FocusNode());
  
  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    // Auto focus on first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      otpFocusNodes[0].requestFocus();
    });
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
    
    // Check if OTP is complete
    String otp = otpControllers.map((controller) => controller.text).join();
    setState(() {
      isOtpComplete = otp.length == 6;
    });
  }

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
                      'Enter verification code',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'We sent a 6-digit code to ${widget.phoneNumber}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // OTP Input Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 50,
                          height: 60,
                          child: TextField(
                            controller: otpControllers[index],
                            focusNode: otpFocusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey[300]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (value) => onOtpChanged(value, index),
                          ),
                        );
                      }),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Resend Code
                    TextButton(
                      onPressed: () {
                        // TODO: Implement resend OTP
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Code resent successfully'),
                          ),
                        );
                      },
                      child: Text(
                        'Didn\'t receive the code? Resend',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Verify Button
              Positioned(
                bottom: 48,
                left: 55,
                right: 55,
                child: CustomButton(
                  text: 'Verify',
                  onPressed: isOtpComplete ? () {
                    // TODO: Verify OTP with backend
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
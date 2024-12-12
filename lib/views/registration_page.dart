import 'package:practise_app/packages/packages.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children: [
            Positioned(
            // left: 85,top:0,bottom: -5,
              bottom: -40,right:-90,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/addidaslogobg.jpg',
                  ),
                ),
            ),
            Positioned(
              top: 70,right: 5,left: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text('Hi,Welcome!👋',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w600),),
                   const Text('Fill in your details to Login into Your Account',style:  TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold)),

                    const SizedBox(height: 40),
                    TextFieldWidget(
                      controller: emailController,
                      secure: false,
                      text: "Email",icon: const Icon(Icons.alternate_email),),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      secure: true,
                      controller: passwordController,
                      text: "Password",icon: const Icon(Icons.lock_open),),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          //  login();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen(),));
                        },
                        child: const Text('L O G I N',style: TextStyle(fontSize: 20,color: Colors.black),),
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Text('Or With',style: TextStyle(fontSize: 15,color: Colors.white)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.facebook,color: Colors.white,),
                            SizedBox(width: 70),
                            Text('Sign Up with Facebook',
                              style: TextStyle(fontSize: 15,color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.g_mobiledata_outlined,color: Colors.black,),
                            const SizedBox(width: 70),
                            Text('Sign Up with Google',
                              style: TextStyle(fontSize: 15,color: Colors.blueGrey.shade800),),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("I don't have an account?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        TextButton(onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                        },
                          child: const Text('Sign Up',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}



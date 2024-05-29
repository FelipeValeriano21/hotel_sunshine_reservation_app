import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hotel_sunshine_app/views/reserva_screen_view.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  bool isBorderVisible = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text(
          "©FelipeValeriano2024",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 220, 121, 0),
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isBorderVisible = !isBorderVisible;
                        _controller.reverse(from: 1.0);
                      });
                    },
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: child,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: 280,
                        height: 280,
                        child: Image.asset(
                          "assets/img/logo-sunshine.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 3,
                        width: 100,
                        color: const Color.fromARGB(255, 0, 98, 147),
                      ),
                      Container(
                        height: 3,
                        width: 100,
                        color: const Color.fromARGB(255, 0, 98, 147),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  FadeTransition(
                    opacity: _animation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "QUERO FAZER PARTE DA EXPERIÊNCIA",
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pomperiere',
                                color: Color.fromRGBO(0, 40, 80, 1),
                              ),
                              speed: const Duration(milliseconds: 75),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Vamos começar!",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReservaPage()),
                          );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 0, 88, 195)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 50.0),
                            ),
                          ),
                          child: const Text('Continuar para agenda',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                        const SizedBox(height: 30),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

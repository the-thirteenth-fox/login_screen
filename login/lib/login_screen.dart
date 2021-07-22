import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double uniHeight = 24;
    const double paddingHor = 28;
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: Column(children: [
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHor, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ваш профиль",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff2b2b2b),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: uniHeight,
              ),
              const Text(
                "Войдите в аккаунт и начните поддерживать  и создавать проекты.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff2b2b2b),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: uniHeight,
              ),
              const LoginButton(),
              const SizedBox(
                height: uniHeight,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Нет аккаунта?",
                    style: TextStyle(
                      color: Color(0xff696969),
                      fontSize: 12,
                      fontFamily: "Suisse Intl",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Зарегистрируйтесь",
                    style: TextStyle(
                      color: Color(0xff2b2b2b),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 5,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                  offset: Offset(0, 4),
                  blurRadius: 4)
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHor, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  MenuItem(
                    iconPath: 'settings.png',
                    text: 'Настройки',
                  ),
                  Divider(),
                  MenuItem(
                    iconPath: 'question.png',
                    text: 'Поддержка',
                  ),
                  Divider(),
                  MenuItem(
                    iconPath: 'add.png',
                    text: 'Узнайте как создать Проект',
                  ),
                  Divider(),
                ])),
      ])),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Transform.scale(scale: _scale, child: buttonUI(context)));
  }

  Container buttonUI(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffff7d5a),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 14,
      ),
      child: const Text(
        "Войти",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "Suisse Intl",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final String iconPath;

  const MenuItem({
    Key? key,
    required this.text,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff2b2b2b),
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/$iconPath',
            scale: 4,
          )
        ],
      ),
    );
  }
}

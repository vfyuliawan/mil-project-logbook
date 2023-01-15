// ignore_for_file: prefer_const_constructors

part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginIsFailed) {
              Commons().showSnackBar(context, state.message);
            } else if (state is LoginIsSuccess) {
              Commons().showSnackbarInfo(context, "Selamat Datang Kembali");
              context.go(routeName.home);
            }
          },
          child: ZStack(
            [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: Image(
                      image: AssetImage('assets/images/mil_logo.png'),
                    ),
                  ).pOnly(top: 80),
                  5.heightBox,
                  "Logbook Digitalization".text.size(24).white.bold.make(),
                ],
              ),
              _buildLoginForm().pOnly(top: 400)
            ],
          ).scrollVertical(physics: ScrollPhysics()),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return VStack(
      [
        TextFieldWidget(
          controller: emailController,
          title: 'Email',
        ),
        8.heightBox,
        TextFieldWidget(
          controller: passController,
          title: 'Password',
          isPassword: true,
        ),
        16.heightBox,
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return ButtonWidget(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LoginUser(
                    email: emailController.text,
                    password: passController.text));
              },
              isLoading: (state is LoginIsLoading) ? true : false,
              text: 'Login',
              color: Colors.red.shade600,
            ).wFull(context);
          },
        ),
        16.heightBox,
        'Please contact administrator to email Register'
            .text
            .makeCentered()
            .onTap(() {
          context.go(routeName.register);
        })
      ],
    ).p16();
  }
}

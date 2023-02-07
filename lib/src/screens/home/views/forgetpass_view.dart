part of '../../screens.dart';

class UpdatePass extends StatefulWidget {
  const UpdatePass({super.key});

  @override
  State<UpdatePass> createState() => _UpdatePassState();
}

class _UpdatePassState extends State<UpdatePass> {
  bool hidePassword = true;
  bool hideConPassword = true;
  bool isAgree = false;

  final TextEditingController _password = TextEditingController();
  final TextEditingController _conpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void changeConPasswordVisibility() {
    setState(() {
      hideConPassword = !hideConPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffC9C4E5),
        ),
        child: Form(
          key: _formkey,
          child: Stack(
            children: <Widget>[
              Container(
                width: 460,
                height: 175,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/illus_login.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xffEA232A),
                            ),
                            Text(
                              "Kembali ke Halaman Masuk",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffEA232A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 26, 15, 4),
                      child: const Text(
                        "Perbarui Password",
                        style: TextStyle(
                          fontFamily: "inter_semibold",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff262626),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 4, 15, 0),
                      child: const Text(
                        "Silahkan masukkan password baru untuk masuk ke akun anda.",
                        style: TextStyle(
                            fontFamily: "inter_regular",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666)),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 24, 15, 0),
                      child: const Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 4, 15, 0),
                      child: TextFormField(
                        controller: _password,
                        style: const TextStyle(
                          fontFamily: "inter_regular",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff333333),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              changePasswordVisibility();
                            },
                            child: Icon(
                              (hidePassword)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xff666666),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: const Color(0xff999999),
                        ),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 8, 15, 0),
                      child: const Text(
                        "Konfirmasi Password",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 4, 15, 0),
                      child: TextFormField(
                        controller: _conpassword,
                        style: const TextStyle(
                          fontFamily: "inter_regular",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                        obscureText: hideConPassword,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff666666),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              changeConPasswordVisibility();
                            },
                            child: Icon(
                              (hideConPassword)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xff666666),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: const Color(0xff999999),
                        ),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (_password.text == _conpassword.text) {
                            return null;
                          } else {
                            return "Konfirmasi password harus sama";
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 24, 15, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            context.go('/forpassuc');
                          } else {
                            return;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEA232A),
                          padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                        ),
                        child: const Text(
                          "Perbarui Password",
                          style: TextStyle(
                            fontFamily: "inter_bold",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

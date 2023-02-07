part of '../../screens.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox(
              child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset(
                  "assets/images/loginscreen.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 180),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          alignment: const Alignment(-1, -1),
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {},
                        child: Row(children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_rounded),
                            color: const Color.fromARGB(255, 216, 25, 15),
                            onPressed: () {},
                          ),
                          const Text("Kembali ke Halaman Masuk"),
                        ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Lupa Password",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                    "Silahkan masukkan email saat mendaftar, kami akan mengirimkan tautan untuk memulihkan password Anda"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.red,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 350,
                            margin: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red)),
                              onPressed: () {},
                              child: const Text("Kirim Email Konfirmasi"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}

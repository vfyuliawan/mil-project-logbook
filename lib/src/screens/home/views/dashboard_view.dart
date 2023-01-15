// ignore_for_file: prefer_const_constructors

part of '../../screens.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String _scanBarcode = "";

  final TextEditingController suhuController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // void reset(){
  //   productNameController.clear();
  // }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.QR)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserIsLoading) {
              return const CircularProgressIndicator().centered();
            } else if (state is UserIsSuccess) {
              return ZStack(
                [
                  Container(
                    // width: ,
                    height: MediaQuery.of(context).size.height * 0.20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 5, offset: Offset(-1, 3))
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                      ),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/background-home.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  _buildAppBar(context, state.data).pOnly(left: 10),
                  24.heightBox,
                  _buildContent(context).pOnly(top: 190, left: 5, right: 5)
                  // _buildListProduct().expand(),
                ],
                // alignment: MainAxisAlignment.start,
                // axisSize: MainAxisSize.max,
              );
            }
            return 0.heightBox;
          },
        ),
      ),
    );
  }

  // Widget _buildForm(BuildContext context) {
  //   return Container(
  //     child: ListView,
  //   );
  // }

  Widget _buildContent(BuildContext context) {
    TableRow _buildRow(List<String> cells) => TableRow(
        children: cells
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                    e,
                    style: TextStyle(fontSize: 11),
                  )),
                ))
            .toList());
    return ListView(
        // final item = _item[index];
        children: [
          Card(
            margin: EdgeInsets.all(3),
            elevation: 9,
            // color: Colors.red.shade100,
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.red.shade600,
              iconColor: Colors.black,
              // backgroundColor: Colors.grey,
              textColor: Colors.black,
              title: "View Kaidah Logbook".text.bold.make(),
              children: [
                "Kaidah Pengisian Logbook".text.bold.make(),
                16.heightBox,
                Table(
                  columnWidths: {
                    0: FractionColumnWidth(0.35),
                    1: FractionColumnWidth(0.60)
                  },
                  border: TableBorder.all(),
                  children: [
                    _buildRow([
                      'A (Attributable)',
                      'Terdapat informasi SIAPA dan KAPAN aktivitas dilakukan, dengan mencantumkan PARAF, NAMA/INISIAL dan TANGGAL. Untuk perbaikan/koreksi data gunakan GARIS TUNGGAL dan pastikan terdapat ALASAN yang jelas dan cantumkan PARAF, NAMA/INISIAL dan TANGGAL.'
                    ],),
                    _buildRow([
                      '(L) Legible',
                      'Pengisian menggunakan ballpoint dengan TINTA PERMANEN BERWARNA BIRU dan tidak dapat dihapus. Dilarang menghilangkan/mengaburkan, menghapus, mencoret-coret dan menimpa pada data yang salah. Tulisan tangan harus JELAS dan MUDAH DIBACA.'
                    ],),
                    _buildRow([
                      '(C) Contemporaneous',
                      'Dilarang mencatat pada dokumen yang tidak terdaftar (kertas satuan, catatan pribadi atau post it).Gunakan DOKUMEN YANG TERDAFTAR dan telah DISETUJUI OLEH QA. Pada setiap halaman tersedia cap VERIFIED BY QA. Dokumen yang telah habis masa pemakaiannya atau telah terisi penuh harus diperiksa oleh kepala department dan QA, kemudian di cap CHECKED BY QA sedangkan yang sudah tidak digunakan dikarenakan alat / mesin rusak di cap OBSOLETE oleh QA'
                    ]),
                    _buildRow([
                      '(O) Original',
                      'Personel melakukan pencatatan data dan informasi PADA SAAT KEGIATAN BERLANGSUNG. DILARANG MENUNDA atau MENDAHULUI PENCATATAN'
                    ]),
                    _buildRow([
                      '(A) Accurate',
                      'Data harus BENAR, DAPAT DIPERCAYA, LENGKAP, VALID dan TIDAK ADA MANIPULASI. Catatan harus MENCERMINKAN APA YANG SEBENARNYA terjadi.'
                    ]),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Card(
            elevation: 9,
            // color: Colors.red.shade100,
            margin: EdgeInsets.all(3),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.red.shade600,
              iconColor: Colors.black,
              textColor: Colors.black,
              title: "Suhu".text.bold.make(),
              children: [
                Column(
                  children: [
                    "Logbook Pengisian Suhu Ruangan".text.bold.size(18).make(),
                    16.heightBox,
                    _buildSuhuForm(),
                    ButtonWidget(
                      onPressed: () async {
                        // text = await scanner.scan();
                        setState(() {});
                      },
                      isLoading: false,
                      text: 'Submit',
                    )
                  ],
                )
              ],
            ),
          )
        ]);
  }

  Widget _buildAppBar(BuildContext context, UserModel data) {
    return VxBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                child: Image(
                  image: AssetImage("assets/images/mil_logo.png"),
                ),
              ),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<UserBloc>(context).add(LogOutUser());
                    context.go(routeName.login);
                    Commons().showSnackbarError(context, "Anda Telah logout");
                  },
                  icon: Icon(Icons.logout_outlined)),
            ],
          ),
          16.heightBox,
          HStack(
            [
              //USER Profile
              HStack([
                VxCircle(
                  radius: 56,
                  backgroundImage: (data.photoProfile!.isNotEmpty)
                      ? DecorationImage(
                          image: NetworkImage(data.photoProfile!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ).onTap(() {
                  context.go(routeName.adminPath);
                }),
                16.widthBox,
                "Production Staff,\n".richText.size(11).withTextSpanChildren([
                  data.username!.textSpan.size(14).bold.make(),
                ]).make(),
              ]).expand(),

              // //ICON Cart
              // BlocBuilder<CartCountCubit, CartCountState>(
              //   builder: (context, state) {
              //     return ZStack(
              //       [
              //         IconButton(
              //           onPressed: () {
              //             context.go(routeName.cartPath);
              //           },
              //           icon: const Icon(
              //             Icons.shopping_cart_outlined,
              //             color: colorName.black,
              //           ),
              //         ),
              //         (state as CartCountIsSuccess).value != 0
              //             ? VxBox(
              //                     child: state.value.text
              //                         .size(8)
              //                         .white
              //                         .makeCentered()
              //                         .p4())
              //                 .roundedFull
              //                 .color(colorName.accentRed)
              //                 .make()
              //                 .positioned(right: 8, top: 2)
              //             : 0.heightBox
              //       ],
              //       alignment: Alignment.topRight,
              //     );
              //   },
              // )
              // //ICON CART
            ],
            // alignment: MainAxisAlignment.spaceBetween,
            // axisSize: MainAxisSize.max,
          ),
        ],
      ),
    ).make();
  }

  Widget _buildSuhuForm() {
    return VStack([
      Row(
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              autofocus: true,
              readOnly: true,
              controller: barcodeController,
              decoration: InputDecoration(
                labelText: "Nomor Alat",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                icon: Icon(Icons.account_balance_wallet, color: Colors.red),
                hintText: _scanBarcode,
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
          ),
          8.widthBox,
          ButtonWidget(
            color: Colors.red,
            onPressed: () {
              scanQR();
            },
            text: "Scann Barcode Alat",
          )
        ],
      ),
      8.heightBox,
      SizedBox(
        width: 150,
        child: TextField(
          keyboardType: TextInputType.number,
          controller: suhuController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            icon: Icon(Icons.thermostat, color: Colors.red),
            suffixIcon: Icon(Icons.thermostat),
            // suffixText: "C",
            // suffixStyle: TextStyle(color: Colors.black),
            hintText: "Suhu",
            hintStyle: TextStyle(fontSize: 12),
          ),
        ),
      ),
      8.heightBox,
      TextField(
        maxLines: 5,
        controller: catatanController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          icon: Icon(Icons.note, color: Colors.red),
          hintText: "Catatan",
          hintStyle: TextStyle(fontSize: 12),
        ),
      ),
    ]).p(8);
  }

  Widget _buildListProduct() {
    return BlocConsumer<ListProductBloc, ListProductState>(
      listener: (context, state) {
        if (state is ListProductIsFailed) {
          Commons().showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ListProductIsLoading) {
          //Loading Widget
          return const CircularProgressIndicator();
        }
        if (state is ListProductIsSuccess) {
          //List Product Widget
          final data = state.products;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.5 / 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _buildProductWidget(context, data[index]);
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _buildProductWidget(BuildContext context, ProductModel data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: VStack(
        [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.network(
              data.pictures![0],
              fit: BoxFit.cover,
            ),
          ),
          VStack([
            data.name!.text.size(16).bold.make(),
            4.heightBox,
            Commons().setPriceToIDR(data.price!).text.size(12).make(),
          ]).p8()
        ],
      ).box.white.make(),
    ).onTap(() {
      context.go(routeName.detailPath, extra: data.id);
    });
  }
}

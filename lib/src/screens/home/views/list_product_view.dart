part of '../../screens.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  dynamic resAPI;
  _callApi() {
    final response1 = gedgetModels;
    //mounted pemberitahuan screen ready / widget terender sepenuhnya
    if (mounted) {
      setState(() {
        resAPI = response1;
      });
    }
  }

  Future<BaseResponseModel> fetchAllGedget() async {
    try {
      final response =
          await http.get(Uri.parse("https://dummyjson.com/products"));
      if (response.statusCode == 200) {
        return BaseResponseModel(data: response.body, message: "Berhasil");
      } else {
        return BaseResponseModel(data: null, message: "Gagal");
      }
    } catch (e) {
      return BaseResponseModel(data: null, message: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "List Product".text.make()),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: 20,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 6,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              "https://images.tokopedia.net/img/KRMmCm/2022/9/12/cea70077-6a42-4701-87bc-197e1a5f3b6d.jpg"),
                          Column(
                            children: [
                              // (null != resAPI
                              //     ? Text(resAPI["productName"].toString())
                              //     : Text("")),
                              (null != resAPI
                                  ? Text(resAPI["productName"].toString())
                                  : Text("LifeCycle")),
                              5.heightBox,
                              "Asus memiliki beragam lini produk laptop unggulan di berbagai kategori berdasarkan kebutuhan pengguna. ProArt merupakan seri laptop yang cocok untuk kebutuhkan profesional, seperti arsitek, animator"
                                  .text
                                  .maxLines(4)
                                  .size(12)
                                  .make(),
                              5.heightBox,
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.network(
                                    "https://cdn-oss.ginee.com/official/wp-content/uploads/2022/05/image-615-1024x512.png"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

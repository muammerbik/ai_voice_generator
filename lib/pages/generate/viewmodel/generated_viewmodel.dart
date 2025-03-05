import 'package:mobx/mobx.dart';
part 'generated_viewmodel.g.dart';

class GeneratedViewModel = _GeneratedViewModelBase with _$GeneratedViewModel;

abstract class _GeneratedViewModelBase with Store {
 

  @observable
  List<GenerateModel> generatePersonList = [
    GenerateModel(
        name: "Trump",
        img: "assets/images/trump.png",
        token: "TM:4v0ft4j72y2g"),
    GenerateModel(
        name: "Obama",
        img: "assets/images/obama.png",
        token: "TM:58vtv7x9f32c"),
    GenerateModel(
        name: "Morgan",
        img: "assets/images/morgan.png",
        token: "TM:xcx5ytjsv8b3"),
    GenerateModel(
        name: "Elon.M",
        img: "assets/images/elon.png",
        token: "TM:fxq6hnfc3rht"),
    GenerateModel(
        name: "Brady",
        img: "assets/images/brady.png",
        token: "TM:fnkmhbrznmeh"),
    GenerateModel(
        name: "A.Tate",
        img: "assets/images/tate.png",
        token: "TM:43c7p13p3z5c"),
    GenerateModel(
        name: "Zendaya",
        img: "assets/images/zendaya.png",
        token: "TM:f5hcw922p29b"),
    GenerateModel(
        name: "Elon.M",
        img: "assets/images/elon.png",
        token: "TM:fxq6hnfc3rht"),
  ];
}

class GenerateModel {
  final String name;
  final String img;
  final String token;
  GenerateModel({
    required this.name,
    required this.img,
    required this.token,
  });
}


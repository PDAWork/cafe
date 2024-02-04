import 'package:cafe/features/home/data/model/category_model.dart';
import 'package:cafe/features/home/data/model/item_menu_model.dart';

const dynamic _list = [
  {
    'title': "Салат с обжаренной свининой",
    'cost': 440.0,
    "path": 'image1.png',
    "weight": '330',
    "category": {
      'id': 1,
      'name': 'Салаты',
    },
  },
  {
    'title': "Микс с курицей",
    'cost': 460.0,
    "path": 'image2.png',
    "weight": '420',
    "category": {
      'id': 1,
      'name': 'Салаты',
    },
  },
  {
    'title': "Цезарь с креветками",
    'cost': 520.0,
    "path": 'image3.png',
    "weight": '410',
    "category": {
      'id': 1,
      'name': 'Салаты',
    },
  },
  {
    'title': "Каприз",
    'cost': 380.0,
    "path": 'image4.png',
    "weight": '320',
    "category": {
      'id': 1,
      'name': 'Салаты',
    },
  },
  {
    'title': "Морковь по-корейски с лангустинами",
    'cost': 290.0,
    "path": 'image5.png',
    "weight": '180',
    "category": {
      'id': 1,
      'name': 'Салаты',
    },
  },
  {
    'title': "Гурман",
    'cost': 410.0,
    "path": 'image6.png',
    "weight": '310',
    "category": {
      'id': 1,
      'name': 'Салаты',
    },
  },
  {
    'title': "Карбонара с индейкой",
    'cost': 560.0,
    "path": 'image7.png',
    "weight": '350',
    "category": {
      'id': 2,
      'name': 'Горячие блюда',
    },
  },
  {
    'title': "Сёмга под соевым соусом",
    'cost': 740.0,
    "path": 'image8.png',
    "weight": '180/220',
    "category": {
      'id': 2,
      'name': 'Горячие блюда',
    },
  },
  {
    'title': "Стейк «Портерхаус»",
    'cost': 820.0,
    "path": 'image9.png',
    "weight": '120/250',
    "category": {
      'id': 2,
      'name': 'Горячие блюда',
    },
  },
  {
    'title': "Бифштекс рубленный из мраморной говядины",
    'cost': 960.0,
    "path": 'image10.png',
    "weight": '310',
    "category": {
      'id': 2,
      'name': 'Горячие блюда',
    },
  },
  {
    'title': "Котлеты из рубленного куриного филе с чесночным соусом",
    'cost': 560.0,
    "path": 'image11.png',
    "weight": '350',
    "category": {
      'id': 2,
      'name': 'Горячие блюда',
    },
  },
  {
    'title': "Пельмени Сибирские",
    'cost': 520.0,
    "path": 'image12.png',
    "weight": '330',
    "category": {
      'id': 2,
      'name': 'Горячие блюда',
    },
  },
  {
    'title': "Чизкейк Сан Себастьян с малиной",
    'cost': 360.0,
    "path": 'image13.png',
    "weight": '180',
    "category": {
      'id': 3,
      'name': 'Десерты',
    },
  },
  {
    'title': "Чизкейк «Черничное искушение»",
    'cost': 390.0,
    "path": 'image14.png',
    "weight": '180',
    "category": {
      'id': 3,
      'name': 'Десерты',
    },
  },
  {
    'title': "Малиновая корзиночка",
    'cost': 290.0,
    "path": 'image15.png',
    "weight": '110',
    "category": {
      'id': 3,
      'name': 'Десерты',
    },
  },
  {
    'title': "Крем-брюле с орехами",
    'cost': 350.0,
    "path": 'image16.png',
    "weight": '180',
    "category": {
      'id': 3,
      'name': 'Десерты',
    },
  },
  {
    'title': "Капкейк классический",
    'cost': 320.0,
    "path": 'image17.png',
    "weight": '120',
    "category": {
      'id': 3,
      'name': 'Десерты',
    },
  },
  {
    'title': "Капкейк «Клубничный поцелуй»",
    'cost': 330.0,
    "path": 'image18.png',
    "weight": '120',
    "category": {
      'id': 3,
      'name': 'Десерты',
    },
  },
];

const dynamic _category = [
  {
    "id": 1,
    "name": "Салаты",
  },
  {
    "id": 2,
    "name": "Горячие блюда",
  },
  {
    "id": 3,
    "name": "Десерты",
  },
  {
    "id": 4,
    "name": "Напитки",
  },
  {
    "id": 5,
    "name": "Пицца",
  },
  {
    "id": 6,
    "name": "Блюда на углях",
  },
  {
    "id": 7,
    "name": "Холодные закуски",
  },
  {
    "id": 8,
    "name": "Первые блюда",
  },
];

abstract interface class HomeDataSource {
  Future<List<ItemMenuModel>> getAllItemMenu();
  Future<List<CategoryModel>> getAllCategory();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<ItemMenuModel>> getAllItemMenu() {
    return Future.delayed(const Duration(milliseconds: 400), () {
      return (_list as List).map((e) => ItemMenuModel.fromJson(e)).toList();
    });
  }

  @override
  Future<List<CategoryModel>> getAllCategory() {
    return Future.delayed(const Duration(milliseconds: 400), () {
      return (_category as List).map((e) => CategoryModel.fromJson(e)).toList();
    });
  }
}

import 'package:dunija/models/recipe.dart';
import 'package:dunija/models/recipe_category.dart';
import 'package:dunija/models/notification.dart';
import 'package:dunija/models/user.dart';

class AppLists {
  ///App's List
  static List<FoodCategory> foodCatList = [
    FoodCategory(
      title: 'Baked & Fried',
      image: 'assets/imgs/baked_foods.png',
      description: '',
    ),
    FoodCategory(
      title: 'Barbicues',
      image: 'assets/imgs/barbicue.png',
      description: '',
    ),
    FoodCategory(
        title: 'Beverages',
        image: 'assets/imgs/fried_foods.png',
        description: ''),
    FoodCategory(
      title: 'Fufu',
      image: 'assets/imgs/fried_foods.png',
      description: '',
    ),
    FoodCategory(
      title: 'Grains & Pasters',
      image: 'assets/imgs/fried_foods.png',
      description: '',
    ),
    FoodCategory(
        title: 'Porridges',
        image: 'assets/imgs/porridges.png',
        description: ''),
    FoodCategory(
      title: 'Salads',
      image: 'assets/imgs/salads.png',
      description: '',
    ),
    FoodCategory(
      title: 'Soups',
      image: 'assets/imgs/soups.png',
      description: '',
    )
  ];

  static List<String> categoryNames = [
    'Select Category',
    'Baked Foods',
    'Barbicues',
    'Fried Foods',
    'Porridges',
    'Salads',
    'Soups',
  ];

  ///
  static final List<Recipe> foodList = [
    Recipe(
        name: 'Jollof Rice',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
    Recipe(
        name: 'Pepper Soup',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
    Recipe(
        name: 'Porridge Yam',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
    Recipe(
        name: 'Egusi Soup',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
  ];

  ///
  static final List<InAppNotification> notificationList = [
    InAppNotification(
        title: 'Jollof Rice',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
        status: 'seen'),
    InAppNotification(
        title: 'Pepper Soup',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
        status: 'seen'),
    InAppNotification(
        title: 'Porridge Yam',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
        status: 'unseen'),
    InAppNotification(
        title: 'Egusi Soup',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
        status: 'seen'),
  ];

  static List<String> genderList = ['Male', 'Female'];

  static List<String> interests = [
    'Select Interest',
    'African Dishes',
    'Fried Foods',
    'Porridges'
  ];

  static List dummyList = List.generate(6, (index) => 'Item ${index + 1}');

  static Future<List<Recipe>> fetchBakedFoodList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Baked Food ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<Recipe>> fetchBarbicueList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Barbicue ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<Recipe>> fetchFriedFoodsList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Fried Food ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<Recipe>> fetchPorridgeList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Porridge ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<Recipe>> fetchSaladList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Salad ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<Recipe>> fetchSoupsList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Soup ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<Recipe>> fetchAllRecipeList() async {
    return List.generate(15, (index) {
      return Recipe(
          name: 'Recipe ${index + 1}', description: 'Short description');
    });
  }

  static Future<List<User>> fetchUsersList() async {
    return List.generate(15, (index) {
      return User(
          firstName: 'FirstName ',
          lastName: 'LastName ${index + 1}',
          interest: 'Interest');
    });
  }
}

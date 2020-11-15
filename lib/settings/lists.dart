import 'package:dunija/models/food.dart';
import 'package:dunija/models/foodCat.dart';
import 'package:dunija/models/notification.dart';
import 'package:flutter/material.dart';

class AppLists {
  ///App's List
  static List<FoodCategory> foodCatList = [
    FoodCategory(
        title: 'Baked Foods',
        image: 'assets/imgs/baked_foods.png',
        description: ''),
    FoodCategory(
        title: 'Barbicues', image: 'assets/imgs/barbicue.png', description: ''),
    FoodCategory(
        title: 'Fried Foods',
        image: 'assets/imgs/fried_foods.png',
        description: ''),
    FoodCategory(
        title: 'Porridges',
        image: 'assets/imgs/porridges.png',
        description: ''),
    FoodCategory(
        title: 'Salads', image: 'assets/imgs/salads.png', description: ''),
    FoodCategory(
        title: 'Soups', image: 'assets/imgs/soups.png', description: '')
  ];

  ///
  static final List<Food> foodList = [
    Food(
        name: 'Jollof Rice',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
    Food(
        name: 'Pepper Soup',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
    Food(
        name: 'Porridge Yam',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
                'eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
                'laboris nisi ut aliquip ex ea commodo consequat.'),
    Food(
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
}

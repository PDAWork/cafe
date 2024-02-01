import 'package:flutter/material.dart';

abstract class AppColor {
  // Основной текст и заголовки
  static const Color text1 = Color(0xFF35353A);
  // Вторичный текст и описания
  static const Color text2 = Color(0xFF5F6365);
  // Неактивные и дополнительные точки, второстепенная информация и помощники
  static const Color text3 = Color(0xFF96999A);
  // Заголовки
  static const Color text4 = Color(0xFFB2B7B9);
  // Текст ссылки и дополнительных кнопок
  static const Color link = Color(0xFF526ED3);
  // Положительные значения: доход, рост курса акций и т. д.
  static const Color positive = Color(0xFF7AC5AA);
  // Отрицательные значения: расходы, падение курса акций и т. д.
  static const Color negative = Color(0xFFDD4C1E);
  //Основной фон страницы и заливка значков для инвертированного цвета фона
  static const Color base1 = Color(0xFFFFFFFF);
  // Вторичный фон страницы, плитка на основном фоне и фон значков статических маркеров
  static const Color base2 = Color(0xFFFCFCFC);
  // Наведенные фоны для плиток
  static const Color base3 = Color(0xFFE3E3E8);
  // Границы таблицы, острова и блоки
  static const Color base4 = Color(0xFFCDCDD1);
  // Граница нависающего острова или другие интерактивные блоки
  static const Color base5 = Color(0xFFACADB0);
  // Цвет, на который меняется иконка интерактивного интерфейса при наведении, использует значение --tui-base-05.
  static const Color base6 = Color(0xFF8C8D95);
  // Для блоков с инвертированным цветом фона
  static const Color base7 = Color(0xFF7A7B7E);
  // Альтернативный цвет значков интерфейса
  static const Color base8 = Color(0xFF333333);
  // Цвет значков на инвертированном фоне
  static const Color base9 = Color(0xFF000000);
  // Фон кнопок, значков маркеров
  static const Color primary = Color(0xFFED9717);
  // Фон поля ввода и дополнительных кнопок
  static const Color secondary1 = Color(0xFFF6B451);
  // Фон состояния при наведении на поле ввода и дополнительные кнопкиƒ
  static const Color secondary2 = Color(0xFFFDCD86);
  // Фон акцентных значков или кнопок
  static const Color accent = Color(0xFFB4F3E4);
  // Фон активного состояния значков акцентов или кнопок
  static const Color accentActive = Color(0xFF089082);
  // Цвет заливки элементов интерфейса на цветном фоне: тегов, значков, кнопок.
  static const Color clear = Color(0xFFEBEBEB);
  // Активное состояние цвета заливки элементов интерфейса на цветном фоне
  static const Color clearActive = Color(0xFFCCCCCC);
}


&НаКлиенте
Перем Поле; //тут хранятся ячейки

&НаКлиенте
Процедура НажатиеНаКнопку(Команда)
	ТекущийЭлемент.Заголовок = "0";
	ИмяКнопки = ТекущийЭлемент.Имя;
	Номер = Прав(ИмяКнопки, 2);  // запомнить номер кнопки
	Строка = Число(Лев(Номер, 1));
	Столбец = Число(Прав(Номер, 1));
	Поле[Строка][Столбец] = "0"; 
	Если ИграОкончена() Тогда
		ПоказатьПредупреждение(,"Поздравляем, вы выиграли!!!");
		Возврат;
	Иначе
		ХодКомпьютера();
		Если ИграОкончена() Тогда
			ПоказатьПредупреждение(,"Вы проиграли!");
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ХодКомпьютера()
	Для Строка = 0 По 2 Цикл
		Для Столбец = 0 По 2 Цикл
			Если Поле[Строка][Столбец] = "" Тогда  
				Поле[Строка][Столбец] = "Х";
				ИмяКнопки = "Кнопка" + Строка + Столбец; 
				Элементы[ИмяКнопки].Заголовок = "Х";  
				Возврат;
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
				
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Поле = Новый Массив(3,3);  
	Для Строка = 0 По 2 Цикл
		Для Столбец = 0 По 2 Цикл
			Поле[Строка][Столбец] = "";
		КонецЦикла;
	КонецЦикла;
	
	
КонецПроцедуры

&НаКлиенте
Функция ИграОкончена()
	
	//проверка первой строки
	Если Поле[0][0] <> "" И Поле[0][0] = Поле[0][1] И Поле[0][0] = Поле[0][2] Тогда
		Возврат Истина;
	КонецЕсли;
	
	//проверка второй строки
	Если Поле[1][0] <> "" И Поле[1][0] = Поле[1][1] И Поле[1][0] = Поле[1][2] Тогда
		Возврат Истина;
	КонецЕсли; 
	
	//проверка третьей строки
	Если Поле[2][0] <> "" И Поле[2][0] = Поле[2][1] И Поле[2][0] = Поле[2][2] Тогда
		Возврат Истина;
	КонецЕсли;
	
	//проверка первого столбца
	Если Поле[0][0] <> "" И Поле[0][0] = Поле[1][0] И Поле[0][0] = Поле[2][0] Тогда
		Возврат Истина;
	КонецЕсли;
	
	//проверка второго столбца
	Если Поле[0][1] <> "" И Поле[0][1] = Поле[1][1] И Поле[0][1] = Поле[2][1] Тогда
		Возврат Истина;
	КонецЕсли;
	
	//проверка третьего столбца
	Если Поле[0][2] <> "" И Поле[0][2] = Поле[1][2] И Поле[0][2] = Поле[2][2] Тогда
		Возврат Истина;
	КонецЕсли;
	
	//проверка первой диагонали
	Если Поле[0][0] <> "" И Поле[0][0] = Поле[1][1] И Поле[0][0] = Поле[2][2] Тогда 
		Возврат Истина;
	КонецЕсли;
	
	//проверка второй диагонали  
	Если Поле[0][2] <> "" И Поле[0][2] = Поле[1][1] И Поле[0][2] = Поле[2][0] Тогда 
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь; 

КонецФункции

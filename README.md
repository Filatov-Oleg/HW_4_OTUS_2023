# HW_4_OTUS_2023
1. Выполнить рефакторинг приложения до SOA/MVVM/Flux/MobX. При реализации SwiftUI использовать стандартные механизмы Combine/Signals/EventBus
2. Модуляризировать свое приложение одним из известным способом. Вынести UI компоненты в отдельный модуль и импортить его в местах использования
3. Создать ServiceLocator(SOA)/MVVM(вложенные вьюмодели)/Flux(вложенные сторы)/MobX(контейнер-медиатор)
4. Перевести существующие сервисы на него
5. Добавить инжектинг в переменные инстанса класса, чтобы в каждом классе можно было видеть зависимости, не скролля файл
6. Выделить уровень Core сервисов (сеть, парсинг, хранение).
7. Core и другие сервисы вынести в модуль

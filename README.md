# EpidemicSimulator <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/icon.png" width="50"> 

iOS приложение, моделирующее и визуализирующее распространение инфекции в группе людей.

## Стек
Использованы фреймворки: UIKit, SnapKit.
Без использования Storyboards.
Применена архитектура MVC для стартового экрана.

### Start screen

Меню с выбором параметров.
Реализовала выбор размера группы с помощью TextField, a остальных параметров с помощью слайдеров, так как это самый быстрый и удобный способ выбора для пользователя.

<p float="left">
    <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/00startScreen.png" width="200">
    <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/01startScreen.png" width="200">
    <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/02startScreen.png" width="200">
</p>

### Экран моделирования

CollectionView, отображающий группу людей. Серые квадратики - здоровые люди, красные - зараженные.
С заданным периодом времени происходит пересчет группы инфицированных людей, после чего обновляются соответствующие клетки коллекции.

<p float="left">
    <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/1noInfect.png" width="200">
    <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/2patientZero.png" width="200">
    <img src="https://github.com/annagogley/epidemicSimulator/blob/main/screenshots/3spreadingInfect.png" width="200">
</p>

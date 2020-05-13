# README

## Тестовая задание от компании Sittme

Тестовое задание вакансии Backend Developer Ruby
REST API на фреймворке Ruby on Rails
Тема проекта свободная, интересует только REST API. Вы можете переиспользовать код вашего старого проекта и дописать фичи
 
Использовать Ruby on Rails, PostgreSQL, RSpec. Версия RoR не имеет значения.
 
Создать проект с тестовой моделью. Миграция для создания модели с откатом. Сиды (seed) для заполнения таблицы БД.
Роут списка элементов с курсорной пагинацией. Сортировка по дате создания.
Роут добавления элемента при помощи формы. Валидации данных не требуются.
(*) Курсорную пагинацию реализовывать без гемов.
(*) Сериалайзер для вывода в JSON.
(*) Тесты.
 
Наш разработчик оценил задачу на 3-4 часа со всеми звездочками.
Примечания
Особенно хотим увидеть самописную курсорную пагинацию, потому что это проявляет знание ActiveRecord, SQL, интеракторов, лямбд.
Курсорная пагинация - это когда запрашивается n элементов до или после определенного элемента-курсора, https://dev.to/jackmarchant/offset-and-cursor-pagination-explained-b89
Передача результатов:
Вопросы по заданию задавать в комментарии к заданию или в телеграм https://t.me/DenisTrofimovDev/
Готовое задание передавать через репо Github или Gitlab.
Если будете создавать приватные репо, то приглашать в него Дениса Трофимова https://gitlab.com/denis-trofimov, https://github.com/denis-trofimov

## Приступая к работе

Проверьте версии
```
$ ruby -v  # ruby 2.3.1
$ rails -v # rails 5.2.4.2
```

### Установка

##### Склонируйте репозиторий
```
$ git@github.com:Esgeri/sittme_blog.git
```

##### Установите гемы
```
$ bundle install
```

##### Конфигурация базы данных
```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: pguser
  password: qwerty

development:
  <<: *default
  host: ''
  database: sittme_blog_development

test:
  <<: *default
  database: sittme_blog_test
```

##### Создание базы данных
```
rails db:createL:all
```

##### Создание миграции
```
$ rake db:migrate
```

##### Создание сидов
```
$ rake db:seed
```

##### Зарегистрированный пользователь
```
Username: 'Test user'
Email: 'user@test.com'
Password: '123456'
```

### Тестирование
```
bundle exec rspec spec -fd
```

##
__Note:__ Rails Test App

### Author

* **Mirbek Askerov's** - [Resume](https://esgeri.github.io/cv)

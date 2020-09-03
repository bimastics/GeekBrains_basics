USE vk;

-- Добавляем внешние ключи в БД vk
-- Для таблицы профилей

-- Смотрим структуру таблицы
DESC profiles;

-- Описание синтаксиса запроса
-- Добавляем внешние ключи
ALTER TABLE profiles
/*Задаём ограничение:
Есть возможность задать ограниечение бзе использования ключевого слова CONSTRAINT, но
это не позволит задать сквозное наименование объекта.

profiles_user_id_fk описание стиля наименования ограничения внешного ключа:
  * profiles - это таблица для которой создаём внешний ключ;
  * user_id - имя столбца, для которого мы этот ключа создаём;
  * fk - суффикс типа ключа (в данном случае, это FOREIGN KEY). */
  ADD CONSTRAINT profiles_user_id_fk
    
    /*Определение ключа:
    В скобках определяем на какой столбец выставляется ключ.
    Определяем куда ссылается данный столбец, для этого используется ключевое слово REFERENCES,
    после ключевого слова указываем таблицу, куда ссылается внешний ключ и в скобках указываем имя столбца. */
    FOREIGN KEY (user_id) REFERENCES users(id)
      
      /*Задаём дополнительные параметры:
      После этого внешний ключ может уже быт создан, но обычно, задают дополнительные параметры:
      ON DELETE (что сделать, когда строка удаляется на которую ссылается внешний ключ).
      Если указать CASCADE: при удалении строки, куда ссылается user_id, тогда СУБД автоматически удалит строку из таблицы profiles
      RESTRICT - Тогда не бдует возможности удалить что-то, пока на данную таблицу ссылаются из других таблиц*/
      ON DELETE CASCADE,
      
  /*Задаём ключ для photo_id*/
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      -- SET NULL если удаляется фотография пользователя, на которы ссылается photo_id и в ячейки ставится null
      ON DELETE SET NULL;


-- Запрос без описания как используются ключевые слова 
-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;

-- Изменяем тип столбца при необходимости
ALTER TABLE profiles DROP FOREIGN KEY profiles_user_id_fk;
ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;


-- Для таблицы сообщений

-- Смотрим структуру таблицы
DESC messages;

-- Добавляем внешние ключи
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);

-- Если нужно удалить
ALTER TABLE table_name DROP FOREIGN KEY constraint_name;


-- Для таблицы постов

-- Смотрим структурв таблицы постов
DESC posts;

-- Добавляем внешние ключи
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id)
      ON DELETE SET NULL;



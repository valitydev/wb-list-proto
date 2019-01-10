/**
 * Сервис управление списками.
 */

namespace java com.rbkmoney.damsel.wb_list
namespace erlang wb_list

typedef string ID
typedef string Value

struct Info {
    // ID party
    1: required ID party_id;
    // ID  магазина
    2: required ID shop_id;
    // Идентификатор списка
    3: required ID list_name;
    // Значение в списке
    4: required Value value;
}

/**
 * Набор записей списка.
**/
struct InfoStorage {
    1: required list<Info> infos
}

exception ListNotFound {}

/**
* Интерфейс для управления чёрными и белыми списками
*/
service WbListService {

    /**
    * Проверяет существование в списке
    * если списка не существует то выбрасывается ListNotFound
    **/
    bool isExist(1: ID party_id, 2: ID shop_id, 3: ID list_name, 4: Value value)
        throws (1: ListNotFound ex1)

    /**
    * Добавление в список
    * если списка не существует то выбрасывается ListNotFound
    **/
    void add(1: ID party_id, 2: ID shop_id, 3: ID list_name, 4: Value value)
        throws (1: ListNotFound ex1)

    /**
    * Удаление из списка
    * если списка не существует то выбрасывается ListNotFound
    **/
    void remove(1: ID party_id, 2: ID shop_id, 3: ID list_name, 4: Value value)
        throws (1: ListNotFound ex1)

    /**
    * Постраничное получение списка
    * если списка не существует то выбрасывается ListNotFound
    * если запись в списке не найдена то возвращается пустой список
    **/
    InfoStorage getByPage(1: ID party_id, 2: ID shop_id, 3: ID list_name, 4: i32 offset 5: i32 size)
        throws (1: ListNotFound ex1)
}
/**
 * Сервис управление списками.
 */

namespace java com.rbkmoney.damsel.wb_list
namespace erlang wb_list

typedef string ID
typedef string Value

exception ListNotFound {}

enum Command {
    CREATE
    DELETE
}

// Данная структура используется на уровне сервиса для обновления списков через KAFKA
struct ChangeCommand {
    // ID party
    1: required ID party_id
    // ID  магазина
    2: required ID shop_id
    // Идентификатор списка
    3: required ID list_name
    // Значение в списке
    4: required Value value
    // Команда на изменение
    5: required Command command
}

/**
* Интерфейс для проверки по черным и белым спискам
*/
service WbListService {

    /**
    * Проверяет существование в списке
    * если списка не существует то выбрасывается ListNotFound
    **/
    bool isExist(1: ID party_id, 2: ID shop_id, 3: ID list_name, 4: Value value)
        throws (1: ListNotFound ex1)

}
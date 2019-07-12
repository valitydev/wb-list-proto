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

enum ListType {
    black
    white
}

struct Row {
    // ID party
    1: required ID party_id
    // ID  магазина
    2: required ID shop_id
    // Тип списка
    3: required ListType list_type
    // Идентификатор списка
    4: required ID list_name
    // Значение в списке
    5: required Value value
}

// Данная структура используется на уровне сервиса для обновления списков через KAFKA
struct ChangeCommand {
    // Запись в списке
    1: required Row row
    // Команда на изменение
    2: required Command command
}

enum EventType {
    CREATED
    DELETED
}

// Данная структура используется для EventSink для обновления оффлайн части сервиса списков через KAFKA
struct Event {
    // Запись в списке
    1: required Row row
    // Тип события
    2: required EventType eventType
}

/**
* Интерфейс для проверки по черным и белым спискам
*/
service WbListService {

    /**
    * Проверяет существование в списке
    * если списка не существует то выбрасывается ListNotFound
    **/
    bool isExist(1: Row row)
        throws (1: ListNotFound ex1)

    /**
    * Проверяет существование в списке  всех записей
    * если списка не существует то выбрасывается ListNotFound
    **/
    bool isAllExist(1: list<Row> row)
        throws (1: ListNotFound ex1)

    /**
    * Проверяет существование хотя бы одной записи
    * если списка не существует то выбрасывается ListNotFound
    **/
    bool isAnyExist(1: list<Row> row)
        throws (1: ListNotFound ex1)

    /**
    * Проверяет, что нет ни одной записи в списках
    * если списка не существует то выбрасывается ListNotFound
    **/
    bool isNotOneExist(1: list<Row> row)
        throws (1: ListNotFound ex1)

}
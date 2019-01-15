/**
 * Сервис управление списками.
 */

namespace java com.rbkmoney.damsel.wb_list
namespace erlang wb_list

typedef string ID
typedef string Value

exception ListNotFound {}

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
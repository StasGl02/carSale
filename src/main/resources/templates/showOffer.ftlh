<#import "header.ftlh" as c>
<#import "loginTemplate.ftlh" as l>
<#import "security.ftlh" as s>

<@c.page>
    <#assign options = ["Кондиционер", "Обогрев сидений", "ABS", "Штатная навигация", "Камера", "Защита от угона",
    "Круиз-контроль", "Bluetooth"]>
    <#assign statuses = ["Отклонено", "В рассмотрении", "Опубликовано", "Закрыто"]>
    <div>${offer.title}</div>
    <#if offer.photos?size != 0>
        <#list offer.photos as photo>
            <img src="${photo.getPhotoStr()}" alt="Car photo" width="200px" height="150px">
        </#list>
    </#if>
    <div>Характеристики</div>
    <p>Марка: ${offer.model.make.makeName}</p>
    <p>Модель: ${offer.model.modelName}</p>
    <p>Год: ${offer.year}</p>
    <p>Пробег, км: ${offer.mileage}</p>
    <p>Тип двигателя: ${offer.engine.engineType}</p>
    <p>Объем, л: ${offer.engineCapacity}</p>
    <p>Коробка передач: ${offer.transmission}</p>
    <p>Тип кузова: ${offer.body.bodyType}</p>
    <p>Цвет: ${offer.color.colorName}</p>
    <#list 0..offer.options?length - 1 as i>
        <#if offer.options[i] == '1'>
            <p>${options[i]}: Да</p>
        </#if>
    </#list>
    <p>Описание: ${offer.description!"Нет описания"}</p>
    <p>Область: ${offer.region.regionName}</p>
    <p>Цена: $${offer.price}</p>
    <p>Контактные данные: ${offer.user.name}, +${offer.user.phone}</p>
    <#if offer.status != 1>
        <p>Статус: ${statuses[offer.status + 1]}</p>
    </#if>
    <#if s.isAdmin && (offer.status == 0)>
        <form action="/publication/approve" method="post">
            <input type="hidden" value="${offer.id}" name="offerId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit">Опубликовать</button>
        </form>

        <form action="/publication/delete" method="post">
            <input type="hidden" value="${offer.id}" name="offerId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit">Удалить</button>
        </form>
    </#if>
    <#if offer.status == 1>
        <#if favorite??>
            <form action="/publication/removeFavorite" method="post">
                <input type="hidden" value="${favorite.id}" name="favoriteId">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button type="submit">Удалить из избранного</button>
            </form>
        <#else>
            <form action="/publication/addFavorite" method="post">
                <input type="hidden" value="${offer.id}" name="offerId">
                <input type="hidden" value="${s.userId}" name="userId">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button type="submit">Добавить в избранное</button>
            </form>
        </#if>
        <#if offer.user.id == s.userId>
        <form action="/publication/close" method="post">
            <input type="hidden" value="${offer.id}" name="offerId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit">Закрыть объявление</button>
        </form>
        </#if>
        <form action="/publication/comment" method="post">
            <input type="hidden" value="${offer.id}" name="offerId">
            <input type="hidden" value="${s.userId}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <input type="text" name="comment" placeholder="Оставить комментарий">
            <button type="submit">Отправить</button>
        </form>
        <form action="/publication/comment/delete" method="post">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
        <#list offer.comments as comment>
            <input type="hidden" value="${comment.id}" name="commentId">
            <p>${comment.user.name}, ${comment.publicationTime}</p>
            <p>${comment.text}
                <#if s.isAdmin>
                    <button type="submit"> Удалить</button>
                </#if>
            </p>
        </#list>
        </form>
    </#if>
</@c.page>
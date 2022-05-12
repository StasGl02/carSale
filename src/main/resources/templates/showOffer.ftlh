<#import "header.ftlh" as c>
<#import "loginTemplate.ftlh" as l>
<#import "security.ftlh" as s>

<@c.page>
    <#assign options = ["Кондиционер", "Обогрев сидений", "ABS", "Штатная навигация", "Камера", "Защита от угона",
    "Круиз-контроль", "Bluetooth"]>
    <#assign statuses = ["Отклонено", "В рассмотрении", "Опубликовано", "Закрыто"]>
    <div class="wrapper">
        <#if offer.photos?size != 0>
            <div class="car-img-container">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <#list offer.photos as photo>
                            <div class="swiper-slide"><img src="${photo.getPhotoStr()}" alt="Car photo" /></div>
                        </#list>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </#if>
        <div class="favourite-container">
            <h1 class="title-ad">${offer.title}</h1>
            <#if s.isAdmin && (offer.status == 0)>
                <form action="/publication/approve" method="post">
                    <input type="hidden" value="${offer.id}" name="offerId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" class="delete-favourite">Опубликовать</button>
                </form>
                <form action="/publication/delete" method="post">
                    <input type="hidden" value="${offer.id}" name="offerId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" class="delete-favourite">Удалить</button>
                </form>
            </#if>
            <#if offer.status == 1>
                <#if favorite??>
                    <form action="/publication/removeFavorite" method="post">
                        <input type="hidden" value="${favorite.id}" name="favoriteId" />
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="delete-favourite">Удалить из избранного</button>
                    </form>
                <#else>
                    <form action="/publication/addFavorite" method="post">
                        <input type="hidden" value="${offer.id}" name="offerId">
                        <input type="hidden" value="${s.userId}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="delete-favourite">Добавить в избранное</button>
                    </form>
                </#if>
                <#if offer.user.id == s.userId>
                    <form action="/publication/close" method="post">
                        <input type="hidden" value="${offer.id}" name="offerId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="delete-favourite">Закрыть объявление</button>
                    </form>
                </#if>
            </#if>
        </div>
        <h2 class="characteristics-title" style="margin-bottom: 20px">Характеристики:</h2>
        <div class="characteristics">
            <p class="characteristic">Марка: ${offer.model.make.makeName}</p>
            <p class="characteristic">Модель: ${offer.model.modelName}</p>
            <p class="characteristic">Год: ${offer.year}</p>
            <p class="characteristic">Пробег, км: ${offer.mileage}</p>
            <p class="characteristic">Тип двигателя: ${offer.engine.engineType}</p>
            <p class="characteristic">Объем, л: ${offer.engineCapacity}</p>
            <p class="characteristic">Коробка передач: ${offer.transmission}</p>
            <p class="characteristic">Тип кузова: ${offer.body.bodyType}</p>
            <p class="characteristic">Цвет: ${offer.color.colorName}</p>
            <#list 0..offer.options?length - 1 as i>
                <#if offer.options[i] == '1'>
                    <p class="characteristic">${options[i]}: Да</p>
                </#if>
            </#list>
            <p class="characteristic">Область: ${offer.region.regionName}</p>
            <p class="characteristic">Цена: $${offer.price}</p>
            <#if offer.status != 1>
                <p class="characteristic">Статус: ${statuses[offer.status + 1]}</p>
            </#if>
        </div>
        <h2 class="characteristics-title">Описание:</h2>
        <p class="characteristics-ad-car">${offer.description!"Нет описания"}</p>
            <h2 class="characteristics-title characteristics-phone">Контактные данные: ${offer.user.name}, +${offer.user.phone}</h2>
            <#if offer.status == 1>
                <form action="/publication/comment" method="post">
                    <input type="hidden" value="${offer.id}" name="offerId" />
                    <input type="hidden" value="${s.userId}" name="userId" />
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <textarea class="leave-comment" type="text" name="comment" placeholder="Оставить комментарий" cols="50" rows="7"></textarea>
                    <button type="submit" class="submit-comment" style="margin-bottom: 15px">Отправить</button>
                </form>
                <#if offer.comments?size != 0>
                <form action="/publication/comment/delete" method="post">
                    <div class="comment">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <#list offer.comments as comment>
                            <input type="hidden" value="${comment.id}" name="commentId" />
                            <p>${comment.user.name}, ${comment.publicationTime}</p>
                            <p>${comment.text}</p>
                            <#if s.isAdmin>
                                <button type="submit" class="delete-comment"> Удалить</button>
                            </#if>
                        </#list>
                    </div>
                </form>
                </#if>
            </#if>
    </div>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        let swiperContainer = document.querySelector('.swiper');
        swiperContainer.onmousedown = (e) => {
            if (window.event.stopPropagation) window.event.stopPropagation();
            window.event.cancelBubble = true;
            e.cancelBubble = true;
        };
        let swiper = new Swiper('.mySwiper', {
            loop: true,
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>
</@c.page>
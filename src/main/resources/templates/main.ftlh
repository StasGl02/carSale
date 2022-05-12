<#import "parts/common.ftlh" as c>

<@c.page>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#makeId').on("change", function() {
                let makeId = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: '/search/loadModelsByMake/' + makeId,
                    success: function (result) {
                        let res = JSON.parse(result);
                        let option = '';
                        for (let i = 0; i < res.length; i++) {
                            option += "<option value='" + res[i].id + "'>" + res[i].modelName + "</option>";
                        }
                        $('#modelId').html(option);
                    }
                });
            });
        });
    </script>
    <#if springMacroRequestContext.requestUri?ends_with("/") || springMacroRequestContext.requestUri?contains("/search")>
    <form action="/search" method="post">
        <select name="make" id="makeId">
            <option disabled selected value=0>Марка</option>
            <#list makes as make>
                <option name="make" value="${make.id}">${make.makeName}</option>
            </#list>
        </select>

        <select name="model" id="modelId">
            <option disabled selected value=0>Модель</option>
        </select>

        <select name="color">
            <option disabled selected value=0>Цвет</option>
            <#list colors as color>
                <option name="color" value="${color.id}">${color.colorName}</option>
            </#list>
        </select>

        <select name="engine">
            <option disabled selected value=0>Тип двигателя</option>
            <#list engines as engine>
                <option name="engine" value="${engine.id}">${engine.engineType}</option>
            </#list>
        </select>

        <p>Пробег, км</p>
        <input type="number" name="mileageFrom" placeholder="От">
        <input type="number" name="mileageTo" placeholder="До">

        <input type="number" name="priceFrom" placeholder="Цена, $ От">
        <input type="number" name="priceTo" placeholder="Цена, $ До">
        <button type="submit">Найти</button>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </form>
    </#if>

    <#if offers?size == 0>
        <p>Нет объявлений</p>
    <#else>
    <#list offers as offer>
        <a href="/publication/${offer.id}">
        <#if offer.photos?size != 0>
            <img src="${offer.photos[0].getPhotoStr()}" alt="Car photo" width="200px" height="150px">
        </#if>
        <div>${offer.title}</div>
        <div>${offer.region.regionName}</div>
        <div>${offer.price}</div>
        </a>
    </#list>
    </#if>
</@c.page>
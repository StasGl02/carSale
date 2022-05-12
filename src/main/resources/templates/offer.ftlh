<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<#include "parts/security.ftlh">

<@c.page>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#makeId').on("change", function() {
                let makeId = $(this).val();
                $.ajax({
                   type: 'GET',
                   url: '/offer/loadModelsByMake/' + makeId,
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
    <form action="/offer" method="post" enctype="multipart/form-data">
        <input type="file" name="photos" multiple accept="image/*">
        <input type="text" name="title" placeholder="Название объявления" required>

        <select name="make" id="makeId" required>
            <option disabled selected value="">Марка</option>
            <#list makes as make>
                <option name="make" value="${make.id}">${make.makeName}</option>
            </#list>
        </select>

        <select name="model" id="modelId" required>
            <option disabled selected value="">Модель</option>
        </select>

        <select name="body" required>
            <option disabled selected value="">Тип кузова</option>
            <#list bodies as body>
                <option name="body" value="${body.id}">${body.bodyType}</option>
            </#list>
        </select>

        <select name="color" required>
            <option disabled selected value="">Цвет</option>
            <#list colors as color>
                <option name="color" value="${color.id}">${color.colorName}</option>
            </#list>
        </select>

        <select name="engine" required>
            <option disabled selected value="">Тип двигателя</option>
            <#list engines as engine>
                <option name="engine" value="${engine.id}">${engine.engineType}</option>
            </#list>
        </select>

        <p>Коробка передач</p>
        <input type="radio" name="transmission" value="automatic" checked>Автомат
        <input type="radio" name="transmission" value="mechanic">Механика

        <p>Объем, л</p>
        <input type="number" min="1" max="10" step="0.1" value="2.0" name="engineCapacity" required>

        <p>Год</p>
        <input type="number" min="1950" max="2022" value="2022" name="year" required>
        
        <p>Пробег, км</p>
        <input type="number" name="mileage" required>

        <input type="number" name="price" placeholder="Цена, $" required>

        <select name="region" required>
            <option disabled selected value="">Область</option>
            <#list regions as region>
                <option name="region" value="${region.id}">${region.regionName}</option>
            </#list>
        </select>

        <input type="checkbox" name="checkboxes" value="1">Кондиционер
        <input type="checkbox" name="checkboxes" value="2">Обогрев сидений
        <input type="checkbox" name="checkboxes" value="3">ABS
        <input type="checkbox" name="checkboxes" value="4">Штатная навигация
        <input type="checkbox" name="checkboxes" value="5">Камера
        <input type="checkbox" name="checkboxes" value="6">Защита от угона
        <input type="checkbox" name="checkboxes" value="7">Круиз-контроль
        <input type="checkbox" name="checkboxes" value="8">Bluetooth

        <p>Описание</p>
        <textarea name="description" cols="50" rows="7"></textarea>

        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Опубликовать</button>
    </form>
</@c.page>

<#import "header.ftlh" as c>
<#import "loginTemplate.ftlh" as l>
<#include "security.ftlh">

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
    <div class="wrapper">
        <div class="container cars">
            <form action="/offer" method="post" enctype="multipart/form-data">
                <div class="filters">
                <div class="select">
                    <select name="make" id="makeId" required>
                        <option disabled selected value="">Марка</option>
                        <#list makes as make>
                            <option name="make" value="${make.id}">${make.makeName}</option>
                        </#list>
                    </select>
                </div>
                <div class="select">
                    <select name="model" id="modelId" required>
                        <option disabled selected value="">Модель</option>
                    </select>
                </div>
                <div class="select">
                    <select name="body" required>
                        <option disabled selected value="">Тип кузова</option>
                        <#list bodies as body>
                            <option name="body" value="${body.id}">${body.bodyType}</option>
                        </#list>
                    </select>
                </div>

                <div class="select">
                    <select name="color" required>
                        <option disabled selected value="">Цвет</option>
                        <#list colors as color>
                            <option name="color" value="${color.id}">${color.colorName}</option>
                        </#list>
                    </select>
                </div>
                <div class="select">
                    <select name="engine" required>
                        <option disabled selected value="">Тип двигателя</option>
                        <#list engines as engine>
                            <option name="engine" value="${engine.id}">${engine.engineType}</option>
                        </#list>
                    </select>
                </div>
                <div class="range">
                    <p>Объем, л</p>
                    <input type="number" min="1" max="10" step="0.1" value="2.0" name="engineCapacity" required />
                </div>
                <div class="range">
                    <p>Год</p>
                    <input type="number" min="1950" max="2022" value="2022" name="year" required />
                </div>
                <div class="range">
                    <p>Пробег, км</p>
                    <input type="number" name="mileage" required />
                </div>
                <div class="range">
                    <p>Цена</p>
                    <input type="number" name="price" placeholder="Цена, $" required />
                </div>
                <div class="select select-region">
                    <select name="region" required>
                        <option disabled selected value="">Область</option>
                        <#list regions as region>
                            <option name="region" value="${region.id}">${region.regionName}</option>
                        </#list>
                    </select>
                </div>
                <div class="transmission">
                    <p class="transmission-text">Коробка передач</p>
                    <div class="transmission-first">
                        <input type="radio" id="transmission-first" name="transmission" value="automatic" checked />
                        <span id="transmission-first-name">Автомат</span>
                    </div>
                    <div class="transmission-second">
                        <input type="radio" id="transmission-second" name="transmission" value="mechanic" />
                        <span id="transmission-second-name">Механика</span>
                    </div>
                    <div class="range">
                        <p>Название объявления</p>
                        <input type="text" name="title" required>
                    </div>
                    <br>
                    <div>
                        <input type="file" name="photos" multiple accept="image/*">
                    </div>
                </div>
                <div class="checkbox">
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="1" />
                        <span class="checkbox-label">Кондиционер</span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="2" />
                        <span class="checkbox-label"> Обогрев сидений</span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="3" />
                        <span class="checkbox-label">ABS</span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="4" />
                        <span class="checkbox-label">Штатная навигация</span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="5" />
                        <span class="checkbox-label">Камера </span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="6" />
                        <span class="checkbox-label">Защита от угона</span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="7" />
                        <span class="checkbox-label"> Круиз-контроль </span>
                    </div>
                    <div class="checkbox__container">
                        <input type="checkbox" name="checkboxes" value="8" />
                        <span class="checkbox-label">Bluetooth</span>
                    </div>
                </div>
                <div class="textarea-container">
                    <p class="textarea-text">Описание</p>
                    <textarea class="car-description" name="description" cols="50" rows="7"></textarea>
                </div>
                </div>
                <div class="btn-row">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" class="submit-btn">Опубликовать</button>
                </div>
            </form>
            <div class="sort-row"></div>
            <div class="cards-container"></div>
        </div>
    </div>
</@c.page>

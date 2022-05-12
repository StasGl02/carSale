<#import "header.ftlh" as c>

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
    <div class="wrapper">
      <div class="container cars">
        <#if springMacroRequestContext.requestUri?ends_with("/")
        || springMacroRequestContext.requestUri?contains("/search")
        || springMacroRequestContext.requestUri?contains("/filter")>
        <form action="/search" method="post">
          <div class="filters">
          <div class="select">
            <select name="make" id="makeId">
              <option disabled selected value=0>Марка</option>
              <#list makes as make>
                <option name="make" value="${make.id}">${make.makeName}</option>
              </#list>
            </select>
          </div>
          <div class="select">
            <select name="model" id="modelId">
              <option disabled selected value="0">Модель</option>
            </select>
          </div>
          <div class="select">
            <select name="color">
              <option disabled selected value="0">Цвет</option>
              <#list colors as color>
                <option name="color" value="${color.id}">${color.colorName}</option>
              </#list>
            </select>
          </div>
          <div class="select">
            <select name="engine">
              <option disabled selected value="0">Тип двигателя</option>
              <#list engines as engine>
                <option name="engine" value="${engine.id}">${engine.engineType}</option>
              </#list>
            </select>
          </div>
          <div class="filter-container">
            <div class="range">
              <input type="number" name="mileageFrom" placeholder="Пробег, км От" />
            </div>
            <div class="range">
              <input type="number" name="mileageTo" placeholder="Пробег, км До" />
            </div>
            <div class="range">
              <input type="number" name="priceFrom" placeholder="Цена, $ От" />
            </div>
            <div class="range">
              <input type="number" name="priceTo" placeholder="Цена, $ До" />
            </div>
          </div>
          <input type="hidden" value="${_csrf.token}" name="_csrf">
          </div>
           <div class="btn-row">
               <button type="submit" class="search-btn">Найти</button>
           </div>
        </form>

        <div class="sort-row">
          <div class="select sort">
              <form action="/filter" method="post">
                <select name="sort" onchange="this.form.submit()">
                  <option disabled selected value="0">Сортировка</option>
                  <option value="byPriceAsc">Дешевые сначала</option>
                  <option name="sort" value="byPriceDesc">Дорогие сначала</option>
                  <option name="sort" value="byYearDesc">Новые сначала</option>
                  <option name="sort" value="byYearAsc">Старые сначала</option>
                  <option name="sort" value="byMileage">По пробегу</option>
                </select>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
              </form>
          </div>
        </div>
      </#if>
      <#if offers?size == 0>
      <p>Нет объявлений</p>
      <#else>
        <div class="cards-container">
          <#list offers as offer>
          <a href="/publication/${offer.id}" class="card">
            <div class="img-container">
              <#if offer.photos?size != 0>
              <img src="${offer.photos[0].getPhotoStr()}" alt="Car photo" class="card__img">
              </#if>
            </div>
            <div class="description">
              <div class="car-model">${offer.model.make.makeName} ${offer.model.modelName}</div>
              <div class="car-characteristics">${offer.year} год, ${offer.engine.engineType}</div>
              <div class="car-location">${offer.region.regionName}</div>
              <div class="car-price">$${offer.price}</div>
            </div>
          </a>
          </#list>
        </div>
        </#if>
      </div>
    </div>
</@c.page>
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
    <div class="wrapper">
      <div class="container cars">
        <#if springMacroRequestContext.requestUri?ends_with("/") || springMacroRequestContext.requestUri?contains("/search")>
        <form class="filters" action="/search" method="post">
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
        <div class="btn-row">
          <button type="submit" class="search-btn">Найти</button>
        </div>
        </form>
        <div class="sort-row">
          <div class="select sort">
            <select name="sort">
              <option selected value="0">Дорогие сначала</option>
              <option name="sort" value="1">Дешевые сначала</option>
              <option name="sort" value="2">Новые сначала</option>
              <option name="sort" value="3">Старые сначала</option>
              <option name="sort" value="4">По пробегу</option>
            </select>
          </div>
        </div>
      </#if>
      <#if offers?size == 0>
      <p>Нет объявлений</p>
      <#else>
      <#list offers as offer>
        <div class="cards-container">
          <a href="/publication/${offer.id}" class="card">
            <div class="img-container">
              <svg
                class="like"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                width="28"
                height="28"
                viewBox="0 0 28 28"
              >
                <defs>
                  <path
                    id="prefix__a"
                    d="M11.862 20.896l-1.72-1.503C4.033 14.075 0 10.568 0 6.263 0 2.756 2.87 0 6.524 0c2.064 0 4.045.922 5.338 2.38C13.155.922 15.136 0 17.2 0c3.654 0 6.524 2.756 6.524 6.263 0 4.305-4.033 7.812-10.142 13.141l-1.72 1.492z"
                  />
                  <path
                    id="prefix__b"
                    d="M11.862 20.896l-1.72-1.503C4.033 14.075 0 10.568 0 6.263 0 2.756 2.87 0 6.524 0c2.064 0 4.045.922 5.338 2.38C13.155.922 15.136 0 17.2 0c3.654 0 6.524 2.756 6.524 6.263 0 4.305-4.033 7.812-10.142 13.141l-1.72 1.492z"
                  />
                </defs>
                <g fill="none" fill-rule="evenodd" transform="translate(2 4)">
                  <use class="like-hover" fill="#000" fill-rule="nonzero" opacity=".2" xlink:href="#prefix__a" />
                  <use fill-rule="nonzero" stroke="#FFF" stroke-width="2" xlink:href="#prefix__b" />
                </g>
              </svg>
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
        </div>
        </#list>
        </#if>
      </div>
    </div>
</@c.page>
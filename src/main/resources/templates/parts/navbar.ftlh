<#include "security.ftlh">
<#import "login.ftlh" as l>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if name != "">
        <button class="btn btn-primary ml-3" type="submit">Выйти</button>
        </#if>
    </form>
</#macro>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Car Sale</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Главная</a>
                </li>
                <#if userId??>
                    <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/offer">Опубликовать объявление</a>
                </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/favorite/${userId}">Избранное</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/publication/myPublications/${userId}">Мои объявления</a>
                    </li>
                </#if>
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/user">Пользователи</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/publication/unreviewed">Модерация объявлений</a>
                </li>
                </#if>
            </ul>

            <div class="navbar-text mr-10">${name}</div>
                <@logout/>
        </div>
     </div>
</nav>
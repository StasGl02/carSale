<#include "security.ftlh">
<#import "loginTemplate.ftlh" as l>

<header class="header">
    <div class="header-container">
        <div class="first-row">
            <a class="logo" href="/">
                <div class="logo-svg" href="/"></div>
                <h1 class="logo-title">Car Sale</h1>
            </a>
            <div class="login-form">
            <#if userId??>
                <div class="user">${name}</div>
                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="user-btn" type="submit">Выйти</button>
                </form>
            <#else>
                <form action="/login" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="user-btn" type="submit">Войти</button>
                </form>
            </#if>
            </div>
        </div>
        <div class="second-row">
            <nav class="navigation">
                <ul class="nav-custom">
                    <li class="nav-item">
                        <a class="nav-link-custom" aria-current="page" href="/">Главная</a>
                    </li>
                    <#if userId??>
                        <li class="nav-item">
                            <a class="nav-link-custom" aria-current="page" href="/offer">Опубликовать объявление</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link-custom" aria-current="page" href="/favorite/${userId}">Избранное</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link-custom" aria-current="page" href="/publication/myPublications/${userId}">Мои объявления</a>
                        </li>
                    </#if>
                    <#if isAdmin>
                        <li class="nav-item">
                            <a class="nav-link-custom" aria-current="page" href="/user">Пользователи</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link-custom" aria-current="page" href="/publication/unreviewed">Модерация объявлений</a>
                        </li>
                    </#if>
                </ul>
            </nav>
        </div>
    </div>
</header>
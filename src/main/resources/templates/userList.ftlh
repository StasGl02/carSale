<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    Список пользователей
<table class="table table-hover">
    <thead>
    <tr>
        <th>Логин</th>
        <th>Доступ</th>
        <th>Имя</th>
        <th>Телефон</th>
    </tr>
    </thead>

    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td>
                <#list user.role as role>
                    ${role}<#sep>,
                </#list>
            </td>
            <td>
                ${user.name!}

            </td>
            <td>${user.phone!}</td>
            <td><a href="/user/${user.id}/edit">Редактировать</a></td>
            <td>
            <#if user.id != userId>
                <a href="/user/${user.id}/delete">Удалить</a>
            </#if>
            </td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>
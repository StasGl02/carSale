<#import "header.ftlh" as c>
<#include "security.ftlh">

<@c.page>
<table class="table table-light table-striped table-hover">
    <thead>
    <tr>
        <th>Логин</th>
        <th>Имя</th>
        <th>Телефон</th>
        <th>Редактирование</th>
        <th>Удаление</th>
        <th>Роль</th>
    </tr>
    </thead>

    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
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
            <td>
                <#list user.role as role>
                    ${role}<#sep>,
                </#list>
            </td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>
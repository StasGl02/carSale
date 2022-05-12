<#import "header.ftlh" as c>
<#import "loginTemplate.ftlh" as l>

<@c.page>
    <form action="/user/delete" method="post">
        <div style="margin-left: 30px">
            <div class="range">
                <span>Логин:</span>
                <input disabled type="text" value="${user.username!}" name="username" required/>
            </div>
            <div class="range">
                <span>Имя:</span>
                <input disabled type="text" value="${user.name!}" name="name" required/>
            </div>
            <div class="range">
                <span>Номер телефона:</span>
                <input disabled type="text" value="${user.phone!}" name="phone" placeholder="375XXXXXXXXX" required
                           pattern="375[0-9]{9}"/>
            </div>

            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">

            <button class="user-btn" type="submit" style="margin-top: 10px">Удалить</button>
        </div>
    </form>
</@c.page>
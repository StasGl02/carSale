<#import "header.ftlh" as c>
<#import "loginTemplate.ftlh" as l>

<@c.page>
    <form action="/user/edit" method="post">
        <div>
            <div class="range" style="margin-bottom: 10px">
                Логин:
                <input type="text" value="${user.username}" name="username" required/>
            </div>
            <div class="range">
                Имя:
                <input type="text" value="${user.name}" name="name" required/>
            </div>
            <div class="range" style="margin: 10px 0">
                Номер телефона:
                <input type="text" value="${user.phone}" name="phone" placeholder="375XXXXXXXXX" required
                           pattern="375[0-9]{9"/>
            </div>
        </div>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">

        <button class="user-btn" style="width: 180px" type="submit">Сохранить изменения</button>
    </form>
</@c.page>
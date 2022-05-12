<#macro registration>
    <form action="/registration" method="post">
        <div style="margin-left: 30px">
            <div class="range" style="margin-top: 10px">
                Логин:
                <input type="text" name="username" required/>
            </div>
            <div class="range" style="margin: 10px 0">
                Пароль:
                <input type="password" name="password" required minlength="3"/>
            </div>
            <div class="range">
                Имя:
                <input type="text" name="name" required/>
            </div>
            <div class="range" style="margin: 10px 0">
                Номер телефона:
                <input type="text" name="phone" placeholder="375XXXXXXXXX" required
                           pattern="375[0-9]{9}"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button class="user-btn" style="width: 175px" type="submit">Зарегистрироваться</button>
        </div>
    </form>
</#macro>
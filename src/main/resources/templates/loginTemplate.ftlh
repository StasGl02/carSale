<#macro login path>
    <form action="${path}" method="post">
        <div style="margin-left: 30px">
            <div class="range">
                <p> Логин: </p>
                <input type="text" name="username" class="form-control" placeholder="Логин" required/>
            </div>
            <div class="range">
                <p> Пароль: </p>
                <input type="password" name="password" class="form-control" placeholder="Пароль" required/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div style="margin-top: 10px">
                <a href="/registration">Регистрация</a>
                <button class="user-btn" type="submit">Войти</button>
            </div>
        </div>
    </form>
</#macro>

<#macro main>
    <form action="/" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Выйти</button>
    </form>
</#macro>
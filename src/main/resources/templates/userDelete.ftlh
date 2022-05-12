<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <form action="/user/delete" method="post">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label"> Логин: </label>
            <div class="col-sm-3">
                <input disabled type="text" value="${user.username!}" name="username" class="form-control" placeholder="Логин" required/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label"> Имя: </label>
            <div class="col-sm-3">
                <input disabled type="text" value="${user.name!}" name="name" class="form-control" placeholder="Имя" required/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label"> Номер телефона: </label>
            <div class="col-sm-3">
                <input disabled type="text" value="${user.phone!}" name="phone" class="form-control" placeholder="375XXXXXXXXX" required
                       pattern="375[0-9]{9}"/>
            </div>
        </div>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">

        <button type="submit">Удалить</button>
    </form>
</@c.page>
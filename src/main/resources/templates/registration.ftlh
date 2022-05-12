<#import "header.ftlh" as c>
<#import "registrationTemplate.ftlh" as r>

<@c.page>
    <div>${message!}</div>
    <div style="margin-left: 30px; margin-top: 10px; margin-bottom: 10px; font-size: 20px;">
        Регистрация
    </div>
<@r.registration/>
</@c.page>
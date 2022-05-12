<#import "parts/common.ftlh" as c>
    <#import "parts/common.ftlh" as l>
<#import "parts/registration.ftlh" as r>

<@c.page>
    <div>${message!}</div>
    Регистрация
<@r.registration/>
</@c.page>
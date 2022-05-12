<#macro page>
    <!DOCTYPE html>
    <html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Car Sale</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../css/custom.css" />
    <link rel="stylesheet" href="../../css/normalize.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
    <link rel="shortcut icon" href="../../img/favicon.ico" />
    <link rel="icon" type="image/vnd.microsoft.icon" href="../../img/favicon.ico" />
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico" />
    <link rel="icon" href="../../img/favicon.ico" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
</head>
<body>
<#include "navbar.ftlh">
<div class="container mt-5">
<#nested>
</div>
</body>
</html>
</#macro>
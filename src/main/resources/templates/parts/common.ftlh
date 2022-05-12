<#macro page>
    <!DOCTYPE html>
    <html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Car Sale</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
    <link rel="shortcut icon" href="img/favicon.ico" />
    <link rel="icon" type="image/vnd.microsoft.icon" href="img/favicon.ico" />
    <link rel="icon" type="image/x-icon" href="img/favicon.ico" />
    <link rel="icon" href="img/favicon.ico" />
</head>
<body>
<#include "navbar.ftlh">
<div class="container mt-5">
<#nested>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
</#macro>
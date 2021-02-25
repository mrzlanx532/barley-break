<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Пятнашки</title>
</head>
<body>
@csrf
<div id="app"></div>
@yield('js')
</body>
</html>

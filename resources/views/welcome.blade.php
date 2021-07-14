<!DOCTYPE html>
<html class="h-full" lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ $seo['title'].' '.$seo['suffix'] }}</title>
        <meta name="description" content ="{{ $seo['description'] }}"

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

        <!-- Styles -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    </head>
    <body class="h-full bg-primary-light m-0">
        <div id="app" class="h-full m-0">
            <home class="h-full m-0"/>
        </div>
        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>

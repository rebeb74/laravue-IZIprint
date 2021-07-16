<!DOCTYPE html>
<html class="h-full" lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ $seo['title'].' '.$seo['suffix'] }}</title>
        <meta name="description" content ="{{ $seo['description'] }}" />
        <meta property="og:type" content="website" />
        <meta property="og:title" content="{{ $seo['title'] }}" />
        <meta property="og:description" content="{{ $seo['description'] }}" />
        <meta property="og:url" content="https://iziprint.re" />
        <meta property="og:image" content="{{ $seo['social_image']['thumb_url'] }}" />
        <meta property="og:determiner" content="auto" />
        <meta property="og:locale" content="fr_FR" />
        <meta property="og:site_name" content="IZIprint" />
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content="{{ $seo['title'] }}" />
        <meta name="twitter:description" content="{{ $seo['description'] }}" />
        <meta name="twitter:image" content="{{ $seo['social_image']['thumb_url'] }}" />

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

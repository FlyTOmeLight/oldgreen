<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	{{--favicon.ico--}}
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" href="/site.webmanifest">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
	{{-- CSRF-TOKEN --}}
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<title>@yield('title', 'OLDGreen') - SWAGSHOP</title>
	{{-- 样式 --}}
	<link rel="stylesheet" href="{{ mix('css/app.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ asset('css/exzoom.css') }}">
</head>
<body>
	<div id="app" class="{{ route_class() }}-page">
		@include('layouts._header')
		<div class="container">
			@yield('content')
		</div>
		@include('layouts._footer')
	</div>
	{{-- js脚本 --}}
	<script src="{{ mix('js/app.js') }}"></script>
	@yield('scriptAfterJs')
</body>
</html>
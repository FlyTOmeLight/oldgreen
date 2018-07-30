<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	{{-- CSRF-TOKEN --}}
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<title>@yield('title', 'OLDGreen') - SWAGSHOP</title>
	{{-- 样式 --}}
	<link rel="stylesheet" href="{{ mix('css/app.css') }}">
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
</body>
</html>
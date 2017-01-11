<!DOCTYPE html>

<!--[if !IE]><!-->
<html lang="$ContentLocale">
<!--<![endif]-->
<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->
<head>
    <% base_tag %>
    <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    $MetaTags(false)
    <% require themedCSS('normalize') %>
    <% require themedCSS('webflow') %>
    <% require themedCSS('seagro.webflow') %>
	<% require themedCSS('bootstrap.min') %>
    <% require themedCSS('site') %>
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
    <script type="text/javascript">
        WebFont.load({
            google: {
                families: ["Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic","Raleway:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic"]
            }
        });
    </script>
    <% require javascript('themes/seagro/javascript/modernizr.js') %>
    <link href="https://daks2k3a4ib2z.cloudfront.net/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link href="https://daks2k3a4ib2z.cloudfront.net/img/webclip.png" rel="apple-touch-icon">
</head>
<body class="fondo <% if $ClassName != 'HomePage' %> interna <% else_if $Title != 'Inicio' %> interna <% end_if %>">
	$Form
	<% include Navbar %>
	$Layout
    <% include Footer %>
    <% require javascript('https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js') %>
    <% require javascript('themes/seagro/javascript/webflow.js') %>
	<% require javascript('themes/seagro/javascript/bootstrap.min.js') %>
</body>
</html>

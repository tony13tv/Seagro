<html>
<head>
    <style>
        table, th, td {
            border: 1px solid #dcdcdc;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h3>Nombre</h3>
	$Name
<br/>
<h3>Correo electrónico</h3>
	$Email
<br/>
<h3>Comentarios</h3>
<p>$Comment<p>
    <br/>
    <br/>
<hr>

<table style="width: 100%;">
    <thead>
    <tr>
        <th>Producto</th>
        <th>Codigo</th>
        <th>Cantidad</th>
    </tr>
    </thead>
	<% loop $Products %>
        <tr>
            <td>$Title</td>
            <td>$Code</td>
            <td>$Qty</td>
        </tr>
	<% end_loop %>
</table>
</body>
</html>

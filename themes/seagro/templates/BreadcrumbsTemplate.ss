<%-- Loop is all on one line to prevent whitespace bug in older versions of IE --%>
<% if $Pages %>
	<% loop $Pages %>
		<% if not $Last %>
			<% if not Up.Unlinked %>
				<a href="$Link" class="breadcrumb-$Pos breadcrumb">
			<% end_if %>
			$MenuTitle.XML
			<% if not Up.Unlinked %>
				</a>
			<% end_if %>
			.
		<% end_if %>
	<% end_loop %>
<% end_if %>

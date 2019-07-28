<cfscript>
	spec           = args.spec ?: {};
	tags           = spec.tags ?: [];
	authentication = renderView( view="/dataApiHtmlDocs/_authenticationInfo", args=args )
	args.hasAuth   = Len( Trim( authentication ) );
</cfscript>

<cfoutput>
<!DOCTYPE html>
<html>
	<head>
		<title>#( spec.info.title ?: 'API' )# #( spec.info.version ?: '1.0.0')#</title>
		<style>
			<cfinclude template="htmlDocsCss.css" />
		</style>
	</head>
	<body class="api-doc">
		<div class="api-doc-toc">
			<div class="api-doc-toc-inner">
				#renderView( view="/dataApiHtmlDocs/_toc", args=args )#
			</div>
		</div>
		<div class="api-doc-content">
			<div class="api-doc-content-inner">
				#renderView( view="/dataApiHtmlDocs/_headerInfo", args=args )#
				#authentication#
				<cfloop array="#tags#" index="i" item="tag">
					#renderView( view="/dataApiHtmlDocs/_tag", args={ spec=spec, tag=tag } )#
				</cfloop>
			</div>
		</div>
	</body>
</html>
</cfoutput>
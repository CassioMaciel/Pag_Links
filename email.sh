#!/bin/bash
read TRIPA
EMAIL_TO=$(echo -e $(echo $TRIPA | sed 's/%/\\x/g') | tr '&+' '\n ' | grep EMAIL_TO= | sed -r 's/(.*)=(.*)/\"\2\"/g')  
REDIRECT=$(echo -e $(echo $TRIPA | sed 's/%/\\x/g') | tr '&+' '\n ' | grep REDIRECT= | sed -r 's/(.*)=(.*)/\"\2\"/g')
NOME=$(echo -e $(echo $TRIPA | sed 's/%/\\x/g') | tr '&+' '\n ' | grep NOME= | sed -r 's/(.*)=(.*)/\"\2\"/g')
EMAIL_FROM=$(echo -e $(echo $TRIPA | sed 's/%/\\x/g') | tr '&+' '\n ' | grep EMAIL_FROM= | sed -r 's/(.*)=(.*)/\2/g' )
MENSAGEM=$(echo -e $(echo $TRIPA | sed 's/%/\\x/g') | tr '&+' '\n ' | grep MENSAGEM= | sed -r 's/(.*)=(.*)/\2/g')
echo -e "De:$EMAIL_FROM \n\n $MENSAGEM" | mail -s "E-mail via Site" contato@grupolit.com.br 
echo "Content-type: text/html"
echo 
echo "
<!DOCTYPE html>
<html lang=\"pt-br\">
<head>
<meta charset=\"utf-8\">
<title>LIT SOLUÇÕES INDUSTRIAIS - Especialista em refrigeração por amônia</title>
<style media=\"screen\" type=\"text/css\">
@font-face {
	font-family:'FuturaPT-Book';
	src: url('../fonts/FuturaPT-Book_gdi.eot');
	src: url('../fonts/FuturaPT-Book_gdi.eot?#iefix') format('embedded-opentype'),
		url('../fonts/FuturaPT-Book_gdi.woff') format('woff'),
		url('../fonts/FuturaPT-Book_gdi.ttf') format('truetype'),
		url('../fonts/FuturaPT-Book_gdi.svg#FuturaPT-Book') format('svg');
}
@font-face {
	font-family:'futurastd-bold';
	src: url('../fonts/futurastd-bold.eot');
	src: url('../fonts/futurastd-bold.eot?#iefix') format('embedded-opentype'),
		url('../fonts/futurastd-bold.woff') format('woff'),
		url('../fonts/futurastd-bold.ttf') format('truetype'),
		url('../fonts/futurastd-bold.svg#FuturaPT-Book') format('svg');
}
.frase-centro{
position:absolute;
top: 100px;
width: 90% ;
margin: 40px;
}
.frase-centro h1{
color: rgb(255,255,255);
font-size: 40pt;
text-shadow: 0px 0px 20px rgb(0,0,0)
}
body{
background-color: rgba(51,47,153,1);
margin: 0px;
padding: 0px;
}

/*formatação do menu*/
.menu{
display: block;
position:absolute;
border: 2px solid rgba(255,255,255,1);
height: 50px ;
width: 50%;
}
.fonte{
text-transform: uppercase;
text-decoration: none;
font-family: 'FuturaPT-Book';
font-weight: bolder;
color: rgba(255,255,255,1); 
}
.menuli{
display: inline;
padding: 35px;
}
header.menu{
top: 0px;
left: 0%;
border-radius: 0px 0px 50px 0px;
}
footer.menu{
transform: translate(0%, -100%);
top: 100%;
left: 50%;
border-radius: 50px 0px 0px 0px;
}
body{ 
background-image: url(\"../_imagens/selowhite.png\");
background-size: 450px 450px;
background-repeat: no-repeat;
background-attachment: fixed;
background-position: center 50%;
overflow:hidden; /*não ter scrow */
}
</style>
</head>
<body>
<header class=\"menu\">
		<nav >
		<ul>
			<li class=\"menuli\"><a class=\"fonte\" href=\"index.html\" target=\"_self\">Home</a></li>
			<li class=\"menuli\"><a class=\"fonte\" href=\"equipe.html\" target=\"_self\">Equipe</a></li>
			<li class=\"menuli\"><a class=\"fonte\" href=\"./servicos.html\" target=\"_self\">Serviços</a></li>
			<li class=\"menuli\"><a class=\"fonte\" href=\"contato.html\" target=\"_self\">Contato</a></li>
		</ul>
		</nav>
</header>
<div class="frase-centro"><h1>Muito obrigado. Seu e-mail foi enviado e logo entraremos em contato</div>
<footer class=\"menu\">
<ul>
			<li class=\"menuli\"><a class=\"fonte\" href=\"http://facebook.com/cursosemvideo\" target=\"_blank\">Facebook</a></li>
			<li class=\"menuli\"><a class=\"fonte\" href=\"http://twitter.com/cursosemvideo\" target=\"_blank\">Twitter</a></li>
			<li class=\"menuli fonte\">Copyright 2013</a></li>
</ul>
</footer>
</body>
</html>"



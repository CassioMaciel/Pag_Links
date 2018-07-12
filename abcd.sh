#!/bin/bash
read TRIPA
TRIPA2=$(echo $TRIPA | sed 's/%/\\x/g') #Faz com que a leitura do Tripa seja em formato mais ou menos humano

echo -e $TRIPA2 | sed 's@+@ @g;s@=checked@@g' | sed -r 's@&@\n@g' | sed -r 's/^$/lala/g' | sed -r 's@(.*)@/\1/s/">/" checked >/g;@g' > ./old/cgi-bin/script.sed #Produz um Script Sed que marca as caixa marcadas anteriormente

echo "Content-type: text/html"
echo "
<!DOCTYPE html>
<html lang=\"pt-br\">
<head>
<meta charset=\"utf-8\">
<title>Links diversos</title>
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
.menus{
background-color: rgba(0,0,0,.5);
display: block;
position:absolute;
top: 5%;
right: 5%;
height: 90% ;
width: 30%;
border: 2px solid rgba(0,0,0,1);
border-radius: 10px 10px 10px 10px;
text-shadow: 0px 0px 5px rgba(255,255,255,1), 0px 0px 3px #0000FF;
}

a:link    {color: #ffffff; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF; }
a:active  {color: #ffffff; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF; }
a:visited {color: #ffffff; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF; }
a:hover   {color: #ffffff; text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF; }

body{ 
background-image: url(\"./old/images/background/extraction-wallpaper-1366x768.jpg\");
background-repeat: no-repeat;
background-attachment: fixed;
background-position: center;
overflow:hidden; /*não ter scrow */
}

</style>
</head>
<body>
<div class=\"menus\">
<form action=\"./abcd.sh\" method=\"POST\">"
  
cat ./old/cgi-bin/banco_links | cut -f1 -d";" | sort | uniq | sed -r 's@(.*)@<input type="checkbox" name="\1" value="checked">\1<br>@g' | sed -f "./old/cgi-bin/script.sed" #Gera todos os Checkbox

echo  "<input type=\"submit\" value=\"Enviar\">
  </form>
</div>"

cat ./old/cgi-bin/banco_links | grep -E "`echo -e $TRIPA2 | sed 's@=checked@@g;s@&@|@g;s@+@ @g'`" | sed -r 's@.*;(.*);(.*)@<a target="_blank" href="\1"> \2 </a><br>@g' #Busca os links no banco de dados, filtra e os coloca no formato html

echo "</body>"

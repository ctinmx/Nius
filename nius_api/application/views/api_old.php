<title> API NIUS </title>
<h3>Categorías Existentes </h3>
<?php
for ($i=0;$i<count($resultado["catego"]);$i++) {
	?>
		<?=$resultado["catego"][$i]["id"]."  / ".$resultado["catego"][$i]["categoria"]."<br>";?>
	<?php
}
?>
<hr>
<h3> Usuario </h3>
	<?=$usuario[0]["id"]." - ".$usuario[0]["nombre"]." ".$usuario[0]["aPaterno"]." ".$usuario[0]["aMaterno"]."<br>Correo: ".$usuario[0]["eMail"]."<br>FB ID: ".$usuario[0]["FbId"]."<br>";?>
<hr>
<article class="articulo textoflotado">
<h3>Le Interesan las categorías:</h3>
<?php
for ($i=0;$i<count($resultado["categous"]);$i++) {
	?>
		<?=$resultado["categous"][$i]["categoria_id"]."<br>";?>

	<?php
}
?>
</article>
<article class="articulo textoflotado">
<hr>
<h3>Tiene Las Siguientes Noticias:</h3>
<?php
for ($i=0;$i<count($resultado["rss"]);$i++) {
		echo "Articulo: ".$resultado["rss"][$i]["id"]." Obtenido de: ".$resultado["rss"][$i]["catalogo_id"]." Categoría: ".$resultado["rss"][$i]["categoria_id"]."<br>";
		echo $resultado["rss"][$i]["title"]."<br>Fuente original: ".$resultado["rss"][$i]["link"]."<br>";
		echo "Resumen: ".$resultado["rss"][$i]["summary"]."<br><br>";
		echo "Texto: ".$resultado["rss"][$i]["description"]."<br><br>";
		echo "Publicado En: ".$resultado["rss"][$i]["pubdate"]."<br><br>";
		$imagen="";
		for ($j=0;$j<count($resultado["images"]);$j++){
			if($resultado["images"][$j]["id_rss"]==$resultado["rss"][$i]["id"]){
				$imagen=$resultado["images"][$j]["imagen_url"];
			}
		}
		if($imagen==""){
			echo "API Busca Imagen";
		}
		else{
			echo "<img src='".$imagen."' />";
		}
		echo "<hr>";

}
?>
</article>

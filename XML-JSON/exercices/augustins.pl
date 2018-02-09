#/usr/bin/perl

# Fichier à traiter
$file = $ARGV[0];

# Ouverture des fichiers d'entrée et de sortie

open (FIC, "<:encoding(utf-8)", $file); 
open (OUT, ">:encoding(utf-8)", "augustins-v4.xml");

# Impression de l'en-tête et de la racine
print OUT "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n" ;
print OUT "<document>\n";

# Lecture du fichier d'entrée ligne à ligne 
# Stockage du résultat dans la variable $fichier
my $fichier = <FIC>;

# Fermeture du fichier d'entrée
close FIC;

# Traitement à réaliser sur les données

while ($fichier =~ m/\[(.+?)\]/g) 
{
	my $texte = $1;

	# Remplacement des entités 
	$texte =~ s/&/&amp;/g;
	$texte =~ s/\\u00e9/é/g;
	$texte =~ s/\\u00e8/è/g;
	$texte =~ s/\\u00e0/à/g;
	$texte =~ s/\\u00e2/â/g;
	$texte =~ s/\\u00f4/ô/g;
	$texte =~ s/\\u00ea/ê/g;
	$texte =~ s/\\u00e7/ç/g;
	$texte =~ s/\\u00a9/&#169;/g;

	# Traitement des oeuvres
	while ($texte =~ /\"fields": \{(.+?)\},/g)
	{
		my $content = $1;
   
		# Traitement du numéro de l'inventaire
		if ($content =~ /\"num_inventaire\": \"(.+?)\"/g)
		{
            $numinv = $1; 
            $numinv =~ s/ /_/g;
            print OUT "\t<oeuvre id=\"inv-augustins-$numinv\">\n"; 
        }
		else 
		{
			print OUT "\t<oeuvre>\n"; 
		}

		# Traitement du contenu 
        while ($content=~m/"(.+?)": "(.+?)"/g)
        {
            $var1 = $1;

			# Nettoyage
			$var1 =~ s/.\", \"//g;
			$var2 = $2; 

			# Suppresion du contenu des images et des vignettes
			if ($var1 =~/(image)/gs)
    		{
				$var1 = "image"; 
    		}
			if ($var1 =~/(thumbnail)/gs)
    		{
				$var1 = "thumbnail"; 
    		}

			# Impression du contenu
			print OUT "\t\t<$var1>$2</$var1>\n";
        }
			# Fin d'une oeuvre
			print OUT "\t</oeuvre>\n\n";
    }
}

# Fin du document
print OUT "\n</document>";

# Fermeture du fichier de sortie
close OUT;
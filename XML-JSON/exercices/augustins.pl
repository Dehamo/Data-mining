#/usr/bin/perl

# Fichier � traiter
$file = $ARGV[0];

# Ouverture des fichiers d'entr�e et de sortie

open (FIC, "<:encoding(utf-8)", $file); 
open (OUT, ">:encoding(utf-8)", "augustins-v4.xml");

# Impression de l'en-t�te et de la racine
print OUT "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n" ;
print OUT "<document>\n";

# Lecture du fichier d'entr�e ligne � ligne 
# Stockage du r�sultat dans la variable $fichier
my $fichier = <FIC>;

# Fermeture du fichier d'entr�e
close FIC;

# Traitement � r�aliser sur les donn�es

while ($fichier =~ m/\[(.+?)\]/g) 
{
	my $texte = $1;

	# Remplacement des entit�s 
	$texte =~ s/&/&amp;/g;
	$texte =~ s/\\u00e9/�/g;
	$texte =~ s/\\u00e8/�/g;
	$texte =~ s/\\u00e0/�/g;
	$texte =~ s/\\u00e2/�/g;
	$texte =~ s/\\u00f4/�/g;
	$texte =~ s/\\u00ea/�/g;
	$texte =~ s/\\u00e7/�/g;
	$texte =~ s/\\u00a9/&#169;/g;

	# Traitement des oeuvres
	while ($texte =~ /\"fields": \{(.+?)\},/g)
	{
		my $content = $1;
   
		# Traitement du num�ro de l'inventaire
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
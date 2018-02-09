#/usr/bin/perl

# Fichiers d'entrée
$file1 = $ARGV[0];
$file2 = $ARGV[1];
$file3 = $ARGV[2];

my $fic = "align";

# Concaténation des fichiers d'entrée
system ("cat $file1 $file2 $file3 > $fic.txt");

# Ouverture en lecture du fichier concaténé
open (FIC, "<:encoding(utf-8)", "$fic.txt"); 

# Ouverture du fichier de sortie
open (OUT, ">:encoding(utf-8)", "align.xml");


print OUT "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n" ;
print OUT "<phrases>\n";

# Lecture ligne à ligne 
while(my $ligne = <FIC>)
{
	$texte .= $ligne;
}

# Recherche et impression du contenu de chaque ligne 
while($texte =~ /([0-9]{4})\n(.+?)\n(.+?)\n(.+?)\n(.+?)\n/g)
{
	print OUT "\t<pair nr=\"$1\">\n";
	print OUT "\t\t<en>$2</en>\n";
	print OUT "\t\t<fr>$3</fr>\n";
	print OUT "\t\t<annot1>$4</annot1>\n";
	print OUT "\t\t<annot2>$5</annot2>\n";
	print OUT "\t</pair>\n";
}

print OUT "</phrases>"; 

# Fermeture des fichiers
close FIC;
close OUT;


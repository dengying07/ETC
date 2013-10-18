#!perl 
use strict;
my($i,$j);
foreach $j(1..9){
  foreach $i(1..9){
    if ($i>=$j)
    {print $i*$j,"\t";}
    else 
    {print "\t";}
                   }
    print "\n";
                 }  
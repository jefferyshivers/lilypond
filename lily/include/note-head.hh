/*
  note-head.hh -- part of GNU LilyPond

  (c) 1996--2000 Han-Wen Nienhuys
*/

#ifndef NOTEHEAD_HH
#define NOTEHEAD_HH

#include "lily-guile.hh"
#include "molecule.hh"

/** ball at the end of the stem. Takes care of:

  * help lines  

  Properties

  style -- symbol that sets note head style

  */

class Note_head 
{
public:
  DECLARE_SCHEME_CALLBACK(brew_molecule, (SCM ));
  static Molecule ledger_line (Interval, Score_element*) ;
  static bool has_interface (Score_element*);
};
#endif // NOTEHEAD_HH


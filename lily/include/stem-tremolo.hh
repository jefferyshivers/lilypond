/*   
  stem-tremolo.hh -- declare Abbreviation
  
  source file of the GNU LilyPond music typesetter
  
  (c)  1997--2000 Han-Wen Nienhuys <hanwen@cs.uu.nl>
  
 */

#ifndef ABBREV_HH
#define ABBREV_HH

#include "lily-proto.hh"
#include "lily-guile.hh"

/*
  stem -- pointer to the stem object.
 */
class Stem_tremolo
{
public:
  static void set_interface (Score_element*);
  static bool has_interface (Score_element*);
  DECLARE_SCHEME_CALLBACK(dim_callback, (SCM smob, SCM axis));
  DECLARE_SCHEME_CALLBACK(brew_molecule, (SCM ));
  static void set_stem (Score_element*me, Score_element *st);
};

#endif /* ABBREV_HH */


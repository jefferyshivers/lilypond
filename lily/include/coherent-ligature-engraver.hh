/*   
  coherent-ligature-engraver.hh -- declare Coherent_ligature_engraver
  
  source file of the GNU LilyPond music typesetter
  
  (c) 2003 Juergen Reuter <reuter@ipd.uka.de>
  
 */
#ifndef COHERENT_LIGATURE_ENGRAVER_HH
#define COHERENT_LIGATURE_ENGRAVER_HH

#include "ligature-engraver.hh"

class Coherent_ligature_engraver : public Ligature_engraver
{

public:
  TRANSLATOR_DECLARATIONS(Coherent_ligature_engraver);

protected:
  virtual void build_ligature (Spanner *ligature,
			       Array<Grob_info> primitives); /* abstract */
  virtual void typeset_ligature (Spanner *ligature,
				 Array<Grob_info> primitives);
  virtual void get_set_column (Item *, Paper_column *);

private:
  void collect_accidentals (Spanner *, Array<Grob_info>);
};

#endif // COHERENT_LIGATURE_ENGRAVER_HH

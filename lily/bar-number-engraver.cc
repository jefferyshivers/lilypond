/*
  bar-number-grav.cc -- implement Bar_number_engraver

  source file of the GNU LilyPond music typesetter

  (c)  1997--2001 Han-Wen Nienhuys <hanwen@cs.uu.nl>
*/


#include "lily-guile.hh"
#include "paper-column.hh"
#include "paper-def.hh"
#include "side-position-interface.hh"
#include "staff-symbol.hh"
#include "item.hh"
#include "moment.hh"
#include "engraver.hh"
#include "translator-group.hh"


class Bar_number_engraver : public Engraver
{
protected:
  Item* text_p_;

protected:
  virtual void stop_translation_timestep ();
  virtual void acknowledge_grob (Grob_info);
  virtual void initialize ();
  virtual void create_grobs ();
  void create_items ();
  TRANSLATOR_DECLARATIONS(  Bar_number_engraver );
};


/*
  TODO: more advanced formatting via SCM function, perhaps barnumbers
  every 5 measures?  */

void
Bar_number_engraver::create_grobs ()
{
  // todo include (&&!time->cadenza_b_)
  SCM bn = get_property ("currentBarNumber");
  SCM smp = get_property ("measurePosition");
  Moment mp = (unsmob_moment (smp)) ? *unsmob_moment (smp) : Moment (0);
  
  if (gh_number_p (bn) &&
      !mp.to_bool () && now_mom () > Moment (0))
    {
      create_items ();

      // guh.
      text_p_->set_grob_property ("text",
				 ly_str02scm (to_str (gh_scm2int (bn)).ch_C ()));
    }
}



Bar_number_engraver::Bar_number_engraver ()
{
  text_p_ =0;
}

void
Bar_number_engraver::initialize ()
{
  /*
    ugh: need to share code with mark_engraver
   */
  daddy_trans_l_->set_property ("stavesFound", SCM_EOL); 
}


					       
void
Bar_number_engraver::acknowledge_grob (Grob_info inf)
{
  Grob * s = inf.grob_l_;
  if (Staff_symbol::has_interface (s))
    {
      SCM sts = get_property ("stavesFound");
      SCM thisstaff = inf.grob_l_->self_scm ();
      if (scm_memq (thisstaff, sts) == SCM_BOOL_F)
	daddy_trans_l_->set_property ("stavesFound", gh_cons (thisstaff, sts));
    }
  else if (text_p_
	   && dynamic_cast<Item*> (s)
	   && s->get_grob_property ("break-align-symbol") == ly_symbol2scm ("Left_edge_item"))
    {
      /*
	By default this would land on the Paper_column -- so why
	doesn't it work when you leave this out?  */
      text_p_->set_parent (s, X_AXIS);
    }
}

void 
Bar_number_engraver::stop_translation_timestep ()
{
  if (text_p_)
    {
      text_p_->set_grob_property ("side-support-elements", get_property ("stavesFound"));
      typeset_grob (text_p_);
      text_p_ =0;
    }
}


void
Bar_number_engraver::create_items ()
{
  if (text_p_)
    return;

  SCM b = get_property ("BarNumber");
  text_p_ = new Item (b);
  Side_position_interface::set_axis (text_p_,Y_AXIS);

  announce_grob (text_p_, 0);
}

ENTER_DESCRIPTION(Bar_number_engraver,
/* descr */       "A bar number is created whenever measurePosition is zero. It is
put on top of all staves, and appears only at  left side of the staff.",
/* creats*/       "BarNumber",
/* acks  */       "staff-symbol-interface break-aligned-interface",
/* reads */       "currentBarNumber",
/* write */       "");

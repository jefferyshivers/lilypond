;;;; grob-description.scm -- part of generated backend documentation
;;;;
;;;;  source file of the GNU LilyPond music typesetter
;;;; 
;;;; (c) 1998--2001  Han-Wen Nienhuys <hanwen@cs.uu.nl>
;;;;                 Jan Nieuwenhuizen <janneke@gnu.org>

; distances are given in stafflinethickness (thicknesses) and
; staffspace (distances)

(define all-grob-descriptions
  `((Arpeggio . (
	       (X-extent-callback . ,Arpeggio::width_callback)
	       (Y-extent-callback . #f)	       
	       (molecule-callback . ,Arpeggio::brew_molecule)
	       (Y-offset-callbacks . (,Staff_symbol_referencer::callback))
	       (X-offset-callbacks . (,Side_position::aligned_side))
	       (direction . -1)
	       (staff-position . 0.0)
	       (meta . ,(grob-description "Arpeggio" arpeggio-interface side-position-interface font-interface))
	       ))

    (autoBeamSettings . ,auto-beam-settings)

    (BarLine . (
		(break-align-symbol . Staff_bar)
		(glyph . "|")
		(break-glyph-function . ,default-break-barline)
		(barsize-procedure . ,Bar::get_staff_bar_size)
		(molecule-callback . ,Bar::brew_molecule)	   
		(visibility-lambda . ,all-visible)
		(breakable . #t)
		(before-line-breaking-callback . ,Bar::before_line_breaking)
		;;
		;; Ross. page 151 lists other values, we opt for a leaner look
		;; 
		(kern . 3.0)
		(thin-kern . 3.0)
		(hair-thickness . 1.6)
		(thick-thickness . 6.0)
		(meta . ,(grob-description  "BarLine" bar-line-interface font-interface))
	))

	(BarNumber . (
		(molecule-callback . ,Text_item::brew_molecule)
		(breakable . #t)
		(visibility-lambda . ,begin-of-line-visible)
		(padding . 1.0)
		(direction . 1)
                (font-family . roman)
		(font-relative-size . -1)
		(Y-offset-callbacks . (,Side_position::aligned_side))
		(meta . ,(grob-description "BarNumber"
					   side-position-interface
			text-interface  font-interface break-aligned-interface))
	))

	(Beam . (
		 ;; todo: clean this up a bit: the list is getting
		 ;; rather long.
		 (molecule-callback . ,Beam::brew_molecule)
		 (y-dy-callbacks . (,Beam::least_squares
				    ,Beam::cancel_suspect_slope
				    ,Beam::slope_damping
				    ,Beam::quantise_dy
				    ,Beam::user_override
				    ,Beam::do_quantise_y))
							 
		 (thickness . 0.48) ; in staff-space
		 (before-line-breaking-callback . ,Beam::before_line_breaking)
		 (after-line-breaking-callback . ,Beam::after_line_breaking)
		 (default-neutral-direction . 1)
		 (dir-function . ,beam-dir-majority)
		 (height-quants .  ,default-beam-dy-quants)
		 (vertical-position-quant-function . ,default-beam-y-quants)
		 (beamed-stem-shorten . (0.5))
		 (outer-stem-length-limit . 0.2)
		 (slope-limit . 0.2)
		 (flag-width-function . ,default-beam-flag-width-function)
		 (space-function . ,default-beam-space-function)
		 (damping . 1)
		 (auto-knee-gap . 7)
		 (meta . ,(grob-description "Beam" beam-interface))
		 ))
	 
	(BreakAlignment . (
		(breakable . #t)
		(stacking-dir . 1)
		(axes 0)
		(space-alist . ,default-break-align-space-alist) 
		(meta . ,(grob-description "BreakAlignment"
			axis-group-interface align-interface
			)
		)
	))

	(BreakAlignGroup . (
		(axes  . (0))
		(X-offset-callbacks . (,Break_align_interface::alignment_callback))
		
		(meta . ,(grob-description "BreakAlignGroup" axis-group-interface))
	))

	(BreathingSign . (
		(break-align-symbol . Breathing_sign)
		(breakable . #t )
		(molecule-callback . ,Breathing_sign::brew_molecule)
		(Y-offset-callbacks . (,Breathing_sign::offset_callback))
		(visibility-lambda . ,begin-of-line-invisible)
		(meta . ,(grob-description "BreathingSign"  break-aligned-interface))
	))

	(Clef . (
   	   (molecule-callback . ,Clef::brew_molecule)
	   (before-line-breaking-callback . ,Clef::before_line_breaking)
	   (breakable . #t)
           (font-family . music)	   
	   (break-align-symbol . Clef_item)
	   (visibility-lambda . ,begin-of-line-visible)
	   (Y-offset-callbacks  . (,Staff_symbol_referencer::callback)) 
	   (meta . ,(grob-description "Clef" clef-interface font-interface break-aligned-interface ))
	))

	(ChordName . (
		(molecule-callback . ,Chord_name::brew_molecule)
		(after-line-breaking-callback . ,Chord_name::after_line_breaking)
		(chord-name-function . ,default-chord-name-function)
		(font-family . roman)
		(meta . ,(grob-description "ChordName"  font-interface text-interface chord-name-interface))
	))

       (Custos . (
               (break-align-symbol . Custos)
               (breakable . #t )
               (molecule-callback . ,Custos::brew_molecule)
               (visibility-lambda . ,end-of-line-visible)
	       (style .  vaticana)
	       (Y-offset-callbacks . (,Staff_symbol_referencer::callback))
               (meta . ,(grob-description "Custos" custos-interface staff-symbol-interface break-aligned-interface) )
       ))
	
	(Hairpin . (
		(molecule-callback . ,Hairpin::brew_molecule)
		(thickness . 1.0)
		(height . 0.6666)

		(if-text-padding . 1.0)
		(width-correct . -1.0)
		
		(dash-thickness . 1.2)
		(dash-length . 4.0)
		(self-alignment-Y . 0)
		(Y-offset-callbacks . (,Side_position::aligned_on_self))
		(meta . ,(grob-description "Hairpin" hairpin-interface))
	))

	(DotColumn . (
		(axes 0 )
		(meta . ,(grob-description "DotColumn" dot-column-interface  axis-group-interface))
	))

	(Dots . (
		(molecule-callback . ,Dots::brew_molecule)
		(dot-count . 1)
		(staff-position . 0.0)
		(Y-offset-callbacks  . (,Dots::quantised_position_callback ,Staff_symbol_referencer::callback))
		(meta . ,(grob-description "Dots"  font-interface dot-interface ))
	))
	
	(DynamicText . (
		(Y-offset-callbacks . (,Side_position::aligned_on_self))
		(molecule-callback . ,Text_item::brew_molecule)
		(script-priority . 100)
		(font-series . bold)
		(font-family . dynamic)
		(font-shape . italic)
		(self-alignment-Y . 0)
		(meta . ,(grob-description "DynamicText" font-interface  text-interface ))
	))
	
	(DynamicLineSpanner . (
		(axes . ( 1))
		(padding . 0.6)
		(minimum-space . 1.2)
		(meta . ,(grob-description "DynamicLineSpanner" dynamic-interface axis-group-interface side-position-interface))
	))
	
	(LeftEdge . (
		(break-align-symbol . Left_edge_item)
		(X-offset-callbacks . (,Break_align_interface::alignment_callback))
		(breakable . #t)
		(meta . ,(grob-description "LeftEdge" break-aligned-interface))
	))
	
	(Fingering . (
		(molecule-callback . ,Text_item::brew_molecule)
		(X-offset-callbacks . (,Side_position::centered_on_parent ,Side_position::aligned_on_self))
		(padding . 0.6)
		(self-alignment-X . 0)
		(font-family . number)
		(font-relative-size . -3)
		(font-shape . upright)
		(meta . ,(grob-description "Fingering" finger-interface  font-interface text-script-interface text-interface side-position-interface))
	))

	(GraceAlignment . (
		(axes . (0))
		(horizontal-space . 1.2)
		(padding . 1.0)
		(before-line-breaking-callback . ,Grace_align_item::before_line_breaking)
		(meta . ,(grob-description "GraceAlignment" axis-group-interface align-interface grace-alignment-interface))
	))
	
	(HaraKiriVerticalGroup . (
		(Y-offset-callbacks . (,Hara_kiri_group_spanner::force_hara_kiri_callback))
		(Y-extent-callback . ,Hara_kiri_group_spanner::y_extent)
		(axes 1)
		(meta . ,(grob-description "HaraKiriVerticalGroup" axis-group-interface hara-kiri-group-interface))
	))

	(LyricHyphen . (
		(thickness . 1.0)
		(height . 0.4)
		(minimum-length .  0.5) 
		(molecule-callback . ,Hyphen_spanner::brew_molecule)
		(Y-extent-callback . ,Grob::point_dimension_callback)
		(meta . ,(grob-description "LyricHyphen" lyric-hyphen-interface ))
	))
	
	(InstrumentName . (
		(breakable . #t)
		(Y-offset-callbacks . (,Side_position::centered_on_parent
				       ,Side_position::aligned_on_self))
		(self-alignment-Y . 0)
		(molecule-callback . ,Text_item::brew_molecule)		
		(break-align-symbol . Instrument_name)
		(visibility-lambda . ,begin-of-line-visible)
		(baseline-skip . 2)
 		(font-family . roman)
		(meta . ,(grob-description "InstrumentName"  font-interface  text-interface break-aligned-interface))
	))
	
	(KeySignature . (
  	  (molecule-callback . ,Key_item::brew_molecule)
	  (break-align-symbol . Key_item)
	  (visibility-lambda . ,begin-of-line-visible)
	  (breakable . #t)
	  (meta . ,(grob-description "KeySignature" key-signature-interface  font-interface  break-aligned-interface))
	))
	
	(Accidentals . (
		(molecule-callback . ,Local_key_item::brew_molecule)
		(X-offset-callbacks . (,Side_position::aligned_side))
		(after-line-breaking-callback . ,Local_key_item::after_line_breaking)
		(direction . -1)
		(left-padding . 0.2)
		(right-padding . 0.4)
		(meta . ,(grob-description "Accidentals"  accidentals-interface font-interface side-position-interface))
	))
	
	(LineOfScore . (
		(axes . (0 1))
		(meta . ,(grob-description "LineOfScore"  line-of-score-interface axis-group-interface))
	))
	
	(LyricExtender . (
		(molecule-callback . ,Lyric_extender::brew_molecule)
		(height . 0.8) ; stafflinethickness;
		(right-trim-amount . 0.5)
		(Y-extent-callback . ,Grob::point_dimension_callback)
		(meta . ,(grob-description "LyricExtender"  lyric-extender-interface))
	))
	
	(LyricText . (
		(molecule-callback . ,Text_item::brew_molecule)
		(X-offset-callbacks . (,Side_position::aligned_on_self))
		(self-alignment-X . 0)
		(non-rhythmic . #t)
		(word-space . 0.6)
		(font-family . roman)
		(font-shape . upright)
		(meta . ,(grob-description "LyricText" lyric-syllable-interface text-interface font-interface ))
	))
	
	(RehearsalMark . (
		(molecule-callback . ,Text_item::brew_molecule)
		(X-offset-callbacks . (,Side_position::aligned_on_self))
		(self-alignment-X . 0)

		(direction . 1)
		(breakable . #t)
		(font-family . number)
		(font-shape . upright)
		(font-relative-size . 1)
		(visibility-lambda . ,end-of-line-invisible)
		(padding . 0.8)
		(meta . ,(grob-description "RehearsalMark"  mark-interface side-position-interface))
	))
	
	(MultiMeasureRest . (
		(spacing-procedure . ,Multi_measure_rest::set_spacing_rods)
		(molecule-callback . ,Multi_measure_rest::brew_molecule)
		(staff-position . 0)
		(expand-limit . 10)
		(padding . 2.0) ; staffspace
		(minimum-width . 12.5) ; staffspace
		(font-family . number)
		(font-relative-size . 1)
		(meta . ,(grob-description "MultiMeasureRest" multi-measure-rest-interface  font-interface ))
	))
	(NoteCollision . (
		(axes 0 1)
		(note-width . 1.65)
		(meta . ,(grob-description "NoteCollision"
		   note-collision-interface axis-group-interface
		))
	))
	
	(NoteColumn . (
		(axes . (0 1))
		(meta . ,(grob-description "NoteColumn"  axis-group-interface note-column-interface))
	))

	(NoteHead . (
		(style . default)
		(molecule-callback . ,Note_head::brew_molecule)
		(Y-offset-callbacks  . (,Staff_symbol_referencer::callback))
		(attachment-angle . ,(* 20/360 3.14159))
		(meta . ,(grob-description  "NoteHead"
			rhythmic-head-interface font-interface 
			note-head-interface ))
	))
	(Glissando . (
			 (type . line)
			 (gap . 0.5)
			 (breakable . #t)
			 (X-extent-callback . #f)
			 (Y-extent-callback . #f)			 
			 (molecule-callback . ,Line_spanner::brew_molecule)
			 (meta . ,(grob-description "Glissando"
						       line-spanner-interface))
			 ))
	(FollowThread . (
			 (type . line)
			 (gap . 0.5)
			 (breakable . #t)
			 (X-extent-callback . #f)
			 (Y-extent-callback . #f)			 
			 (molecule-callback . ,Line_spanner::brew_molecule)
			 (meta . ,(grob-description "FollowThread"
						       line-spanner-interface))
			 ))

	(NoteName . (
		(molecule-callback . ,Text_item::brew_molecule)
		(font-family . roman)
		(meta . ,(grob-description  "NoteName"
					       note-name-interface font-interface
					       ))
		))

	(OctavateEight . (
		(self-alignment-X . 0)
		(text . "8")
		(visibility-lambda . ,begin-of-line-visible)
		(X-offset-callbacks . (,Side_position::centered_on_parent ,Side_position::aligned_on_self))
		(Y-offset-callbacks . (,Side_position::aligned_side))
		(molecule-callback . ,Text_item::brew_molecule)
                (font-shape . italic)
		(font-family . roman)
		(meta . ,(grob-description "OctavateEight" text-interface font-interface ))
	))
	
	(PaperColumn . (
		(axes 0)
		(before-grace-spacing-factor . 1.2)
                (before-musical-spacing-factor . 0.4)
 		(meta . ,(grob-description "PaperColumn" paper-column-interface axis-group-interface spaceable-element-interface))
	))
	(PhrasingSlur . (
		 (molecule-callback . ,Slur::brew_molecule)
		 (thickness . 1.2)		
		 (spacing-procedure . ,Slur::set_spacing_rods)		
		 (minimum-length . 1.5)
		 (after-line-breaking-callback . ,Slur::after_line_breaking)
		 (extremity-rules . ,default-slur-extremity-rules)
		 (extremity-offset-alist . ,default-phrasing-slur-extremity-offset-alist)
		 (de-uglify-parameters . ( 1.5  0.8  -2.0))
		 (Y-extent-callback . ,Slur::height)
		 (details . ((height-limit . 2.0) (ratio . 0.333) (force-blowfit . 0.5)
			     (bezier-pct-c0 . -0.2) (bezier-pct-c3 . 0.000006)
			     (bezier-pct-out-max . 0.8) (bezier-pct-in-max . 1.2)
			     (bezier-area-steps . 1.0)))
		 (beautiful . 0.5)
		 (y-free . 0.75)
		 (attachment . (#f . #f))
		 (attachment-offset . ((0 . 0) . (0 . 0)))
		 (slope-limit . 0.8)
		 (meta . ,(grob-description "PhrasingSlur" slur-interface))
		 ))
	(NonMusicalPaperColumn . (
                (axes 0)
                (before-musical-spacing-factor . 1.0)
		(column-space-strength . 2.0)
 		(meta . ,(grob-description "NonMusicalPaperColumn" paper-column-interface axis-group-interface spaceable-element-interface))
        ))
	
	(Rest . (
		(after-line-breaking-callback . ,Rest::after_line_breaking)
		(X-extent-callback . ,Rest::extent_callback)
		(Y-extent-callback . ,Rest::extent_callback)		
		(molecule-callback . ,Rest::brew_molecule)
		(minimum-beam-collision-distance . 1.5)
		(meta . ,(grob-description  "Rest"
			rhythmic-head-interface
			rest-interface))
	))
	(RestCollision . (
		(minimum-distance . 0.75)
		(meta . ,(grob-description "RestCollision" rest-collision-interface ))
	))

	(Script . (
		(molecule-callback . ,Script::brew_molecule)
		(X-offset-callbacks . (,Side_position::centered_on_parent))
		(after-line-breaking-callback . ,Script::after_line_breaking)
		(meta . ,(grob-description "Script" script-interface side-position-interface font-interface))
	))
	
	(ScriptColumn . (
		(before-line-breaking-callback . ,Script_column::before_line_breaking)
		(meta . ,(grob-description "ScriptColumn" script-column-interface))
	))
	
	(Slur . (
		 (molecule-callback . ,Slur::brew_molecule)
		 (thickness . 1.2)		
		 (spacing-procedure . ,Slur::set_spacing_rods)		
		 (minimum-length . 1.5)
		 (after-line-breaking-callback . ,Slur::after_line_breaking)
		 (extremity-rules . ,default-slur-extremity-rules)
		 (extremity-offset-alist . ,default-slur-extremity-offset-alist)
		 (de-uglify-parameters . ( 1.5  0.8  -2.0))
		 (Y-extent-callback . ,Slur::height)
		 (details . ((height-limit . 2.0) (ratio . 0.333) (force-blowfit . 0.5)
			     (bezier-pct-c0 . -0.2) (bezier-pct-c3 . 0.000006)
			     (bezier-pct-out-max . 0.8) (bezier-pct-in-max . 1.2)
			     (bezier-area-steps . 1.0)))
		 (beautiful . 0.5)
		 (y-free . 0.75)
		 (attachment . (#f . #f))
		 (attachment-offset . ((0 . 0) . (0 . 0)))
		 (slope-limit . 0.8)
		 (meta . ,(grob-description "Slur" slur-interface))
		 ))
	      
	(SpacingSpanner . (
		(spacing-procedure . ,Spacing_spanner::set_springs)
		(stem-spacing-correction . 0.5)
		(arithmetic-basicspace . 2.0)
		(arithmetic-multiplier . ,(* 0.9 1.32))
		;; assume that notes at least this long are present.
		(maximum-duration-for-spacing . ,(make-moment 1 8))
		(meta . ,(grob-description "SpacingSpanner"  spacing-spanner-interface))
	))
	(SpanBar . (
		(break-align-symbol . Staff_bar)
		(barsize-procedure . ,Span_bar::get_bar_size) 
		(molecule-callback . ,Bar::brew_molecule)
		(visibility-lambda . ,begin-of-line-invisible)
		(X-extent-callback . ,Span_bar::width_callback)
		(Y-offset-callbacks . (,Span_bar::center_on_spanned_callback))
		
		(breakable . #t)
		(glyph . "|")
		(before-line-breaking-callback . ,Span_bar::before_line_breaking)
		;; ugh duplication! 
		
		;;
		;; Ross. page 151 lists other values, we opt for a leaner look
		;; 
		(kern . 3.0)
		(thin-kern . 3.0)
		(hair-thickness . 1.6)
		(thick-thickness . 6.0)
		(meta . ,(grob-description "SpanBar" span-bar-interface bar-line-interface ))
	))

	(StanzaNumber . (
		(breakable . #t)
		(molecule-callback . ,Text_item::brew_molecule)		
		(break-align-symbol . Clef_item)
		(visibility-lambda . ,begin-of-line-visible)
		(font-family . roman)
		(meta . ,(grob-description "StanzaNumber" break-aligned-interface text-interface font-interface))
	))

	(StaffSymbol . (
		(molecule-callback . ,Staff_symbol::brew_molecule)
		(staff-space . 1.0)
		(line-count . 5)
		(layer . 0)
		(meta . ,(grob-description "StaffSymbol" staff-symbol-interface ))
	))
	(SostenutoPedal . (
		(molecule-callback . ,Text_item::brew_molecule)
		(X-offset-callbacks . (,Side_position::aligned_on_self))
		(Y-offset-callbacks .
		 (,Side_position::aligned_side
		  ,Side_position::centered_on_parent))
		(no-spacing-rods . #t)
                (font-shape . italic)
		(self-alignment-X . 0)
		(meta . ,(grob-description "SostenutoPedal" text-interface  font-interface))
	))

	(Stem . (
		(before-line-breaking-callback . ,Stem::before_line_breaking)
		(molecule-callback . ,Stem::brew_molecule)
		(thickness . 0.8)
		(beamed-lengths . (0.0 2.5 2.0 1.5))
		(beamed-minimum-lengths . (0.0 1.5 1.25 1.0))
		
;;  Stems in unnatural (forced) direction should be shortened,
;;  according to [Roush & Gourlay].  Their suggestion to knock off
;;  a whole staffspace seems a bit drastical: we'll do half.

		(lengths . (3.5 3.5 3.5 4.5 5.0))
		(stem-shorten . (0.5))
		; if stem is on middle line, choose this direction.
		(default-neutral-direction . 1)
		(X-offset-callbacks . (,Stem::off_callback))
		(X-extent-callback . ,Stem::dim_callback)	
		(Y-extent-callback . ,Stem::height)
		(meta . ,(grob-description  "Stem" stem-interface  font-interface))
	))

	(StemTremolo . (
	   	(molecule-callback . ,Stem_tremolo::brew_molecule)
		(Y-extent-callback . ,Stem_tremolo::height)
		(X-extent-callback . #f)

		(beam-width . 2.0) ; staff-space
		(beam-thickness . 0.42) ; staff-space
		(beam-space-function . ,default-beam-space-function)
		(meta . ,(grob-description "StemTremolo" stem-tremolo-interface ))
	))

	(SeparationItem . (
		(meta . ,(grob-description "SeparationItem" separation-item-interface ))
	))
	(SeparatingGroupSpanner . (
		(spacing-procedure . ,Separating_group_spanner::set_spacing_rods)
		(meta . ,(grob-description "SeparatingGroupSpanner" separation-spanner-interface))
	))

	(SustainPedal . (
		(no-spacing-rods . #t)
		(molecule-callback . ,Sustain_pedal::brew_molecule)
		(self-alignment-X . 0)
		(X-offset-callbacks . (,Side_position::aligned_on_self))
		(Y-offset-callbacks .
				    (,Side_position::aligned_side
				     ,Side_position::centered_on_parent))

		(meta . ,(grob-description "SustainPedal" sustain-pedal-interface side-position-interface font-interface))
	))

	; should split in 3
	(SystemStartDelimiter . (
		(molecule-callback . ,System_start_delimiter::brew_molecule)
		(after-line-breaking-callback . ,System_start_delimiter::after_line_breaking)
		;; ugh, in practice, brace has height of 4.1 staff-spaces
		(brace-collapse-height . 4.1)
		(bracket-collapse-height . 1)
		(thickness . 1.6)
		(arch-height . 1.5)
		(arch-angle . 50.0)
		(arch-thick . 0.25)
		(glyph . bar-line)
		(arch-width . 1.5)
		(bracket-thick . 0.25)
		(Y-extent-callback . #f)
		(font-family . braces)
		;; if you want to set point-size, you cannot set
		;; relative-size, as no font will be found for other
		;; sheets than 20
		;;(font-point-size . 20)
		;;(font-relative-size . #f)
		(meta . ,(grob-description "SystemStartDelimiter" system-start-delimiter-interface font-interface))
		))

	(TextScript . (
		(molecule-callback . ,Text_item::brew_molecule)
		(no-spacing-rods . #t)
		(padding . 0.5)
		(baseline-skip . 2)
		(font-family . roman)
		(font-shape . italic)
		(meta . ,(grob-description "TextScript" text-script-interface text-interface side-position-interface font-interface ))
	))
	(TextSpanner . (
		(molecule-callback . ,Text_spanner::brew_molecule)
                (font-shape . italic)
		(font-family . roman)
		(type . "line")
		
		;; urg, only for (de)cresc. text spanners
		(if-text-padding . 1.0)
		(width-correct . -1)
		
		(direction . 1)
		(meta . ,(grob-description "TextSpanner" text-spanner-interface  font-interface))		
	))
	(Tie . (
		(molecule-callback . ,Tie::brew_molecule)
		(spacing-procedure . ,Tie::set_spacing_rods)
		(staffline-clearance . 0.35)
		(details . ((ratio . 0.333) (height-limit . 1.0)))
		(thickness . 1.2)
		(x-gap . 0.2)
		(minimum-length  . 2.5)
		(meta . ,(grob-description "Tie" tie-interface ))
	))

	(TieColumn . (
		(after-line-breaking-callback . ,Tie_column::after_line_breaking)
		(meta . ,(grob-description "TieColumn" tie-column-interface ))
	))

	(TimeSignature . (
		(molecule-callback . ,Time_signature::brew_molecule)
		(break-align-symbol . Time_signature)
		(visibility-lambda . ,all-visible)
		(breakable . #t)
                (font-family . number)
                (meta . ,(grob-description "TimeSignature" time-signature-interface  font-interface))
	))

	(TupletBracket . (
		(number-gap . 2.0)   
		(delta-y . 0)
		(thick . 1.0)
		(after-line-breaking-callback . ,Tuplet_bracket::after_line_breaking)
		(molecule-callback . ,Tuplet_bracket::brew_molecule)
		(font-family . roman)
		(font-shape . italic)
		(font-relative-size . -1)
		(meta .  ,(grob-description "TupletBracket" text-interface
			   tuplet-bracket-interface font-interface))
	))

	(UnaChordaPedal . (
		(molecule-callback . ,Text_item::brew_molecule)
                (font-shape . italic)
		(no-spacing-rods . #t)
		(self-alignment-X . 0)
		(X-offset-callbacks . (,Side_position::aligned_on_self))
		(Y-offset-callbacks .
		 (,Side_position::aligned_side
		  ,Side_position::centered_on_parent))
		(meta . ,(grob-description "UnaChordaPedal" text-interface font-interface))
	))

	(VoltaBracket . (
		(molecule-callback . ,Volta_spanner::brew_molecule)
	
		(direction . 1)
		(padding . 1)
                (font-style . volta)
		(Y-offset-callbacks . (,Side_position::aligned_side))
		(thickness . 1.6)  ;  stafflinethickness
		(height . 2.0) ; staffspace;
		(minimum-space . 5)
 		(font-family . number)
 		(font-relative-size . -2)
		(meta . ,(grob-description "VoltaBracket" volta-bracket-interface side-position-interface font-interface))
	))

	(VerticalAlignment . (
		(axes 1)
		(Y-extent-callback . ,Axis_group_interface::group_extent_callback)
		(X-extent-callback . #f)
		(stacking-dir . -1)
		(meta . ,(grob-description "VerticalAlignment" align-interface axis-group-interface))
	))

	(VerticalAxisGroup . (
		(axes 1)
		(meta . ,(grob-description "VerticalAxisGroup" axis-group-interface))
	))
))



;  (display  (map pair? all-grob-descriptions))


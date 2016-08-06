# Tables


\FloatingTable[H] place a floating table *exactly* in place
\FloatingTable[b] places it at the bottom of the column
\SpanningTable[b] makes the table span the bottom of two columns
\SpanningTable[t] makes the table span the top of two columns

All usual float alignment specifiers will work. \BreakingTable accept none, since it's always placed in-text.

Not using any option is equivalent to respectively
\FloatingTable[htb]
and
\SpanningTable[tbp]
(the default behaviours can be *easily* configured)

This is neat, but there's more.

I cleaned up column types so now you have these to control cell size and alignment

T{.2} top of the cell aligned to baseline, width=.2*tablewidth
M{.33} middle of the cell aligned to baseline, width=.33*tablewidth
B{.5} bottom of the cell aligned to baseline, width=.5*tablewidth

and these to control text alignment

L left aligned
C centered
R right aligned
J justified (the default)

and

O enables transparency

For concreteness, an example:

\NextTableColumns{OCT{.25}OLT{.75}}

makes a table with two transparent columns, both with top-aligned content. first one is 1/4 wide and centered, second one is 3/4 wide and left aligned.

This mechanism is very advanced, but you have *complete* control of the coluns appearance from the markdown side.

Furthermore, if your use case settles to a uniform standard we can define some shortcuts:

\NextTableColumns{s{.25}a{.75}}
where s=OCT and a=OLT

\Blindtext

\NextTableColumns{OCT{.25}OLT{.75}}

\FloatingTable

: This is a floating table

| | |
|---------|-----------------|
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Fortitude** | Wear heavy armor, resist poison, shrug off pain, exert yourself physically |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |

\Blindtext\Blindtext

\NextTableStyle{Bizarro}

| | |
|---------|-----------------|
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Fortitude** | Wear heavy armor, resist poison, shrug off pain, exert yourself physically |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Fortitude** | Wear heavy armor, resist poison, shrug off pain, exert yourself physically |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Fortitude** | Wear heavy armor, resist poison, shrug off pain, exert yourself physically |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Fortitude** | Wear heavy armor, resist poison, shrug off pain, exert yourself physically |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |

\Blindtext\Blindtext\Blindtext

\SpanningTable

| | |
|---------|-----------------|
| **Agility** | Dodge attacks, move with stealth, perform acrobatics, shoot a bow, pick a pocket |
| **Fortitude** | Wear heavy armor, resist poison, shrug off pain, exert yourself physically |
| **Might** | Swing a maul, jump over a chasm, break down a door, wrestle a foe to submission |

: This is a spanning table

\Blindtext\Blindtext\Blindtext

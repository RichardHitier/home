
set textwidth=0

ab {} {^[o}^[O

set foldmethod=syntax
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
set foldlevel=2
set foldnestmax=10



set textwidth=0

ab {} {^[o}^[O

set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
set foldnestmax=10


" for neovim
let test#neovim#term_position = "topleft"

let test#javascript#mocha#options = {
  \ 'nearest': '--backtrace',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}

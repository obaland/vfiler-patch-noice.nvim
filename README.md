# vfiler-patch-noice.nvim
Patch for [vfiler.vim](https://github.com/obaland/vfiler.vim) to mitigate the effects of [noice.nvim](https://github.com/folke/noice.nvim)

## Description
In [noice.nvim](https://github.com/folke/noice.nvim), to solve the problem of Neovim, the `/` or `?` The `conceallevel` option is changed internally when searching with
When the `conceallevel` option is changed externally, the appearance of [vfiler.vim](https://github.com/obaland/vfiler.vim) is adversely affected.
This patch is applied to minimize the negative visual impact.

## Installation
1. Install the plugin with your favorite plugin manager, e.g. [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'obaland/vfiler.vim'
Plug 'obaland/vfiler-patch-noice.nvim'
```
2. Setup the patch before starting `vfiler.vim`.
```lua
require'vfiler/patches/noive'.setup()
-- ...
require('vfiler').start()
```

## Notes
- If you do not use [noice.nvim](https://github.com/folke/noice.nvim), you do not need this patch.


## Effects of the patch
### Before applying
![before-applying](https://github.com/obaland/contents/blob/main/vfiler.vim/patches/noice/before-applying.png?raw=true)

### After applying
![after-applying](https://github.com/obaland/contents/blob/main/vfiler.vim/patches/noice/after-applying.png?raw=true)

## License
Paddington is licensed under the MIT license.  
Copyright © 2023, obaland

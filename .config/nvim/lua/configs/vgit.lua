local colors = require("colors.base16")

require("vgit").setup(
  {
    hls = {
      VGitViewWordAdd = {
        bg = colors.blue,
        fg = nil
      },
      VGitViewWordRemove = {
        bg = colors.red,
        fg = nil
      },
      VGitSignAdd = {
        fg = colors.green,
        bg = colors.gray
      },
      VGitSignChange = {
        fg = colors.blue,
        bg = colors.gray
      },
      VGitSignRemove = {
        fg = colors.red,
        bg = colors.gray
      },
      VGitIndicator = {
        fg = colors.orange,
        bg = colors.gray
      },
      VGitStatus = {
        fg = colors.purple,
        bg = colors.gray
      },
      VGitBorder = {
        fg = colors.fg,
        bg = nil
      }
    }
  }
)

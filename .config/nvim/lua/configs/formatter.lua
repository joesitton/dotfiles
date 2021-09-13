require("formatter").setup(
  {
    logging = false,
    filetype = {
      ["*"] = {
        -- trailing whitespace
        function()
          return {
            exe = "sed",
            args = {"-i 's/[ \t]*$//'"},
            stdin = true
          }
        end
      },
      python = {
        -- black, isort
        function()
          return {
            exe = "black",
            args = {"-q"},
            stdin = false
          }, {
            exe = "isort",
            args = {"-q"},
            stdin = false
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      cpp = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      }
    }
  }
)

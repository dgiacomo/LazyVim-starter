return {
  {
    -- markdown preview, including mermaid
    "toppair/peek.nvim",
  },
  {
    "preservim/vim-markdown",
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      { "3rd/image.nvim", build = false, opts = {
        processor = "magick_cli",
      } },
    },
    config = function()
      require("diagram").setup({
        integrations = {
          require("diagram.integrations.markdown"),
        },
        renderer_options = {
          mermaid = {
            background = nil,
            theme = nil,
            scale = 1,
          },
          d2 = {
            theme_id = nil,
          },
          gnuplot = {
            theme = nil,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>md",
        function()
          require("diagram").show_diagram_hover()
        end,
        mode = "n",
        ft = { "markdown" },
        desc = "[M]arkdown [D]iagram hover",
      },
    },
  },
}

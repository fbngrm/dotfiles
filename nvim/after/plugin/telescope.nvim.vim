lua << EOF
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = function(_, max_columns, _)
          return max_columns
        end,
        height = function(_, _, max_lines)
          return max_lines
        end,
      }
      -- other layout configuration here
    },
    border = true,
    -- other defaults configuration here
  },
  -- other configuration values here
})
EOF

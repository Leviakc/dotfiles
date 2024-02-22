return {
  'terrortylor/nvim-comment',
  event = 'VeryLazy',
  config = function()
    require('nvim_comment').setup({
      comment_empty = false,
      comment_empty_trim_whitespace = false,
      hook = function()
        require('ts_context_commentstring').update_commentstring()
        --require('ts_context_commentstring').calculate_commentstring()
      end,
    })
  end
}

-- import bufferline plugin safely
local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    diagnostics = "nvim_lsp",
    separator_style = "slant" or "padded_slant",
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = { { filetype = "NvimTree", text = "File Explorer", highlight = "Directory" } },
  },
})

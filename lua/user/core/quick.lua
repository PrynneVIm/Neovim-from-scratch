local hop_status_ok, hop = pcall(require, "hop")
if not hop_status_ok then
  return
end


local surround_status_ok, surround = pcall(require, "nvim-surround")
if not surround_status_ok then
  return
end

-- 快速定位单词和某一行
hop.setup { keys = 'etovxqpdygfblzhckisuran' }

-- 快速更改分隔符
surround.setup({
  -- Configuration here, or leave empty to use defaults
})

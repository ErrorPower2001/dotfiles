" Scrolloffset Lines
" 滚动偏移行数
"...set scrolloff=999

"...let s:center_lines = 4
"...let &scrolloff = (winheight(0) - s:center_lines)/2


augroup LinesStayCenter
	autocmd!

	autocmd CursorMoved,CursorMovedI *
	\ let s:middle_offset = (winheight(0)/2)+(winheight(0)%2) |
	\ let s:target_topline = line(".") |
	\ let s:visual_dist = 1 |
	\ while ((s:visual_dist < s:middle_offset) && (s:target_topline > 1)) |
	\	let s:target_topline -= 1 |
	\	if foldclosed(s:target_topline) != -1 |
	\		let s:target_topline = foldclosed(s:target_topline) |
	\	endif |
	\	let s:visual_dist += 1 |
	\ endwhile |
	\ call winrestview({'topline': s:target_topline})
augroup END

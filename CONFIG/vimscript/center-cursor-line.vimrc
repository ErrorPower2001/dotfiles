" Scrolloffset Lines
" 滚动偏移行数
"...set scrolloff=999

"...let s:center_lines = 4
"...let &scrolloff = (winheight(0) - s:center_lines)/2


let g:lines_stay_center_enabled = 1

command! LinesStayCenterToggle
	\let g:lines_stay_center_enabled = !g:lines_stay_center_enabled |
	\echo "LinesStayCenter: " . (g:lines_stay_center_enabled ? "Enabled" : "Disabled")

function! s:KeepCursorCentered()
	if g:lines_stay_center_enabled
		let middle_offset = (winheight(0)/2)+(winheight(0)%2)
		let target_topline = line(".")
		let visual_dist = 1

		while ( (visual_dist < middle_offset) && (target_topline > 1) )
			let target_topline -= 1
			if foldclosed(target_topline) != -1
				let target_topline = foldclosed(target_topline)
			endif
			let visual_dist += 1
		endwhile

		call winrestview({'topline': target_topline})
	endif
endfunction

augroup LinesStayCenter
	autocmd!
	autocmd CursorMoved,CursorMovedI * call s:KeepCursorCentered()
augroup END

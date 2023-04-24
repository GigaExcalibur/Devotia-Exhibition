.thumb
@draws the items screen
.include "mss_defs.s"

.global MSS_page2
.type MSS_page2, %function


MSS_page2:

page_start

draw_stats_box showBallista=0

draw_items_text showBallista=0

page_end

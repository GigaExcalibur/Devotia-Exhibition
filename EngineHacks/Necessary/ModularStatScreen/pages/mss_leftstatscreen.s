.thumb
@draws the left panel of the stat screen
.include "mss_defs.s"

.global MSS_leftpage
.type MSS_leftpage, %function


MSS_leftpage:

leftpage_start

draw_character_name_at 3,10

.set NoAltIconDraw, 1
ldr     r0, [r7, #0xC]    @load unit's pointer
ldr     r0, [r0]            @load character pointer
mov r0, r8
ldr r1, =Skill_Getter
mov lr, r1
.short 0xf800 @skills now stored in the skills buffer

mov r6, r0
ldrb r0, [r6] 
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 1, 11

ldrb r0, [r6,#1]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 2, 11

ldrb r0, [r6, #2]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 3, 11

ldrb r0, [r6, #3]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 4, 11

ldrb r0, [r6, #4]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 5, 11

ldrb r0, [r6, #5]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 6, 11

SkillEnd:

draw_class_name_at 1,14


draw_left_affinity_icon_at 10,10


draw_lv_icon_at 1, 16
draw_level_at 4, 16

draw_exp_icon_at 5, 16
draw_exp_at 7, 16

draw_hp_icon_at 1, 18
draw_ui_slash_at 5, 18
draw_hp_at 4, 18
draw_max_hp 7, 18

ldr r0,=#0x442
bl HP_Name_Color


page_end


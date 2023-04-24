.thumb
.include "mss_defs.s"

.global MSS_page3
.type MSS_page3, %function


MSS_page3:

page_start

draw_weapon_rank_at 1, 1, Sword, 0
draw_weapon_rank_at 1, 3, Lance, 1
draw_weapon_rank_at 1, 5, Axe, 2
draw_weapon_rank_at 1, 7, Staff, 3
draw_weapon_rank_at 1, 9, Bow, 4
draw_weapon_rank_at 1, 11, Anima, 5
draw_weapon_rank_at 1, 13, Light, 6
draw_weapon_rank_at 1, 15, Dark, 7

//ldr r0,=SkillsTextIDLink
//ldrh r0, [r0]
draw_textID_at 21, 3, 0xC59, colour=Yellow, width=5 @skills

/*
.set NoAltIconDraw, 1 @this is the piece that makes them use a separate sheet
mov r0, r8
ldr r1, =Skill_Getter
mov lr, r1
.short 0xf800 @skills now stored in the skills buffer

mov r6, r0
ldrb r0, [r6] 
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 21, 5

ldrb r0, [r6,#1]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 21, 7

ldrb r0, [r6, #2]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 21, 9

ldrb r0, [r6, #3]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 21, 11

ldrb r0, [r6, #4]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 21, 13

ldrb r0, [r6, #5]
cmp r0, #0
beq SkillEnd
draw_skill_icon_at 21, 15

SkillEnd:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Formatting for skill names, designed to match that of skill icons as much as possible. Also meant to be located in exactly this spot, after the skill icons are drawn. It probably works elsewhere, but I know it works here lol
@The only different is the need for a SkillNameHalfway label, as SkillNameEnd is out of beq range for the first three macros. This is not a pretty workaround but it works.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

@Get skills in buffer
mov r0, r8
ldr r1, =Skill_Getter
mov lr, r1
.short 0xf800 @skills now stored in the skills buffer
mov r6, r0

ldrb r0, [r6, #0] 
cmp r0, #0
beq SkillNameHalfway
draw_skill_name_at 23, 5, colour=White

ldrb r0, [r6, #1] 
cmp r0, #0
beq SkillNameHalfway
draw_skill_name_at 23, 7, colour=White

ldrb r0, [r6, #2] 
cmp r0, #0
beq SkillNameHalfway
draw_skill_name_at 23, 9, colour=White

SkillNameHalfway:
cmp r0, #0
beq SkillNameEnd

ldrb r0, [r6, #3] 
cmp r0, #0
beq SkillNameEnd
draw_skill_name_at 23, 11, colour=White 

ldrb r0, [r6, #4] 
cmp r0, #0
beq SkillNameEnd
draw_skill_name_at 23, 13, colour=White 

ldrb r0, [r6, #5] 
cmp r0, #0
beq SkillNameEnd
draw_skill_name_at 23, 15, colour=White 

SkillNameEnd:
*/

blh DrawSupports

page_end

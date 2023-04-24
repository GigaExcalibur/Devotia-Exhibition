
.macro draw_skill_name_at, tile_x, tile_y, colour=White, width=14
  @Get the corresponding description based on the skillID, shoutouts to Vesly who fixed my 2 bytes thing
  ldr r3, =SkillDescTable 
  mov r2, r0 
  @ Since the table is 2 bytes (a short) for each entry, our index is 2x the skill id 
  lsl r2, #1 @ 2x the skill id 
  ldrh r0, [r3, r2]
  mov r3, r7
  mov r1, #\width
  @r3 is current buffer location, r1 is width.
  ldrh r2,[r3] @current number
  add r2,r1 @for the next one.
  strb r1, [r3, #4] @store width
  strb r2, [r3, #8] @assign the next one.
  blh String_GetFromIndex
  bl GetSkillNameFromSkillDesc
  mov r2, #0x0
  str r2, [sp]
  str r0, [sp, #4]
  mov r2, #\colour @colour
  mov r0, r7
  ldr r1, =(tile_origin+(0x20*2*\tile_y)+(2*\tile_x))
  mov r3, #0
  blh DrawTextInline, r4
  add r7, #8
.endm


b SkipDescGetLoop
GetSkillNameFromSkillDesc:
@ Arguments: r0 = String; Returns: r0 = same String
@ Replaces the first colon (':') character by a 0, effectively ending the string there
@ Since all skill desc are in the format "<name>: <desc>" it gets the skill name from the skill desc
sub r2, r0, #1
continueGetDesc:
add r2, #1
ldrb r1, [r2]
cmp r1, #0
beq endGetDesc
cmp r1, #0x3A @ ':'
bne continueGetDesc
mov  r1, #0
strb r1, [r2]
endGetDesc:
bx lr
SkipDescGetLoop:


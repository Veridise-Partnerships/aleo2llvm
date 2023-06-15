; ModuleID = 'main.aleo'
source_filename = "./test/workshop/basic_bank/main.aleo"

%Token = type { i128, i64, i64 }

@balances = internal global [512 x i64] zeroinitializer

define i64 @calculate_interest(i64 %r0, i64 %r1, i64 %r2) {
entry:
  %r01 = alloca i64, align 8
  store i64 %r0, i64* %r01, align 4
  %r12 = alloca i64, align 8
  store i64 %r1, i64* %r12, align 4
  %r23 = alloca i64, align 8
  store i64 %r2, i64* %r23, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i64, i64* %r23, align 4
  %lt = icmp slt i64 0, %load
  %r3 = alloca i64, align 8
  %zext = zext i1 %lt to i64
  store i64 %zext, i64* %r3, align 4
  %load4 = load i64, i64* %r01, align 4
  %load5 = load i64, i64* %r12, align 4
  %mul = mul i64 %load4, %load5
  %r4 = alloca i64, align 8
  store i64 %mul, i64* %r4, align 4
  %load6 = load i64, i64* %r4, align 4
  %div = sdiv i64 %load6, 10000
  %r5 = alloca i64, align 8
  store i64 %div, i64* %r5, align 4
  %load7 = load i64, i64* %r01, align 4
  %load8 = load i64, i64* %r5, align 4
  %add = add i64 %load7, %load8
  %r6 = alloca i64, align 8
  store i64 %add, i64* %r6, align 4
  %load9 = load i64, i64* %r3, align 4
  %load10 = load i64, i64* %r6, align 4
  %load11 = load i64, i64* %r01, align 4
  %cast_bool = icmp ne i64 %load9, 0
  %ternary = select i1 %cast_bool, i64 %load10, i64 %load11
  %r7 = alloca i64, align 8
  store i64 %ternary, i64* %r7, align 4
  %load12 = load i64, i64* %r23, align 4
  %lt13 = icmp slt i64 1, %load12
  %r8 = alloca i64, align 8
  %zext14 = zext i1 %lt13 to i64
  store i64 %zext14, i64* %r8, align 4
  %load15 = load i64, i64* %r7, align 4
  %load16 = load i64, i64* %r12, align 4
  %mul17 = mul i64 %load15, %load16
  %r9 = alloca i64, align 8
  store i64 %mul17, i64* %r9, align 4
  %load18 = load i64, i64* %r9, align 4
  %div19 = sdiv i64 %load18, 10000
  %r10 = alloca i64, align 8
  store i64 %div19, i64* %r10, align 4
  %load20 = load i64, i64* %r7, align 4
  %load21 = load i64, i64* %r10, align 4
  %add22 = add i64 %load20, %load21
  %r11 = alloca i64, align 8
  store i64 %add22, i64* %r11, align 4
  %load23 = load i64, i64* %r8, align 4
  %load24 = load i64, i64* %r11, align 4
  %load25 = load i64, i64* %r7, align 4
  %cast_bool26 = icmp ne i64 %load23, 0
  %ternary27 = select i1 %cast_bool26, i64 %load24, i64 %load25
  %r1228 = alloca i64, align 8
  store i64 %ternary27, i64* %r1228, align 4
  %load29 = load i64, i64* %r23, align 4
  %lt30 = icmp slt i64 2, %load29
  %r13 = alloca i64, align 8
  %zext31 = zext i1 %lt30 to i64
  store i64 %zext31, i64* %r13, align 4
  %load32 = load i64, i64* %r1228, align 4
  %load33 = load i64, i64* %r12, align 4
  %mul34 = mul i64 %load32, %load33
  %r14 = alloca i64, align 8
  store i64 %mul34, i64* %r14, align 4
  %load35 = load i64, i64* %r14, align 4
  %div36 = sdiv i64 %load35, 10000
  %r15 = alloca i64, align 8
  store i64 %div36, i64* %r15, align 4
  %load37 = load i64, i64* %r1228, align 4
  %load38 = load i64, i64* %r15, align 4
  %add39 = add i64 %load37, %load38
  %r16 = alloca i64, align 8
  store i64 %add39, i64* %r16, align 4
  %load40 = load i64, i64* %r13, align 4
  %load41 = load i64, i64* %r16, align 4
  %load42 = load i64, i64* %r1228, align 4
  %cast_bool43 = icmp ne i64 %load40, 0
  %ternary44 = select i1 %cast_bool43, i64 %load41, i64 %load42
  %r17 = alloca i64, align 8
  store i64 %ternary44, i64* %r17, align 4
  %load45 = load i64, i64* %r23, align 4
  %lt46 = icmp slt i64 3, %load45
  %r18 = alloca i64, align 8
  %zext47 = zext i1 %lt46 to i64
  store i64 %zext47, i64* %r18, align 4
  %load48 = load i64, i64* %r17, align 4
  %load49 = load i64, i64* %r12, align 4
  %mul50 = mul i64 %load48, %load49
  %r19 = alloca i64, align 8
  store i64 %mul50, i64* %r19, align 4
  %load51 = load i64, i64* %r19, align 4
  %div52 = sdiv i64 %load51, 10000
  %r20 = alloca i64, align 8
  store i64 %div52, i64* %r20, align 4
  %load53 = load i64, i64* %r17, align 4
  %load54 = load i64, i64* %r20, align 4
  %add55 = add i64 %load53, %load54
  %r21 = alloca i64, align 8
  store i64 %add55, i64* %r21, align 4
  %load56 = load i64, i64* %r18, align 4
  %load57 = load i64, i64* %r21, align 4
  %load58 = load i64, i64* %r17, align 4
  %cast_bool59 = icmp ne i64 %load56, 0
  %ternary60 = select i1 %cast_bool59, i64 %load57, i64 %load58
  %r22 = alloca i64, align 8
  store i64 %ternary60, i64* %r22, align 4
  %load61 = load i64, i64* %r23, align 4
  %lt62 = icmp slt i64 4, %load61
  %r2363 = alloca i64, align 8
  %zext64 = zext i1 %lt62 to i64
  store i64 %zext64, i64* %r2363, align 4
  %load65 = load i64, i64* %r22, align 4
  %load66 = load i64, i64* %r12, align 4
  %mul67 = mul i64 %load65, %load66
  %r24 = alloca i64, align 8
  store i64 %mul67, i64* %r24, align 4
  %load68 = load i64, i64* %r24, align 4
  %div69 = sdiv i64 %load68, 10000
  %r25 = alloca i64, align 8
  store i64 %div69, i64* %r25, align 4
  %load70 = load i64, i64* %r22, align 4
  %load71 = load i64, i64* %r25, align 4
  %add72 = add i64 %load70, %load71
  %r26 = alloca i64, align 8
  store i64 %add72, i64* %r26, align 4
  %load73 = load i64, i64* %r2363, align 4
  %load74 = load i64, i64* %r26, align 4
  %load75 = load i64, i64* %r22, align 4
  %cast_bool76 = icmp ne i64 %load73, 0
  %ternary77 = select i1 %cast_bool76, i64 %load74, i64 %load75
  %r27 = alloca i64, align 8
  store i64 %ternary77, i64* %r27, align 4
  %load78 = load i64, i64* %r23, align 4
  %lt79 = icmp slt i64 5, %load78
  %r28 = alloca i64, align 8
  %zext80 = zext i1 %lt79 to i64
  store i64 %zext80, i64* %r28, align 4
  %load81 = load i64, i64* %r27, align 4
  %load82 = load i64, i64* %r12, align 4
  %mul83 = mul i64 %load81, %load82
  %r29 = alloca i64, align 8
  store i64 %mul83, i64* %r29, align 4
  %load84 = load i64, i64* %r29, align 4
  %div85 = sdiv i64 %load84, 10000
  %r30 = alloca i64, align 8
  store i64 %div85, i64* %r30, align 4
  %load86 = load i64, i64* %r27, align 4
  %load87 = load i64, i64* %r30, align 4
  %add88 = add i64 %load86, %load87
  %r31 = alloca i64, align 8
  store i64 %add88, i64* %r31, align 4
  %load89 = load i64, i64* %r28, align 4
  %load90 = load i64, i64* %r31, align 4
  %load91 = load i64, i64* %r27, align 4
  %cast_bool92 = icmp ne i64 %load89, 0
  %ternary93 = select i1 %cast_bool92, i64 %load90, i64 %load91
  %r32 = alloca i64, align 8
  store i64 %ternary93, i64* %r32, align 4
  %load94 = load i64, i64* %r23, align 4
  %lt95 = icmp slt i64 6, %load94
  %r33 = alloca i64, align 8
  %zext96 = zext i1 %lt95 to i64
  store i64 %zext96, i64* %r33, align 4
  %load97 = load i64, i64* %r32, align 4
  %load98 = load i64, i64* %r12, align 4
  %mul99 = mul i64 %load97, %load98
  %r34 = alloca i64, align 8
  store i64 %mul99, i64* %r34, align 4
  %load100 = load i64, i64* %r34, align 4
  %div101 = sdiv i64 %load100, 10000
  %r35 = alloca i64, align 8
  store i64 %div101, i64* %r35, align 4
  %load102 = load i64, i64* %r32, align 4
  %load103 = load i64, i64* %r35, align 4
  %add104 = add i64 %load102, %load103
  %r36 = alloca i64, align 8
  store i64 %add104, i64* %r36, align 4
  %load105 = load i64, i64* %r33, align 4
  %load106 = load i64, i64* %r36, align 4
  %load107 = load i64, i64* %r32, align 4
  %cast_bool108 = icmp ne i64 %load105, 0
  %ternary109 = select i1 %cast_bool108, i64 %load106, i64 %load107
  %r37 = alloca i64, align 8
  store i64 %ternary109, i64* %r37, align 4
  %load110 = load i64, i64* %r23, align 4
  %lt111 = icmp slt i64 7, %load110
  %r38 = alloca i64, align 8
  %zext112 = zext i1 %lt111 to i64
  store i64 %zext112, i64* %r38, align 4
  %load113 = load i64, i64* %r37, align 4
  %load114 = load i64, i64* %r12, align 4
  %mul115 = mul i64 %load113, %load114
  %r39 = alloca i64, align 8
  store i64 %mul115, i64* %r39, align 4
  %load116 = load i64, i64* %r39, align 4
  %div117 = sdiv i64 %load116, 10000
  %r40 = alloca i64, align 8
  store i64 %div117, i64* %r40, align 4
  %load118 = load i64, i64* %r37, align 4
  %load119 = load i64, i64* %r40, align 4
  %add120 = add i64 %load118, %load119
  %r41 = alloca i64, align 8
  store i64 %add120, i64* %r41, align 4
  %load121 = load i64, i64* %r38, align 4
  %load122 = load i64, i64* %r41, align 4
  %load123 = load i64, i64* %r37, align 4
  %cast_bool124 = icmp ne i64 %load121, 0
  %ternary125 = select i1 %cast_bool124, i64 %load122, i64 %load123
  %r42 = alloca i64, align 8
  store i64 %ternary125, i64* %r42, align 4
  %load126 = load i64, i64* %r23, align 4
  %lt127 = icmp slt i64 8, %load126
  %r43 = alloca i64, align 8
  %zext128 = zext i1 %lt127 to i64
  store i64 %zext128, i64* %r43, align 4
  %load129 = load i64, i64* %r42, align 4
  %load130 = load i64, i64* %r12, align 4
  %mul131 = mul i64 %load129, %load130
  %r44 = alloca i64, align 8
  store i64 %mul131, i64* %r44, align 4
  %load132 = load i64, i64* %r44, align 4
  %div133 = sdiv i64 %load132, 10000
  %r45 = alloca i64, align 8
  store i64 %div133, i64* %r45, align 4
  %load134 = load i64, i64* %r42, align 4
  %load135 = load i64, i64* %r45, align 4
  %add136 = add i64 %load134, %load135
  %r46 = alloca i64, align 8
  store i64 %add136, i64* %r46, align 4
  %load137 = load i64, i64* %r43, align 4
  %load138 = load i64, i64* %r46, align 4
  %load139 = load i64, i64* %r42, align 4
  %cast_bool140 = icmp ne i64 %load137, 0
  %ternary141 = select i1 %cast_bool140, i64 %load138, i64 %load139
  %r47 = alloca i64, align 8
  store i64 %ternary141, i64* %r47, align 4
  %load142 = load i64, i64* %r23, align 4
  %lt143 = icmp slt i64 9, %load142
  %r48 = alloca i64, align 8
  %zext144 = zext i1 %lt143 to i64
  store i64 %zext144, i64* %r48, align 4
  %load145 = load i64, i64* %r47, align 4
  %load146 = load i64, i64* %r12, align 4
  %mul147 = mul i64 %load145, %load146
  %r49 = alloca i64, align 8
  store i64 %mul147, i64* %r49, align 4
  %load148 = load i64, i64* %r49, align 4
  %div149 = sdiv i64 %load148, 10000
  %r50 = alloca i64, align 8
  store i64 %div149, i64* %r50, align 4
  %load150 = load i64, i64* %r47, align 4
  %load151 = load i64, i64* %r50, align 4
  %add152 = add i64 %load150, %load151
  %r51 = alloca i64, align 8
  store i64 %add152, i64* %r51, align 4
  %load153 = load i64, i64* %r48, align 4
  %load154 = load i64, i64* %r51, align 4
  %load155 = load i64, i64* %r47, align 4
  %cast_bool156 = icmp ne i64 %load153, 0
  %ternary157 = select i1 %cast_bool156, i64 %load154, i64 %load155
  %r52 = alloca i64, align 8
  store i64 %ternary157, i64* %r52, align 4
  %load158 = load i64, i64* %r23, align 4
  %lt159 = icmp slt i64 10, %load158
  %r53 = alloca i64, align 8
  %zext160 = zext i1 %lt159 to i64
  store i64 %zext160, i64* %r53, align 4
  %load161 = load i64, i64* %r52, align 4
  %load162 = load i64, i64* %r12, align 4
  %mul163 = mul i64 %load161, %load162
  %r54 = alloca i64, align 8
  store i64 %mul163, i64* %r54, align 4
  %load164 = load i64, i64* %r54, align 4
  %div165 = sdiv i64 %load164, 10000
  %r55 = alloca i64, align 8
  store i64 %div165, i64* %r55, align 4
  %load166 = load i64, i64* %r52, align 4
  %load167 = load i64, i64* %r55, align 4
  %add168 = add i64 %load166, %load167
  %r56 = alloca i64, align 8
  store i64 %add168, i64* %r56, align 4
  %load169 = load i64, i64* %r53, align 4
  %load170 = load i64, i64* %r56, align 4
  %load171 = load i64, i64* %r52, align 4
  %cast_bool172 = icmp ne i64 %load169, 0
  %ternary173 = select i1 %cast_bool172, i64 %load170, i64 %load171
  %r57 = alloca i64, align 8
  store i64 %ternary173, i64* %r57, align 4
  %load174 = load i64, i64* %r23, align 4
  %lt175 = icmp slt i64 11, %load174
  %r58 = alloca i64, align 8
  %zext176 = zext i1 %lt175 to i64
  store i64 %zext176, i64* %r58, align 4
  %load177 = load i64, i64* %r57, align 4
  %load178 = load i64, i64* %r12, align 4
  %mul179 = mul i64 %load177, %load178
  %r59 = alloca i64, align 8
  store i64 %mul179, i64* %r59, align 4
  %load180 = load i64, i64* %r59, align 4
  %div181 = sdiv i64 %load180, 10000
  %r60 = alloca i64, align 8
  store i64 %div181, i64* %r60, align 4
  %load182 = load i64, i64* %r57, align 4
  %load183 = load i64, i64* %r60, align 4
  %add184 = add i64 %load182, %load183
  %r61 = alloca i64, align 8
  store i64 %add184, i64* %r61, align 4
  %load185 = load i64, i64* %r58, align 4
  %load186 = load i64, i64* %r61, align 4
  %load187 = load i64, i64* %r57, align 4
  %cast_bool188 = icmp ne i64 %load185, 0
  %ternary189 = select i1 %cast_bool188, i64 %load186, i64 %load187
  %r62 = alloca i64, align 8
  store i64 %ternary189, i64* %r62, align 4
  %load190 = load i64, i64* %r23, align 4
  %lt191 = icmp slt i64 12, %load190
  %r63 = alloca i64, align 8
  %zext192 = zext i1 %lt191 to i64
  store i64 %zext192, i64* %r63, align 4
  %load193 = load i64, i64* %r62, align 4
  %load194 = load i64, i64* %r12, align 4
  %mul195 = mul i64 %load193, %load194
  %r64 = alloca i64, align 8
  store i64 %mul195, i64* %r64, align 4
  %load196 = load i64, i64* %r64, align 4
  %div197 = sdiv i64 %load196, 10000
  %r65 = alloca i64, align 8
  store i64 %div197, i64* %r65, align 4
  %load198 = load i64, i64* %r62, align 4
  %load199 = load i64, i64* %r65, align 4
  %add200 = add i64 %load198, %load199
  %r66 = alloca i64, align 8
  store i64 %add200, i64* %r66, align 4
  %load201 = load i64, i64* %r63, align 4
  %load202 = load i64, i64* %r66, align 4
  %load203 = load i64, i64* %r62, align 4
  %cast_bool204 = icmp ne i64 %load201, 0
  %ternary205 = select i1 %cast_bool204, i64 %load202, i64 %load203
  %r67 = alloca i64, align 8
  store i64 %ternary205, i64* %r67, align 4
  %load206 = load i64, i64* %r23, align 4
  %lt207 = icmp slt i64 13, %load206
  %r68 = alloca i64, align 8
  %zext208 = zext i1 %lt207 to i64
  store i64 %zext208, i64* %r68, align 4
  %load209 = load i64, i64* %r67, align 4
  %load210 = load i64, i64* %r12, align 4
  %mul211 = mul i64 %load209, %load210
  %r69 = alloca i64, align 8
  store i64 %mul211, i64* %r69, align 4
  %load212 = load i64, i64* %r69, align 4
  %div213 = sdiv i64 %load212, 10000
  %r70 = alloca i64, align 8
  store i64 %div213, i64* %r70, align 4
  %load214 = load i64, i64* %r67, align 4
  %load215 = load i64, i64* %r70, align 4
  %add216 = add i64 %load214, %load215
  %r71 = alloca i64, align 8
  store i64 %add216, i64* %r71, align 4
  %load217 = load i64, i64* %r68, align 4
  %load218 = load i64, i64* %r71, align 4
  %load219 = load i64, i64* %r67, align 4
  %cast_bool220 = icmp ne i64 %load217, 0
  %ternary221 = select i1 %cast_bool220, i64 %load218, i64 %load219
  %r72 = alloca i64, align 8
  store i64 %ternary221, i64* %r72, align 4
  %load222 = load i64, i64* %r23, align 4
  %lt223 = icmp slt i64 14, %load222
  %r73 = alloca i64, align 8
  %zext224 = zext i1 %lt223 to i64
  store i64 %zext224, i64* %r73, align 4
  %load225 = load i64, i64* %r72, align 4
  %load226 = load i64, i64* %r12, align 4
  %mul227 = mul i64 %load225, %load226
  %r74 = alloca i64, align 8
  store i64 %mul227, i64* %r74, align 4
  %load228 = load i64, i64* %r74, align 4
  %div229 = sdiv i64 %load228, 10000
  %r75 = alloca i64, align 8
  store i64 %div229, i64* %r75, align 4
  %load230 = load i64, i64* %r72, align 4
  %load231 = load i64, i64* %r75, align 4
  %add232 = add i64 %load230, %load231
  %r76 = alloca i64, align 8
  store i64 %add232, i64* %r76, align 4
  %load233 = load i64, i64* %r73, align 4
  %load234 = load i64, i64* %r76, align 4
  %load235 = load i64, i64* %r72, align 4
  %cast_bool236 = icmp ne i64 %load233, 0
  %ternary237 = select i1 %cast_bool236, i64 %load234, i64 %load235
  %r77 = alloca i64, align 8
  store i64 %ternary237, i64* %r77, align 4
  %load238 = load i64, i64* %r23, align 4
  %lt239 = icmp slt i64 15, %load238
  %r78 = alloca i64, align 8
  %zext240 = zext i1 %lt239 to i64
  store i64 %zext240, i64* %r78, align 4
  %load241 = load i64, i64* %r77, align 4
  %load242 = load i64, i64* %r12, align 4
  %mul243 = mul i64 %load241, %load242
  %r79 = alloca i64, align 8
  store i64 %mul243, i64* %r79, align 4
  %load244 = load i64, i64* %r79, align 4
  %div245 = sdiv i64 %load244, 10000
  %r80 = alloca i64, align 8
  store i64 %div245, i64* %r80, align 4
  %load246 = load i64, i64* %r77, align 4
  %load247 = load i64, i64* %r80, align 4
  %add248 = add i64 %load246, %load247
  %r81 = alloca i64, align 8
  store i64 %add248, i64* %r81, align 4
  %load249 = load i64, i64* %r78, align 4
  %load250 = load i64, i64* %r81, align 4
  %load251 = load i64, i64* %r77, align 4
  %cast_bool252 = icmp ne i64 %load249, 0
  %ternary253 = select i1 %cast_bool252, i64 %load250, i64 %load251
  %r82 = alloca i64, align 8
  store i64 %ternary253, i64* %r82, align 4
  %load254 = load i64, i64* %r23, align 4
  %lt255 = icmp slt i64 16, %load254
  %r83 = alloca i64, align 8
  %zext256 = zext i1 %lt255 to i64
  store i64 %zext256, i64* %r83, align 4
  %load257 = load i64, i64* %r82, align 4
  %load258 = load i64, i64* %r12, align 4
  %mul259 = mul i64 %load257, %load258
  %r84 = alloca i64, align 8
  store i64 %mul259, i64* %r84, align 4
  %load260 = load i64, i64* %r84, align 4
  %div261 = sdiv i64 %load260, 10000
  %r85 = alloca i64, align 8
  store i64 %div261, i64* %r85, align 4
  %load262 = load i64, i64* %r82, align 4
  %load263 = load i64, i64* %r85, align 4
  %add264 = add i64 %load262, %load263
  %r86 = alloca i64, align 8
  store i64 %add264, i64* %r86, align 4
  %load265 = load i64, i64* %r83, align 4
  %load266 = load i64, i64* %r86, align 4
  %load267 = load i64, i64* %r82, align 4
  %cast_bool268 = icmp ne i64 %load265, 0
  %ternary269 = select i1 %cast_bool268, i64 %load266, i64 %load267
  %r87 = alloca i64, align 8
  store i64 %ternary269, i64* %r87, align 4
  %load270 = load i64, i64* %r23, align 4
  %lt271 = icmp slt i64 17, %load270
  %r88 = alloca i64, align 8
  %zext272 = zext i1 %lt271 to i64
  store i64 %zext272, i64* %r88, align 4
  %load273 = load i64, i64* %r87, align 4
  %load274 = load i64, i64* %r12, align 4
  %mul275 = mul i64 %load273, %load274
  %r89 = alloca i64, align 8
  store i64 %mul275, i64* %r89, align 4
  %load276 = load i64, i64* %r89, align 4
  %div277 = sdiv i64 %load276, 10000
  %r90 = alloca i64, align 8
  store i64 %div277, i64* %r90, align 4
  %load278 = load i64, i64* %r87, align 4
  %load279 = load i64, i64* %r90, align 4
  %add280 = add i64 %load278, %load279
  %r91 = alloca i64, align 8
  store i64 %add280, i64* %r91, align 4
  %load281 = load i64, i64* %r88, align 4
  %load282 = load i64, i64* %r91, align 4
  %load283 = load i64, i64* %r87, align 4
  %cast_bool284 = icmp ne i64 %load281, 0
  %ternary285 = select i1 %cast_bool284, i64 %load282, i64 %load283
  %r92 = alloca i64, align 8
  store i64 %ternary285, i64* %r92, align 4
  %load286 = load i64, i64* %r23, align 4
  %lt287 = icmp slt i64 18, %load286
  %r93 = alloca i64, align 8
  %zext288 = zext i1 %lt287 to i64
  store i64 %zext288, i64* %r93, align 4
  %load289 = load i64, i64* %r92, align 4
  %load290 = load i64, i64* %r12, align 4
  %mul291 = mul i64 %load289, %load290
  %r94 = alloca i64, align 8
  store i64 %mul291, i64* %r94, align 4
  %load292 = load i64, i64* %r94, align 4
  %div293 = sdiv i64 %load292, 10000
  %r95 = alloca i64, align 8
  store i64 %div293, i64* %r95, align 4
  %load294 = load i64, i64* %r92, align 4
  %load295 = load i64, i64* %r95, align 4
  %add296 = add i64 %load294, %load295
  %r96 = alloca i64, align 8
  store i64 %add296, i64* %r96, align 4
  %load297 = load i64, i64* %r93, align 4
  %load298 = load i64, i64* %r96, align 4
  %load299 = load i64, i64* %r92, align 4
  %cast_bool300 = icmp ne i64 %load297, 0
  %ternary301 = select i1 %cast_bool300, i64 %load298, i64 %load299
  %r97 = alloca i64, align 8
  store i64 %ternary301, i64* %r97, align 4
  %load302 = load i64, i64* %r23, align 4
  %lt303 = icmp slt i64 19, %load302
  %r98 = alloca i64, align 8
  %zext304 = zext i1 %lt303 to i64
  store i64 %zext304, i64* %r98, align 4
  %load305 = load i64, i64* %r97, align 4
  %load306 = load i64, i64* %r12, align 4
  %mul307 = mul i64 %load305, %load306
  %r99 = alloca i64, align 8
  store i64 %mul307, i64* %r99, align 4
  %load308 = load i64, i64* %r99, align 4
  %div309 = sdiv i64 %load308, 10000
  %r100 = alloca i64, align 8
  store i64 %div309, i64* %r100, align 4
  %load310 = load i64, i64* %r97, align 4
  %load311 = load i64, i64* %r100, align 4
  %add312 = add i64 %load310, %load311
  %r101 = alloca i64, align 8
  store i64 %add312, i64* %r101, align 4
  %load313 = load i64, i64* %r98, align 4
  %load314 = load i64, i64* %r101, align 4
  %load315 = load i64, i64* %r97, align 4
  %cast_bool316 = icmp ne i64 %load313, 0
  %ternary317 = select i1 %cast_bool316, i64 %load314, i64 %load315
  %r102 = alloca i64, align 8
  store i64 %ternary317, i64* %r102, align 4
  %load318 = load i64, i64* %r23, align 4
  %lt319 = icmp slt i64 20, %load318
  %r103 = alloca i64, align 8
  %zext320 = zext i1 %lt319 to i64
  store i64 %zext320, i64* %r103, align 4
  %load321 = load i64, i64* %r102, align 4
  %load322 = load i64, i64* %r12, align 4
  %mul323 = mul i64 %load321, %load322
  %r104 = alloca i64, align 8
  store i64 %mul323, i64* %r104, align 4
  %load324 = load i64, i64* %r104, align 4
  %div325 = sdiv i64 %load324, 10000
  %r105 = alloca i64, align 8
  store i64 %div325, i64* %r105, align 4
  %load326 = load i64, i64* %r102, align 4
  %load327 = load i64, i64* %r105, align 4
  %add328 = add i64 %load326, %load327
  %r106 = alloca i64, align 8
  store i64 %add328, i64* %r106, align 4
  %load329 = load i64, i64* %r103, align 4
  %load330 = load i64, i64* %r106, align 4
  %load331 = load i64, i64* %r102, align 4
  %cast_bool332 = icmp ne i64 %load329, 0
  %ternary333 = select i1 %cast_bool332, i64 %load330, i64 %load331
  %r107 = alloca i64, align 8
  store i64 %ternary333, i64* %r107, align 4
  %load334 = load i64, i64* %r23, align 4
  %lt335 = icmp slt i64 21, %load334
  %r108 = alloca i64, align 8
  %zext336 = zext i1 %lt335 to i64
  store i64 %zext336, i64* %r108, align 4
  %load337 = load i64, i64* %r107, align 4
  %load338 = load i64, i64* %r12, align 4
  %mul339 = mul i64 %load337, %load338
  %r109 = alloca i64, align 8
  store i64 %mul339, i64* %r109, align 4
  %load340 = load i64, i64* %r109, align 4
  %div341 = sdiv i64 %load340, 10000
  %r110 = alloca i64, align 8
  store i64 %div341, i64* %r110, align 4
  %load342 = load i64, i64* %r107, align 4
  %load343 = load i64, i64* %r110, align 4
  %add344 = add i64 %load342, %load343
  %r111 = alloca i64, align 8
  store i64 %add344, i64* %r111, align 4
  %load345 = load i64, i64* %r108, align 4
  %load346 = load i64, i64* %r111, align 4
  %load347 = load i64, i64* %r107, align 4
  %cast_bool348 = icmp ne i64 %load345, 0
  %ternary349 = select i1 %cast_bool348, i64 %load346, i64 %load347
  %r112 = alloca i64, align 8
  store i64 %ternary349, i64* %r112, align 4
  %load350 = load i64, i64* %r23, align 4
  %lt351 = icmp slt i64 22, %load350
  %r113 = alloca i64, align 8
  %zext352 = zext i1 %lt351 to i64
  store i64 %zext352, i64* %r113, align 4
  %load353 = load i64, i64* %r112, align 4
  %load354 = load i64, i64* %r12, align 4
  %mul355 = mul i64 %load353, %load354
  %r114 = alloca i64, align 8
  store i64 %mul355, i64* %r114, align 4
  %load356 = load i64, i64* %r114, align 4
  %div357 = sdiv i64 %load356, 10000
  %r115 = alloca i64, align 8
  store i64 %div357, i64* %r115, align 4
  %load358 = load i64, i64* %r112, align 4
  %load359 = load i64, i64* %r115, align 4
  %add360 = add i64 %load358, %load359
  %r116 = alloca i64, align 8
  store i64 %add360, i64* %r116, align 4
  %load361 = load i64, i64* %r113, align 4
  %load362 = load i64, i64* %r116, align 4
  %load363 = load i64, i64* %r112, align 4
  %cast_bool364 = icmp ne i64 %load361, 0
  %ternary365 = select i1 %cast_bool364, i64 %load362, i64 %load363
  %r117 = alloca i64, align 8
  store i64 %ternary365, i64* %r117, align 4
  %load366 = load i64, i64* %r23, align 4
  %lt367 = icmp slt i64 23, %load366
  %r118 = alloca i64, align 8
  %zext368 = zext i1 %lt367 to i64
  store i64 %zext368, i64* %r118, align 4
  %load369 = load i64, i64* %r117, align 4
  %load370 = load i64, i64* %r12, align 4
  %mul371 = mul i64 %load369, %load370
  %r119 = alloca i64, align 8
  store i64 %mul371, i64* %r119, align 4
  %load372 = load i64, i64* %r119, align 4
  %div373 = sdiv i64 %load372, 10000
  %r120 = alloca i64, align 8
  store i64 %div373, i64* %r120, align 4
  %load374 = load i64, i64* %r117, align 4
  %load375 = load i64, i64* %r120, align 4
  %add376 = add i64 %load374, %load375
  %r121 = alloca i64, align 8
  store i64 %add376, i64* %r121, align 4
  %load377 = load i64, i64* %r118, align 4
  %load378 = load i64, i64* %r121, align 4
  %load379 = load i64, i64* %r117, align 4
  %cast_bool380 = icmp ne i64 %load377, 0
  %ternary381 = select i1 %cast_bool380, i64 %load378, i64 %load379
  %r122 = alloca i64, align 8
  store i64 %ternary381, i64* %r122, align 4
  %load382 = load i64, i64* %r23, align 4
  %lt383 = icmp slt i64 24, %load382
  %r123 = alloca i64, align 8
  %zext384 = zext i1 %lt383 to i64
  store i64 %zext384, i64* %r123, align 4
  %load385 = load i64, i64* %r122, align 4
  %load386 = load i64, i64* %r12, align 4
  %mul387 = mul i64 %load385, %load386
  %r124 = alloca i64, align 8
  store i64 %mul387, i64* %r124, align 4
  %load388 = load i64, i64* %r124, align 4
  %div389 = sdiv i64 %load388, 10000
  %r125 = alloca i64, align 8
  store i64 %div389, i64* %r125, align 4
  %load390 = load i64, i64* %r122, align 4
  %load391 = load i64, i64* %r125, align 4
  %add392 = add i64 %load390, %load391
  %r126 = alloca i64, align 8
  store i64 %add392, i64* %r126, align 4
  %load393 = load i64, i64* %r123, align 4
  %load394 = load i64, i64* %r126, align 4
  %load395 = load i64, i64* %r122, align 4
  %cast_bool396 = icmp ne i64 %load393, 0
  %ternary397 = select i1 %cast_bool396, i64 %load394, i64 %load395
  %r127 = alloca i64, align 8
  store i64 %ternary397, i64* %r127, align 4
  %load398 = load i64, i64* %r23, align 4
  %lt399 = icmp slt i64 25, %load398
  %r128 = alloca i64, align 8
  %zext400 = zext i1 %lt399 to i64
  store i64 %zext400, i64* %r128, align 4
  %load401 = load i64, i64* %r127, align 4
  %load402 = load i64, i64* %r12, align 4
  %mul403 = mul i64 %load401, %load402
  %r129 = alloca i64, align 8
  store i64 %mul403, i64* %r129, align 4
  %load404 = load i64, i64* %r129, align 4
  %div405 = sdiv i64 %load404, 10000
  %r130 = alloca i64, align 8
  store i64 %div405, i64* %r130, align 4
  %load406 = load i64, i64* %r127, align 4
  %load407 = load i64, i64* %r130, align 4
  %add408 = add i64 %load406, %load407
  %r131 = alloca i64, align 8
  store i64 %add408, i64* %r131, align 4
  %load409 = load i64, i64* %r128, align 4
  %load410 = load i64, i64* %r131, align 4
  %load411 = load i64, i64* %r127, align 4
  %cast_bool412 = icmp ne i64 %load409, 0
  %ternary413 = select i1 %cast_bool412, i64 %load410, i64 %load411
  %r132 = alloca i64, align 8
  store i64 %ternary413, i64* %r132, align 4
  %load414 = load i64, i64* %r23, align 4
  %lt415 = icmp slt i64 26, %load414
  %r133 = alloca i64, align 8
  %zext416 = zext i1 %lt415 to i64
  store i64 %zext416, i64* %r133, align 4
  %load417 = load i64, i64* %r132, align 4
  %load418 = load i64, i64* %r12, align 4
  %mul419 = mul i64 %load417, %load418
  %r134 = alloca i64, align 8
  store i64 %mul419, i64* %r134, align 4
  %load420 = load i64, i64* %r134, align 4
  %div421 = sdiv i64 %load420, 10000
  %r135 = alloca i64, align 8
  store i64 %div421, i64* %r135, align 4
  %load422 = load i64, i64* %r132, align 4
  %load423 = load i64, i64* %r135, align 4
  %add424 = add i64 %load422, %load423
  %r136 = alloca i64, align 8
  store i64 %add424, i64* %r136, align 4
  %load425 = load i64, i64* %r133, align 4
  %load426 = load i64, i64* %r136, align 4
  %load427 = load i64, i64* %r132, align 4
  %cast_bool428 = icmp ne i64 %load425, 0
  %ternary429 = select i1 %cast_bool428, i64 %load426, i64 %load427
  %r137 = alloca i64, align 8
  store i64 %ternary429, i64* %r137, align 4
  %load430 = load i64, i64* %r23, align 4
  %lt431 = icmp slt i64 27, %load430
  %r138 = alloca i64, align 8
  %zext432 = zext i1 %lt431 to i64
  store i64 %zext432, i64* %r138, align 4
  %load433 = load i64, i64* %r137, align 4
  %load434 = load i64, i64* %r12, align 4
  %mul435 = mul i64 %load433, %load434
  %r139 = alloca i64, align 8
  store i64 %mul435, i64* %r139, align 4
  %load436 = load i64, i64* %r139, align 4
  %div437 = sdiv i64 %load436, 10000
  %r140 = alloca i64, align 8
  store i64 %div437, i64* %r140, align 4
  %load438 = load i64, i64* %r137, align 4
  %load439 = load i64, i64* %r140, align 4
  %add440 = add i64 %load438, %load439
  %r141 = alloca i64, align 8
  store i64 %add440, i64* %r141, align 4
  %load441 = load i64, i64* %r138, align 4
  %load442 = load i64, i64* %r141, align 4
  %load443 = load i64, i64* %r137, align 4
  %cast_bool444 = icmp ne i64 %load441, 0
  %ternary445 = select i1 %cast_bool444, i64 %load442, i64 %load443
  %r142 = alloca i64, align 8
  store i64 %ternary445, i64* %r142, align 4
  %load446 = load i64, i64* %r23, align 4
  %lt447 = icmp slt i64 28, %load446
  %r143 = alloca i64, align 8
  %zext448 = zext i1 %lt447 to i64
  store i64 %zext448, i64* %r143, align 4
  %load449 = load i64, i64* %r142, align 4
  %load450 = load i64, i64* %r12, align 4
  %mul451 = mul i64 %load449, %load450
  %r144 = alloca i64, align 8
  store i64 %mul451, i64* %r144, align 4
  %load452 = load i64, i64* %r144, align 4
  %div453 = sdiv i64 %load452, 10000
  %r145 = alloca i64, align 8
  store i64 %div453, i64* %r145, align 4
  %load454 = load i64, i64* %r142, align 4
  %load455 = load i64, i64* %r145, align 4
  %add456 = add i64 %load454, %load455
  %r146 = alloca i64, align 8
  store i64 %add456, i64* %r146, align 4
  %load457 = load i64, i64* %r143, align 4
  %load458 = load i64, i64* %r146, align 4
  %load459 = load i64, i64* %r142, align 4
  %cast_bool460 = icmp ne i64 %load457, 0
  %ternary461 = select i1 %cast_bool460, i64 %load458, i64 %load459
  %r147 = alloca i64, align 8
  store i64 %ternary461, i64* %r147, align 4
  %load462 = load i64, i64* %r23, align 4
  %lt463 = icmp slt i64 29, %load462
  %r148 = alloca i64, align 8
  %zext464 = zext i1 %lt463 to i64
  store i64 %zext464, i64* %r148, align 4
  %load465 = load i64, i64* %r147, align 4
  %load466 = load i64, i64* %r12, align 4
  %mul467 = mul i64 %load465, %load466
  %r149 = alloca i64, align 8
  store i64 %mul467, i64* %r149, align 4
  %load468 = load i64, i64* %r149, align 4
  %div469 = sdiv i64 %load468, 10000
  %r150 = alloca i64, align 8
  store i64 %div469, i64* %r150, align 4
  %load470 = load i64, i64* %r147, align 4
  %load471 = load i64, i64* %r150, align 4
  %add472 = add i64 %load470, %load471
  %r151 = alloca i64, align 8
  store i64 %add472, i64* %r151, align 4
  %load473 = load i64, i64* %r148, align 4
  %load474 = load i64, i64* %r151, align 4
  %load475 = load i64, i64* %r147, align 4
  %cast_bool476 = icmp ne i64 %load473, 0
  %ternary477 = select i1 %cast_bool476, i64 %load474, i64 %load475
  %r152 = alloca i64, align 8
  store i64 %ternary477, i64* %r152, align 4
  %load478 = load i64, i64* %r23, align 4
  %lt479 = icmp slt i64 30, %load478
  %r153 = alloca i64, align 8
  %zext480 = zext i1 %lt479 to i64
  store i64 %zext480, i64* %r153, align 4
  %load481 = load i64, i64* %r152, align 4
  %load482 = load i64, i64* %r12, align 4
  %mul483 = mul i64 %load481, %load482
  %r154 = alloca i64, align 8
  store i64 %mul483, i64* %r154, align 4
  %load484 = load i64, i64* %r154, align 4
  %div485 = sdiv i64 %load484, 10000
  %r155 = alloca i64, align 8
  store i64 %div485, i64* %r155, align 4
  %load486 = load i64, i64* %r152, align 4
  %load487 = load i64, i64* %r155, align 4
  %add488 = add i64 %load486, %load487
  %r156 = alloca i64, align 8
  store i64 %add488, i64* %r156, align 4
  %load489 = load i64, i64* %r153, align 4
  %load490 = load i64, i64* %r156, align 4
  %load491 = load i64, i64* %r152, align 4
  %cast_bool492 = icmp ne i64 %load489, 0
  %ternary493 = select i1 %cast_bool492, i64 %load490, i64 %load491
  %r157 = alloca i64, align 8
  store i64 %ternary493, i64* %r157, align 4
  %load494 = load i64, i64* %r23, align 4
  %lt495 = icmp slt i64 31, %load494
  %r158 = alloca i64, align 8
  %zext496 = zext i1 %lt495 to i64
  store i64 %zext496, i64* %r158, align 4
  %load497 = load i64, i64* %r157, align 4
  %load498 = load i64, i64* %r12, align 4
  %mul499 = mul i64 %load497, %load498
  %r159 = alloca i64, align 8
  store i64 %mul499, i64* %r159, align 4
  %load500 = load i64, i64* %r159, align 4
  %div501 = sdiv i64 %load500, 10000
  %r160 = alloca i64, align 8
  store i64 %div501, i64* %r160, align 4
  %load502 = load i64, i64* %r157, align 4
  %load503 = load i64, i64* %r160, align 4
  %add504 = add i64 %load502, %load503
  %r161 = alloca i64, align 8
  store i64 %add504, i64* %r161, align 4
  %load505 = load i64, i64* %r158, align 4
  %load506 = load i64, i64* %r161, align 4
  %load507 = load i64, i64* %r157, align 4
  %cast_bool508 = icmp ne i64 %load505, 0
  %ternary509 = select i1 %cast_bool508, i64 %load506, i64 %load507
  %r162 = alloca i64, align 8
  store i64 %ternary509, i64* %r162, align 4
  %load510 = load i64, i64* %r23, align 4
  %lt511 = icmp slt i64 32, %load510
  %r163 = alloca i64, align 8
  %zext512 = zext i1 %lt511 to i64
  store i64 %zext512, i64* %r163, align 4
  %load513 = load i64, i64* %r162, align 4
  %load514 = load i64, i64* %r12, align 4
  %mul515 = mul i64 %load513, %load514
  %r164 = alloca i64, align 8
  store i64 %mul515, i64* %r164, align 4
  %load516 = load i64, i64* %r164, align 4
  %div517 = sdiv i64 %load516, 10000
  %r165 = alloca i64, align 8
  store i64 %div517, i64* %r165, align 4
  %load518 = load i64, i64* %r162, align 4
  %load519 = load i64, i64* %r165, align 4
  %add520 = add i64 %load518, %load519
  %r166 = alloca i64, align 8
  store i64 %add520, i64* %r166, align 4
  %load521 = load i64, i64* %r163, align 4
  %load522 = load i64, i64* %r166, align 4
  %load523 = load i64, i64* %r162, align 4
  %cast_bool524 = icmp ne i64 %load521, 0
  %ternary525 = select i1 %cast_bool524, i64 %load522, i64 %load523
  %r167 = alloca i64, align 8
  store i64 %ternary525, i64* %r167, align 4
  %load526 = load i64, i64* %r23, align 4
  %lt527 = icmp slt i64 33, %load526
  %r168 = alloca i64, align 8
  %zext528 = zext i1 %lt527 to i64
  store i64 %zext528, i64* %r168, align 4
  %load529 = load i64, i64* %r167, align 4
  %load530 = load i64, i64* %r12, align 4
  %mul531 = mul i64 %load529, %load530
  %r169 = alloca i64, align 8
  store i64 %mul531, i64* %r169, align 4
  %load532 = load i64, i64* %r169, align 4
  %div533 = sdiv i64 %load532, 10000
  %r170 = alloca i64, align 8
  store i64 %div533, i64* %r170, align 4
  %load534 = load i64, i64* %r167, align 4
  %load535 = load i64, i64* %r170, align 4
  %add536 = add i64 %load534, %load535
  %r171 = alloca i64, align 8
  store i64 %add536, i64* %r171, align 4
  %load537 = load i64, i64* %r168, align 4
  %load538 = load i64, i64* %r171, align 4
  %load539 = load i64, i64* %r167, align 4
  %cast_bool540 = icmp ne i64 %load537, 0
  %ternary541 = select i1 %cast_bool540, i64 %load538, i64 %load539
  %r172 = alloca i64, align 8
  store i64 %ternary541, i64* %r172, align 4
  %load542 = load i64, i64* %r23, align 4
  %lt543 = icmp slt i64 34, %load542
  %r173 = alloca i64, align 8
  %zext544 = zext i1 %lt543 to i64
  store i64 %zext544, i64* %r173, align 4
  %load545 = load i64, i64* %r172, align 4
  %load546 = load i64, i64* %r12, align 4
  %mul547 = mul i64 %load545, %load546
  %r174 = alloca i64, align 8
  store i64 %mul547, i64* %r174, align 4
  %load548 = load i64, i64* %r174, align 4
  %div549 = sdiv i64 %load548, 10000
  %r175 = alloca i64, align 8
  store i64 %div549, i64* %r175, align 4
  %load550 = load i64, i64* %r172, align 4
  %load551 = load i64, i64* %r175, align 4
  %add552 = add i64 %load550, %load551
  %r176 = alloca i64, align 8
  store i64 %add552, i64* %r176, align 4
  %load553 = load i64, i64* %r173, align 4
  %load554 = load i64, i64* %r176, align 4
  %load555 = load i64, i64* %r172, align 4
  %cast_bool556 = icmp ne i64 %load553, 0
  %ternary557 = select i1 %cast_bool556, i64 %load554, i64 %load555
  %r177 = alloca i64, align 8
  store i64 %ternary557, i64* %r177, align 4
  %load558 = load i64, i64* %r23, align 4
  %lt559 = icmp slt i64 35, %load558
  %r178 = alloca i64, align 8
  %zext560 = zext i1 %lt559 to i64
  store i64 %zext560, i64* %r178, align 4
  %load561 = load i64, i64* %r177, align 4
  %load562 = load i64, i64* %r12, align 4
  %mul563 = mul i64 %load561, %load562
  %r179 = alloca i64, align 8
  store i64 %mul563, i64* %r179, align 4
  %load564 = load i64, i64* %r179, align 4
  %div565 = sdiv i64 %load564, 10000
  %r180 = alloca i64, align 8
  store i64 %div565, i64* %r180, align 4
  %load566 = load i64, i64* %r177, align 4
  %load567 = load i64, i64* %r180, align 4
  %add568 = add i64 %load566, %load567
  %r181 = alloca i64, align 8
  store i64 %add568, i64* %r181, align 4
  %load569 = load i64, i64* %r178, align 4
  %load570 = load i64, i64* %r181, align 4
  %load571 = load i64, i64* %r177, align 4
  %cast_bool572 = icmp ne i64 %load569, 0
  %ternary573 = select i1 %cast_bool572, i64 %load570, i64 %load571
  %r182 = alloca i64, align 8
  store i64 %ternary573, i64* %r182, align 4
  %load574 = load i64, i64* %r23, align 4
  %lt575 = icmp slt i64 36, %load574
  %r183 = alloca i64, align 8
  %zext576 = zext i1 %lt575 to i64
  store i64 %zext576, i64* %r183, align 4
  %load577 = load i64, i64* %r182, align 4
  %load578 = load i64, i64* %r12, align 4
  %mul579 = mul i64 %load577, %load578
  %r184 = alloca i64, align 8
  store i64 %mul579, i64* %r184, align 4
  %load580 = load i64, i64* %r184, align 4
  %div581 = sdiv i64 %load580, 10000
  %r185 = alloca i64, align 8
  store i64 %div581, i64* %r185, align 4
  %load582 = load i64, i64* %r182, align 4
  %load583 = load i64, i64* %r185, align 4
  %add584 = add i64 %load582, %load583
  %r186 = alloca i64, align 8
  store i64 %add584, i64* %r186, align 4
  %load585 = load i64, i64* %r183, align 4
  %load586 = load i64, i64* %r186, align 4
  %load587 = load i64, i64* %r182, align 4
  %cast_bool588 = icmp ne i64 %load585, 0
  %ternary589 = select i1 %cast_bool588, i64 %load586, i64 %load587
  %r187 = alloca i64, align 8
  store i64 %ternary589, i64* %r187, align 4
  %load590 = load i64, i64* %r23, align 4
  %lt591 = icmp slt i64 37, %load590
  %r188 = alloca i64, align 8
  %zext592 = zext i1 %lt591 to i64
  store i64 %zext592, i64* %r188, align 4
  %load593 = load i64, i64* %r187, align 4
  %load594 = load i64, i64* %r12, align 4
  %mul595 = mul i64 %load593, %load594
  %r189 = alloca i64, align 8
  store i64 %mul595, i64* %r189, align 4
  %load596 = load i64, i64* %r189, align 4
  %div597 = sdiv i64 %load596, 10000
  %r190 = alloca i64, align 8
  store i64 %div597, i64* %r190, align 4
  %load598 = load i64, i64* %r187, align 4
  %load599 = load i64, i64* %r190, align 4
  %add600 = add i64 %load598, %load599
  %r191 = alloca i64, align 8
  store i64 %add600, i64* %r191, align 4
  %load601 = load i64, i64* %r188, align 4
  %load602 = load i64, i64* %r191, align 4
  %load603 = load i64, i64* %r187, align 4
  %cast_bool604 = icmp ne i64 %load601, 0
  %ternary605 = select i1 %cast_bool604, i64 %load602, i64 %load603
  %r192 = alloca i64, align 8
  store i64 %ternary605, i64* %r192, align 4
  %load606 = load i64, i64* %r23, align 4
  %lt607 = icmp slt i64 38, %load606
  %r193 = alloca i64, align 8
  %zext608 = zext i1 %lt607 to i64
  store i64 %zext608, i64* %r193, align 4
  %load609 = load i64, i64* %r192, align 4
  %load610 = load i64, i64* %r12, align 4
  %mul611 = mul i64 %load609, %load610
  %r194 = alloca i64, align 8
  store i64 %mul611, i64* %r194, align 4
  %load612 = load i64, i64* %r194, align 4
  %div613 = sdiv i64 %load612, 10000
  %r195 = alloca i64, align 8
  store i64 %div613, i64* %r195, align 4
  %load614 = load i64, i64* %r192, align 4
  %load615 = load i64, i64* %r195, align 4
  %add616 = add i64 %load614, %load615
  %r196 = alloca i64, align 8
  store i64 %add616, i64* %r196, align 4
  %load617 = load i64, i64* %r193, align 4
  %load618 = load i64, i64* %r196, align 4
  %load619 = load i64, i64* %r192, align 4
  %cast_bool620 = icmp ne i64 %load617, 0
  %ternary621 = select i1 %cast_bool620, i64 %load618, i64 %load619
  %r197 = alloca i64, align 8
  store i64 %ternary621, i64* %r197, align 4
  %load622 = load i64, i64* %r23, align 4
  %lt623 = icmp slt i64 39, %load622
  %r198 = alloca i64, align 8
  %zext624 = zext i1 %lt623 to i64
  store i64 %zext624, i64* %r198, align 4
  %load625 = load i64, i64* %r197, align 4
  %load626 = load i64, i64* %r12, align 4
  %mul627 = mul i64 %load625, %load626
  %r199 = alloca i64, align 8
  store i64 %mul627, i64* %r199, align 4
  %load628 = load i64, i64* %r199, align 4
  %div629 = sdiv i64 %load628, 10000
  %r200 = alloca i64, align 8
  store i64 %div629, i64* %r200, align 4
  %load630 = load i64, i64* %r197, align 4
  %load631 = load i64, i64* %r200, align 4
  %add632 = add i64 %load630, %load631
  %r201 = alloca i64, align 8
  store i64 %add632, i64* %r201, align 4
  %load633 = load i64, i64* %r198, align 4
  %load634 = load i64, i64* %r201, align 4
  %load635 = load i64, i64* %r197, align 4
  %cast_bool636 = icmp ne i64 %load633, 0
  %ternary637 = select i1 %cast_bool636, i64 %load634, i64 %load635
  %r202 = alloca i64, align 8
  store i64 %ternary637, i64* %r202, align 4
  %load638 = load i64, i64* %r23, align 4
  %lt639 = icmp slt i64 40, %load638
  %r203 = alloca i64, align 8
  %zext640 = zext i1 %lt639 to i64
  store i64 %zext640, i64* %r203, align 4
  %load641 = load i64, i64* %r202, align 4
  %load642 = load i64, i64* %r12, align 4
  %mul643 = mul i64 %load641, %load642
  %r204 = alloca i64, align 8
  store i64 %mul643, i64* %r204, align 4
  %load644 = load i64, i64* %r204, align 4
  %div645 = sdiv i64 %load644, 10000
  %r205 = alloca i64, align 8
  store i64 %div645, i64* %r205, align 4
  %load646 = load i64, i64* %r202, align 4
  %load647 = load i64, i64* %r205, align 4
  %add648 = add i64 %load646, %load647
  %r206 = alloca i64, align 8
  store i64 %add648, i64* %r206, align 4
  %load649 = load i64, i64* %r203, align 4
  %load650 = load i64, i64* %r206, align 4
  %load651 = load i64, i64* %r202, align 4
  %cast_bool652 = icmp ne i64 %load649, 0
  %ternary653 = select i1 %cast_bool652, i64 %load650, i64 %load651
  %r207 = alloca i64, align 8
  store i64 %ternary653, i64* %r207, align 4
  %load654 = load i64, i64* %r23, align 4
  %lt655 = icmp slt i64 41, %load654
  %r208 = alloca i64, align 8
  %zext656 = zext i1 %lt655 to i64
  store i64 %zext656, i64* %r208, align 4
  %load657 = load i64, i64* %r207, align 4
  %load658 = load i64, i64* %r12, align 4
  %mul659 = mul i64 %load657, %load658
  %r209 = alloca i64, align 8
  store i64 %mul659, i64* %r209, align 4
  %load660 = load i64, i64* %r209, align 4
  %div661 = sdiv i64 %load660, 10000
  %r210 = alloca i64, align 8
  store i64 %div661, i64* %r210, align 4
  %load662 = load i64, i64* %r207, align 4
  %load663 = load i64, i64* %r210, align 4
  %add664 = add i64 %load662, %load663
  %r211 = alloca i64, align 8
  store i64 %add664, i64* %r211, align 4
  %load665 = load i64, i64* %r208, align 4
  %load666 = load i64, i64* %r211, align 4
  %load667 = load i64, i64* %r207, align 4
  %cast_bool668 = icmp ne i64 %load665, 0
  %ternary669 = select i1 %cast_bool668, i64 %load666, i64 %load667
  %r212 = alloca i64, align 8
  store i64 %ternary669, i64* %r212, align 4
  %load670 = load i64, i64* %r23, align 4
  %lt671 = icmp slt i64 42, %load670
  %r213 = alloca i64, align 8
  %zext672 = zext i1 %lt671 to i64
  store i64 %zext672, i64* %r213, align 4
  %load673 = load i64, i64* %r212, align 4
  %load674 = load i64, i64* %r12, align 4
  %mul675 = mul i64 %load673, %load674
  %r214 = alloca i64, align 8
  store i64 %mul675, i64* %r214, align 4
  %load676 = load i64, i64* %r214, align 4
  %div677 = sdiv i64 %load676, 10000
  %r215 = alloca i64, align 8
  store i64 %div677, i64* %r215, align 4
  %load678 = load i64, i64* %r212, align 4
  %load679 = load i64, i64* %r215, align 4
  %add680 = add i64 %load678, %load679
  %r216 = alloca i64, align 8
  store i64 %add680, i64* %r216, align 4
  %load681 = load i64, i64* %r213, align 4
  %load682 = load i64, i64* %r216, align 4
  %load683 = load i64, i64* %r212, align 4
  %cast_bool684 = icmp ne i64 %load681, 0
  %ternary685 = select i1 %cast_bool684, i64 %load682, i64 %load683
  %r217 = alloca i64, align 8
  store i64 %ternary685, i64* %r217, align 4
  %load686 = load i64, i64* %r23, align 4
  %lt687 = icmp slt i64 43, %load686
  %r218 = alloca i64, align 8
  %zext688 = zext i1 %lt687 to i64
  store i64 %zext688, i64* %r218, align 4
  %load689 = load i64, i64* %r217, align 4
  %load690 = load i64, i64* %r12, align 4
  %mul691 = mul i64 %load689, %load690
  %r219 = alloca i64, align 8
  store i64 %mul691, i64* %r219, align 4
  %load692 = load i64, i64* %r219, align 4
  %div693 = sdiv i64 %load692, 10000
  %r220 = alloca i64, align 8
  store i64 %div693, i64* %r220, align 4
  %load694 = load i64, i64* %r217, align 4
  %load695 = load i64, i64* %r220, align 4
  %add696 = add i64 %load694, %load695
  %r221 = alloca i64, align 8
  store i64 %add696, i64* %r221, align 4
  %load697 = load i64, i64* %r218, align 4
  %load698 = load i64, i64* %r221, align 4
  %load699 = load i64, i64* %r217, align 4
  %cast_bool700 = icmp ne i64 %load697, 0
  %ternary701 = select i1 %cast_bool700, i64 %load698, i64 %load699
  %r222 = alloca i64, align 8
  store i64 %ternary701, i64* %r222, align 4
  %load702 = load i64, i64* %r23, align 4
  %lt703 = icmp slt i64 44, %load702
  %r223 = alloca i64, align 8
  %zext704 = zext i1 %lt703 to i64
  store i64 %zext704, i64* %r223, align 4
  %load705 = load i64, i64* %r222, align 4
  %load706 = load i64, i64* %r12, align 4
  %mul707 = mul i64 %load705, %load706
  %r224 = alloca i64, align 8
  store i64 %mul707, i64* %r224, align 4
  %load708 = load i64, i64* %r224, align 4
  %div709 = sdiv i64 %load708, 10000
  %r225 = alloca i64, align 8
  store i64 %div709, i64* %r225, align 4
  %load710 = load i64, i64* %r222, align 4
  %load711 = load i64, i64* %r225, align 4
  %add712 = add i64 %load710, %load711
  %r226 = alloca i64, align 8
  store i64 %add712, i64* %r226, align 4
  %load713 = load i64, i64* %r223, align 4
  %load714 = load i64, i64* %r226, align 4
  %load715 = load i64, i64* %r222, align 4
  %cast_bool716 = icmp ne i64 %load713, 0
  %ternary717 = select i1 %cast_bool716, i64 %load714, i64 %load715
  %r227 = alloca i64, align 8
  store i64 %ternary717, i64* %r227, align 4
  %load718 = load i64, i64* %r23, align 4
  %lt719 = icmp slt i64 45, %load718
  %r228 = alloca i64, align 8
  %zext720 = zext i1 %lt719 to i64
  store i64 %zext720, i64* %r228, align 4
  %load721 = load i64, i64* %r227, align 4
  %load722 = load i64, i64* %r12, align 4
  %mul723 = mul i64 %load721, %load722
  %r229 = alloca i64, align 8
  store i64 %mul723, i64* %r229, align 4
  %load724 = load i64, i64* %r229, align 4
  %div725 = sdiv i64 %load724, 10000
  %r230 = alloca i64, align 8
  store i64 %div725, i64* %r230, align 4
  %load726 = load i64, i64* %r227, align 4
  %load727 = load i64, i64* %r230, align 4
  %add728 = add i64 %load726, %load727
  %r231 = alloca i64, align 8
  store i64 %add728, i64* %r231, align 4
  %load729 = load i64, i64* %r228, align 4
  %load730 = load i64, i64* %r231, align 4
  %load731 = load i64, i64* %r227, align 4
  %cast_bool732 = icmp ne i64 %load729, 0
  %ternary733 = select i1 %cast_bool732, i64 %load730, i64 %load731
  %r232 = alloca i64, align 8
  store i64 %ternary733, i64* %r232, align 4
  %load734 = load i64, i64* %r23, align 4
  %lt735 = icmp slt i64 46, %load734
  %r233 = alloca i64, align 8
  %zext736 = zext i1 %lt735 to i64
  store i64 %zext736, i64* %r233, align 4
  %load737 = load i64, i64* %r232, align 4
  %load738 = load i64, i64* %r12, align 4
  %mul739 = mul i64 %load737, %load738
  %r234 = alloca i64, align 8
  store i64 %mul739, i64* %r234, align 4
  %load740 = load i64, i64* %r234, align 4
  %div741 = sdiv i64 %load740, 10000
  %r235 = alloca i64, align 8
  store i64 %div741, i64* %r235, align 4
  %load742 = load i64, i64* %r232, align 4
  %load743 = load i64, i64* %r235, align 4
  %add744 = add i64 %load742, %load743
  %r236 = alloca i64, align 8
  store i64 %add744, i64* %r236, align 4
  %load745 = load i64, i64* %r233, align 4
  %load746 = load i64, i64* %r236, align 4
  %load747 = load i64, i64* %r232, align 4
  %cast_bool748 = icmp ne i64 %load745, 0
  %ternary749 = select i1 %cast_bool748, i64 %load746, i64 %load747
  %r237 = alloca i64, align 8
  store i64 %ternary749, i64* %r237, align 4
  %load750 = load i64, i64* %r23, align 4
  %lt751 = icmp slt i64 47, %load750
  %r238 = alloca i64, align 8
  %zext752 = zext i1 %lt751 to i64
  store i64 %zext752, i64* %r238, align 4
  %load753 = load i64, i64* %r237, align 4
  %load754 = load i64, i64* %r12, align 4
  %mul755 = mul i64 %load753, %load754
  %r239 = alloca i64, align 8
  store i64 %mul755, i64* %r239, align 4
  %load756 = load i64, i64* %r239, align 4
  %div757 = sdiv i64 %load756, 10000
  %r240 = alloca i64, align 8
  store i64 %div757, i64* %r240, align 4
  %load758 = load i64, i64* %r237, align 4
  %load759 = load i64, i64* %r240, align 4
  %add760 = add i64 %load758, %load759
  %r241 = alloca i64, align 8
  store i64 %add760, i64* %r241, align 4
  %load761 = load i64, i64* %r238, align 4
  %load762 = load i64, i64* %r241, align 4
  %load763 = load i64, i64* %r237, align 4
  %cast_bool764 = icmp ne i64 %load761, 0
  %ternary765 = select i1 %cast_bool764, i64 %load762, i64 %load763
  %r242 = alloca i64, align 8
  store i64 %ternary765, i64* %r242, align 4
  %load766 = load i64, i64* %r23, align 4
  %lt767 = icmp slt i64 48, %load766
  %r243 = alloca i64, align 8
  %zext768 = zext i1 %lt767 to i64
  store i64 %zext768, i64* %r243, align 4
  %load769 = load i64, i64* %r242, align 4
  %load770 = load i64, i64* %r12, align 4
  %mul771 = mul i64 %load769, %load770
  %r244 = alloca i64, align 8
  store i64 %mul771, i64* %r244, align 4
  %load772 = load i64, i64* %r244, align 4
  %div773 = sdiv i64 %load772, 10000
  %r245 = alloca i64, align 8
  store i64 %div773, i64* %r245, align 4
  %load774 = load i64, i64* %r242, align 4
  %load775 = load i64, i64* %r245, align 4
  %add776 = add i64 %load774, %load775
  %r246 = alloca i64, align 8
  store i64 %add776, i64* %r246, align 4
  %load777 = load i64, i64* %r243, align 4
  %load778 = load i64, i64* %r246, align 4
  %load779 = load i64, i64* %r242, align 4
  %cast_bool780 = icmp ne i64 %load777, 0
  %ternary781 = select i1 %cast_bool780, i64 %load778, i64 %load779
  %r247 = alloca i64, align 8
  store i64 %ternary781, i64* %r247, align 4
  %load782 = load i64, i64* %r23, align 4
  %lt783 = icmp slt i64 49, %load782
  %r248 = alloca i64, align 8
  %zext784 = zext i1 %lt783 to i64
  store i64 %zext784, i64* %r248, align 4
  %load785 = load i64, i64* %r247, align 4
  %load786 = load i64, i64* %r12, align 4
  %mul787 = mul i64 %load785, %load786
  %r249 = alloca i64, align 8
  store i64 %mul787, i64* %r249, align 4
  %load788 = load i64, i64* %r249, align 4
  %div789 = sdiv i64 %load788, 10000
  %r250 = alloca i64, align 8
  store i64 %div789, i64* %r250, align 4
  %load790 = load i64, i64* %r247, align 4
  %load791 = load i64, i64* %r250, align 4
  %add792 = add i64 %load790, %load791
  %r251 = alloca i64, align 8
  store i64 %add792, i64* %r251, align 4
  %load793 = load i64, i64* %r248, align 4
  %load794 = load i64, i64* %r251, align 4
  %load795 = load i64, i64* %r247, align 4
  %cast_bool796 = icmp ne i64 %load793, 0
  %ternary797 = select i1 %cast_bool796, i64 %load794, i64 %load795
  %r252 = alloca i64, align 8
  store i64 %ternary797, i64* %r252, align 4
  %load798 = load i64, i64* %r23, align 4
  %lt799 = icmp slt i64 50, %load798
  %r253 = alloca i64, align 8
  %zext800 = zext i1 %lt799 to i64
  store i64 %zext800, i64* %r253, align 4
  %load801 = load i64, i64* %r252, align 4
  %load802 = load i64, i64* %r12, align 4
  %mul803 = mul i64 %load801, %load802
  %r254 = alloca i64, align 8
  store i64 %mul803, i64* %r254, align 4
  %load804 = load i64, i64* %r254, align 4
  %div805 = sdiv i64 %load804, 10000
  %r255 = alloca i64, align 8
  store i64 %div805, i64* %r255, align 4
  %load806 = load i64, i64* %r252, align 4
  %load807 = load i64, i64* %r255, align 4
  %add808 = add i64 %load806, %load807
  %r256 = alloca i64, align 8
  store i64 %add808, i64* %r256, align 4
  %load809 = load i64, i64* %r253, align 4
  %load810 = load i64, i64* %r256, align 4
  %load811 = load i64, i64* %r252, align 4
  %cast_bool812 = icmp ne i64 %load809, 0
  %ternary813 = select i1 %cast_bool812, i64 %load810, i64 %load811
  %r257 = alloca i64, align 8
  store i64 %ternary813, i64* %r257, align 4
  %load814 = load i64, i64* %r23, align 4
  %lt815 = icmp slt i64 51, %load814
  %r258 = alloca i64, align 8
  %zext816 = zext i1 %lt815 to i64
  store i64 %zext816, i64* %r258, align 4
  %load817 = load i64, i64* %r257, align 4
  %load818 = load i64, i64* %r12, align 4
  %mul819 = mul i64 %load817, %load818
  %r259 = alloca i64, align 8
  store i64 %mul819, i64* %r259, align 4
  %load820 = load i64, i64* %r259, align 4
  %div821 = sdiv i64 %load820, 10000
  %r260 = alloca i64, align 8
  store i64 %div821, i64* %r260, align 4
  %load822 = load i64, i64* %r257, align 4
  %load823 = load i64, i64* %r260, align 4
  %add824 = add i64 %load822, %load823
  %r261 = alloca i64, align 8
  store i64 %add824, i64* %r261, align 4
  %load825 = load i64, i64* %r258, align 4
  %load826 = load i64, i64* %r261, align 4
  %load827 = load i64, i64* %r257, align 4
  %cast_bool828 = icmp ne i64 %load825, 0
  %ternary829 = select i1 %cast_bool828, i64 %load826, i64 %load827
  %r262 = alloca i64, align 8
  store i64 %ternary829, i64* %r262, align 4
  %load830 = load i64, i64* %r23, align 4
  %lt831 = icmp slt i64 52, %load830
  %r263 = alloca i64, align 8
  %zext832 = zext i1 %lt831 to i64
  store i64 %zext832, i64* %r263, align 4
  %load833 = load i64, i64* %r262, align 4
  %load834 = load i64, i64* %r12, align 4
  %mul835 = mul i64 %load833, %load834
  %r264 = alloca i64, align 8
  store i64 %mul835, i64* %r264, align 4
  %load836 = load i64, i64* %r264, align 4
  %div837 = sdiv i64 %load836, 10000
  %r265 = alloca i64, align 8
  store i64 %div837, i64* %r265, align 4
  %load838 = load i64, i64* %r262, align 4
  %load839 = load i64, i64* %r265, align 4
  %add840 = add i64 %load838, %load839
  %r266 = alloca i64, align 8
  store i64 %add840, i64* %r266, align 4
  %load841 = load i64, i64* %r263, align 4
  %load842 = load i64, i64* %r266, align 4
  %load843 = load i64, i64* %r262, align 4
  %cast_bool844 = icmp ne i64 %load841, 0
  %ternary845 = select i1 %cast_bool844, i64 %load842, i64 %load843
  %r267 = alloca i64, align 8
  store i64 %ternary845, i64* %r267, align 4
  %load846 = load i64, i64* %r23, align 4
  %lt847 = icmp slt i64 53, %load846
  %r268 = alloca i64, align 8
  %zext848 = zext i1 %lt847 to i64
  store i64 %zext848, i64* %r268, align 4
  %load849 = load i64, i64* %r267, align 4
  %load850 = load i64, i64* %r12, align 4
  %mul851 = mul i64 %load849, %load850
  %r269 = alloca i64, align 8
  store i64 %mul851, i64* %r269, align 4
  %load852 = load i64, i64* %r269, align 4
  %div853 = sdiv i64 %load852, 10000
  %r270 = alloca i64, align 8
  store i64 %div853, i64* %r270, align 4
  %load854 = load i64, i64* %r267, align 4
  %load855 = load i64, i64* %r270, align 4
  %add856 = add i64 %load854, %load855
  %r271 = alloca i64, align 8
  store i64 %add856, i64* %r271, align 4
  %load857 = load i64, i64* %r268, align 4
  %load858 = load i64, i64* %r271, align 4
  %load859 = load i64, i64* %r267, align 4
  %cast_bool860 = icmp ne i64 %load857, 0
  %ternary861 = select i1 %cast_bool860, i64 %load858, i64 %load859
  %r272 = alloca i64, align 8
  store i64 %ternary861, i64* %r272, align 4
  %load862 = load i64, i64* %r23, align 4
  %lt863 = icmp slt i64 54, %load862
  %r273 = alloca i64, align 8
  %zext864 = zext i1 %lt863 to i64
  store i64 %zext864, i64* %r273, align 4
  %load865 = load i64, i64* %r272, align 4
  %load866 = load i64, i64* %r12, align 4
  %mul867 = mul i64 %load865, %load866
  %r274 = alloca i64, align 8
  store i64 %mul867, i64* %r274, align 4
  %load868 = load i64, i64* %r274, align 4
  %div869 = sdiv i64 %load868, 10000
  %r275 = alloca i64, align 8
  store i64 %div869, i64* %r275, align 4
  %load870 = load i64, i64* %r272, align 4
  %load871 = load i64, i64* %r275, align 4
  %add872 = add i64 %load870, %load871
  %r276 = alloca i64, align 8
  store i64 %add872, i64* %r276, align 4
  %load873 = load i64, i64* %r273, align 4
  %load874 = load i64, i64* %r276, align 4
  %load875 = load i64, i64* %r272, align 4
  %cast_bool876 = icmp ne i64 %load873, 0
  %ternary877 = select i1 %cast_bool876, i64 %load874, i64 %load875
  %r277 = alloca i64, align 8
  store i64 %ternary877, i64* %r277, align 4
  %load878 = load i64, i64* %r23, align 4
  %lt879 = icmp slt i64 55, %load878
  %r278 = alloca i64, align 8
  %zext880 = zext i1 %lt879 to i64
  store i64 %zext880, i64* %r278, align 4
  %load881 = load i64, i64* %r277, align 4
  %load882 = load i64, i64* %r12, align 4
  %mul883 = mul i64 %load881, %load882
  %r279 = alloca i64, align 8
  store i64 %mul883, i64* %r279, align 4
  %load884 = load i64, i64* %r279, align 4
  %div885 = sdiv i64 %load884, 10000
  %r280 = alloca i64, align 8
  store i64 %div885, i64* %r280, align 4
  %load886 = load i64, i64* %r277, align 4
  %load887 = load i64, i64* %r280, align 4
  %add888 = add i64 %load886, %load887
  %r281 = alloca i64, align 8
  store i64 %add888, i64* %r281, align 4
  %load889 = load i64, i64* %r278, align 4
  %load890 = load i64, i64* %r281, align 4
  %load891 = load i64, i64* %r277, align 4
  %cast_bool892 = icmp ne i64 %load889, 0
  %ternary893 = select i1 %cast_bool892, i64 %load890, i64 %load891
  %r282 = alloca i64, align 8
  store i64 %ternary893, i64* %r282, align 4
  %load894 = load i64, i64* %r23, align 4
  %lt895 = icmp slt i64 56, %load894
  %r283 = alloca i64, align 8
  %zext896 = zext i1 %lt895 to i64
  store i64 %zext896, i64* %r283, align 4
  %load897 = load i64, i64* %r282, align 4
  %load898 = load i64, i64* %r12, align 4
  %mul899 = mul i64 %load897, %load898
  %r284 = alloca i64, align 8
  store i64 %mul899, i64* %r284, align 4
  %load900 = load i64, i64* %r284, align 4
  %div901 = sdiv i64 %load900, 10000
  %r285 = alloca i64, align 8
  store i64 %div901, i64* %r285, align 4
  %load902 = load i64, i64* %r282, align 4
  %load903 = load i64, i64* %r285, align 4
  %add904 = add i64 %load902, %load903
  %r286 = alloca i64, align 8
  store i64 %add904, i64* %r286, align 4
  %load905 = load i64, i64* %r283, align 4
  %load906 = load i64, i64* %r286, align 4
  %load907 = load i64, i64* %r282, align 4
  %cast_bool908 = icmp ne i64 %load905, 0
  %ternary909 = select i1 %cast_bool908, i64 %load906, i64 %load907
  %r287 = alloca i64, align 8
  store i64 %ternary909, i64* %r287, align 4
  %load910 = load i64, i64* %r23, align 4
  %lt911 = icmp slt i64 57, %load910
  %r288 = alloca i64, align 8
  %zext912 = zext i1 %lt911 to i64
  store i64 %zext912, i64* %r288, align 4
  %load913 = load i64, i64* %r287, align 4
  %load914 = load i64, i64* %r12, align 4
  %mul915 = mul i64 %load913, %load914
  %r289 = alloca i64, align 8
  store i64 %mul915, i64* %r289, align 4
  %load916 = load i64, i64* %r289, align 4
  %div917 = sdiv i64 %load916, 10000
  %r290 = alloca i64, align 8
  store i64 %div917, i64* %r290, align 4
  %load918 = load i64, i64* %r287, align 4
  %load919 = load i64, i64* %r290, align 4
  %add920 = add i64 %load918, %load919
  %r291 = alloca i64, align 8
  store i64 %add920, i64* %r291, align 4
  %load921 = load i64, i64* %r288, align 4
  %load922 = load i64, i64* %r291, align 4
  %load923 = load i64, i64* %r287, align 4
  %cast_bool924 = icmp ne i64 %load921, 0
  %ternary925 = select i1 %cast_bool924, i64 %load922, i64 %load923
  %r292 = alloca i64, align 8
  store i64 %ternary925, i64* %r292, align 4
  %load926 = load i64, i64* %r23, align 4
  %lt927 = icmp slt i64 58, %load926
  %r293 = alloca i64, align 8
  %zext928 = zext i1 %lt927 to i64
  store i64 %zext928, i64* %r293, align 4
  %load929 = load i64, i64* %r292, align 4
  %load930 = load i64, i64* %r12, align 4
  %mul931 = mul i64 %load929, %load930
  %r294 = alloca i64, align 8
  store i64 %mul931, i64* %r294, align 4
  %load932 = load i64, i64* %r294, align 4
  %div933 = sdiv i64 %load932, 10000
  %r295 = alloca i64, align 8
  store i64 %div933, i64* %r295, align 4
  %load934 = load i64, i64* %r292, align 4
  %load935 = load i64, i64* %r295, align 4
  %add936 = add i64 %load934, %load935
  %r296 = alloca i64, align 8
  store i64 %add936, i64* %r296, align 4
  %load937 = load i64, i64* %r293, align 4
  %load938 = load i64, i64* %r296, align 4
  %load939 = load i64, i64* %r292, align 4
  %cast_bool940 = icmp ne i64 %load937, 0
  %ternary941 = select i1 %cast_bool940, i64 %load938, i64 %load939
  %r297 = alloca i64, align 8
  store i64 %ternary941, i64* %r297, align 4
  %load942 = load i64, i64* %r23, align 4
  %lt943 = icmp slt i64 59, %load942
  %r298 = alloca i64, align 8
  %zext944 = zext i1 %lt943 to i64
  store i64 %zext944, i64* %r298, align 4
  %load945 = load i64, i64* %r297, align 4
  %load946 = load i64, i64* %r12, align 4
  %mul947 = mul i64 %load945, %load946
  %r299 = alloca i64, align 8
  store i64 %mul947, i64* %r299, align 4
  %load948 = load i64, i64* %r299, align 4
  %div949 = sdiv i64 %load948, 10000
  %r300 = alloca i64, align 8
  store i64 %div949, i64* %r300, align 4
  %load950 = load i64, i64* %r297, align 4
  %load951 = load i64, i64* %r300, align 4
  %add952 = add i64 %load950, %load951
  %r301 = alloca i64, align 8
  store i64 %add952, i64* %r301, align 4
  %load953 = load i64, i64* %r298, align 4
  %load954 = load i64, i64* %r301, align 4
  %load955 = load i64, i64* %r297, align 4
  %cast_bool956 = icmp ne i64 %load953, 0
  %ternary957 = select i1 %cast_bool956, i64 %load954, i64 %load955
  %r302 = alloca i64, align 8
  store i64 %ternary957, i64* %r302, align 4
  %load958 = load i64, i64* %r23, align 4
  %lt959 = icmp slt i64 60, %load958
  %r303 = alloca i64, align 8
  %zext960 = zext i1 %lt959 to i64
  store i64 %zext960, i64* %r303, align 4
  %load961 = load i64, i64* %r302, align 4
  %load962 = load i64, i64* %r12, align 4
  %mul963 = mul i64 %load961, %load962
  %r304 = alloca i64, align 8
  store i64 %mul963, i64* %r304, align 4
  %load964 = load i64, i64* %r304, align 4
  %div965 = sdiv i64 %load964, 10000
  %r305 = alloca i64, align 8
  store i64 %div965, i64* %r305, align 4
  %load966 = load i64, i64* %r302, align 4
  %load967 = load i64, i64* %r305, align 4
  %add968 = add i64 %load966, %load967
  %r306 = alloca i64, align 8
  store i64 %add968, i64* %r306, align 4
  %load969 = load i64, i64* %r303, align 4
  %load970 = load i64, i64* %r306, align 4
  %load971 = load i64, i64* %r302, align 4
  %cast_bool972 = icmp ne i64 %load969, 0
  %ternary973 = select i1 %cast_bool972, i64 %load970, i64 %load971
  %r307 = alloca i64, align 8
  store i64 %ternary973, i64* %r307, align 4
  %load974 = load i64, i64* %r23, align 4
  %lt975 = icmp slt i64 61, %load974
  %r308 = alloca i64, align 8
  %zext976 = zext i1 %lt975 to i64
  store i64 %zext976, i64* %r308, align 4
  %load977 = load i64, i64* %r307, align 4
  %load978 = load i64, i64* %r12, align 4
  %mul979 = mul i64 %load977, %load978
  %r309 = alloca i64, align 8
  store i64 %mul979, i64* %r309, align 4
  %load980 = load i64, i64* %r309, align 4
  %div981 = sdiv i64 %load980, 10000
  %r310 = alloca i64, align 8
  store i64 %div981, i64* %r310, align 4
  %load982 = load i64, i64* %r307, align 4
  %load983 = load i64, i64* %r310, align 4
  %add984 = add i64 %load982, %load983
  %r311 = alloca i64, align 8
  store i64 %add984, i64* %r311, align 4
  %load985 = load i64, i64* %r308, align 4
  %load986 = load i64, i64* %r311, align 4
  %load987 = load i64, i64* %r307, align 4
  %cast_bool988 = icmp ne i64 %load985, 0
  %ternary989 = select i1 %cast_bool988, i64 %load986, i64 %load987
  %r312 = alloca i64, align 8
  store i64 %ternary989, i64* %r312, align 4
  %load990 = load i64, i64* %r23, align 4
  %lt991 = icmp slt i64 62, %load990
  %r313 = alloca i64, align 8
  %zext992 = zext i1 %lt991 to i64
  store i64 %zext992, i64* %r313, align 4
  %load993 = load i64, i64* %r312, align 4
  %load994 = load i64, i64* %r12, align 4
  %mul995 = mul i64 %load993, %load994
  %r314 = alloca i64, align 8
  store i64 %mul995, i64* %r314, align 4
  %load996 = load i64, i64* %r314, align 4
  %div997 = sdiv i64 %load996, 10000
  %r315 = alloca i64, align 8
  store i64 %div997, i64* %r315, align 4
  %load998 = load i64, i64* %r312, align 4
  %load999 = load i64, i64* %r315, align 4
  %add1000 = add i64 %load998, %load999
  %r316 = alloca i64, align 8
  store i64 %add1000, i64* %r316, align 4
  %load1001 = load i64, i64* %r313, align 4
  %load1002 = load i64, i64* %r316, align 4
  %load1003 = load i64, i64* %r312, align 4
  %cast_bool1004 = icmp ne i64 %load1001, 0
  %ternary1005 = select i1 %cast_bool1004, i64 %load1002, i64 %load1003
  %r317 = alloca i64, align 8
  store i64 %ternary1005, i64* %r317, align 4
  %load1006 = load i64, i64* %r23, align 4
  %lt1007 = icmp slt i64 63, %load1006
  %r318 = alloca i64, align 8
  %zext1008 = zext i1 %lt1007 to i64
  store i64 %zext1008, i64* %r318, align 4
  %load1009 = load i64, i64* %r317, align 4
  %load1010 = load i64, i64* %r12, align 4
  %mul1011 = mul i64 %load1009, %load1010
  %r319 = alloca i64, align 8
  store i64 %mul1011, i64* %r319, align 4
  %load1012 = load i64, i64* %r319, align 4
  %div1013 = sdiv i64 %load1012, 10000
  %r320 = alloca i64, align 8
  store i64 %div1013, i64* %r320, align 4
  %load1014 = load i64, i64* %r317, align 4
  %load1015 = load i64, i64* %r320, align 4
  %add1016 = add i64 %load1014, %load1015
  %r321 = alloca i64, align 8
  store i64 %add1016, i64* %r321, align 4
  %load1017 = load i64, i64* %r318, align 4
  %load1018 = load i64, i64* %r321, align 4
  %load1019 = load i64, i64* %r317, align 4
  %cast_bool1020 = icmp ne i64 %load1017, 0
  %ternary1021 = select i1 %cast_bool1020, i64 %load1018, i64 %load1019
  %r322 = alloca i64, align 8
  store i64 %ternary1021, i64* %r322, align 4
  %load1022 = load i64, i64* %r23, align 4
  %lt1023 = icmp slt i64 64, %load1022
  %r323 = alloca i64, align 8
  %zext1024 = zext i1 %lt1023 to i64
  store i64 %zext1024, i64* %r323, align 4
  %load1025 = load i64, i64* %r322, align 4
  %load1026 = load i64, i64* %r12, align 4
  %mul1027 = mul i64 %load1025, %load1026
  %r324 = alloca i64, align 8
  store i64 %mul1027, i64* %r324, align 4
  %load1028 = load i64, i64* %r324, align 4
  %div1029 = sdiv i64 %load1028, 10000
  %r325 = alloca i64, align 8
  store i64 %div1029, i64* %r325, align 4
  %load1030 = load i64, i64* %r322, align 4
  %load1031 = load i64, i64* %r325, align 4
  %add1032 = add i64 %load1030, %load1031
  %r326 = alloca i64, align 8
  store i64 %add1032, i64* %r326, align 4
  %load1033 = load i64, i64* %r323, align 4
  %load1034 = load i64, i64* %r326, align 4
  %load1035 = load i64, i64* %r322, align 4
  %cast_bool1036 = icmp ne i64 %load1033, 0
  %ternary1037 = select i1 %cast_bool1036, i64 %load1034, i64 %load1035
  %r327 = alloca i64, align 8
  store i64 %ternary1037, i64* %r327, align 4
  %load1038 = load i64, i64* %r23, align 4
  %lt1039 = icmp slt i64 65, %load1038
  %r328 = alloca i64, align 8
  %zext1040 = zext i1 %lt1039 to i64
  store i64 %zext1040, i64* %r328, align 4
  %load1041 = load i64, i64* %r327, align 4
  %load1042 = load i64, i64* %r12, align 4
  %mul1043 = mul i64 %load1041, %load1042
  %r329 = alloca i64, align 8
  store i64 %mul1043, i64* %r329, align 4
  %load1044 = load i64, i64* %r329, align 4
  %div1045 = sdiv i64 %load1044, 10000
  %r330 = alloca i64, align 8
  store i64 %div1045, i64* %r330, align 4
  %load1046 = load i64, i64* %r327, align 4
  %load1047 = load i64, i64* %r330, align 4
  %add1048 = add i64 %load1046, %load1047
  %r331 = alloca i64, align 8
  store i64 %add1048, i64* %r331, align 4
  %load1049 = load i64, i64* %r328, align 4
  %load1050 = load i64, i64* %r331, align 4
  %load1051 = load i64, i64* %r327, align 4
  %cast_bool1052 = icmp ne i64 %load1049, 0
  %ternary1053 = select i1 %cast_bool1052, i64 %load1050, i64 %load1051
  %r332 = alloca i64, align 8
  store i64 %ternary1053, i64* %r332, align 4
  %load1054 = load i64, i64* %r23, align 4
  %lt1055 = icmp slt i64 66, %load1054
  %r333 = alloca i64, align 8
  %zext1056 = zext i1 %lt1055 to i64
  store i64 %zext1056, i64* %r333, align 4
  %load1057 = load i64, i64* %r332, align 4
  %load1058 = load i64, i64* %r12, align 4
  %mul1059 = mul i64 %load1057, %load1058
  %r334 = alloca i64, align 8
  store i64 %mul1059, i64* %r334, align 4
  %load1060 = load i64, i64* %r334, align 4
  %div1061 = sdiv i64 %load1060, 10000
  %r335 = alloca i64, align 8
  store i64 %div1061, i64* %r335, align 4
  %load1062 = load i64, i64* %r332, align 4
  %load1063 = load i64, i64* %r335, align 4
  %add1064 = add i64 %load1062, %load1063
  %r336 = alloca i64, align 8
  store i64 %add1064, i64* %r336, align 4
  %load1065 = load i64, i64* %r333, align 4
  %load1066 = load i64, i64* %r336, align 4
  %load1067 = load i64, i64* %r332, align 4
  %cast_bool1068 = icmp ne i64 %load1065, 0
  %ternary1069 = select i1 %cast_bool1068, i64 %load1066, i64 %load1067
  %r337 = alloca i64, align 8
  store i64 %ternary1069, i64* %r337, align 4
  %load1070 = load i64, i64* %r23, align 4
  %lt1071 = icmp slt i64 67, %load1070
  %r338 = alloca i64, align 8
  %zext1072 = zext i1 %lt1071 to i64
  store i64 %zext1072, i64* %r338, align 4
  %load1073 = load i64, i64* %r337, align 4
  %load1074 = load i64, i64* %r12, align 4
  %mul1075 = mul i64 %load1073, %load1074
  %r339 = alloca i64, align 8
  store i64 %mul1075, i64* %r339, align 4
  %load1076 = load i64, i64* %r339, align 4
  %div1077 = sdiv i64 %load1076, 10000
  %r340 = alloca i64, align 8
  store i64 %div1077, i64* %r340, align 4
  %load1078 = load i64, i64* %r337, align 4
  %load1079 = load i64, i64* %r340, align 4
  %add1080 = add i64 %load1078, %load1079
  %r341 = alloca i64, align 8
  store i64 %add1080, i64* %r341, align 4
  %load1081 = load i64, i64* %r338, align 4
  %load1082 = load i64, i64* %r341, align 4
  %load1083 = load i64, i64* %r337, align 4
  %cast_bool1084 = icmp ne i64 %load1081, 0
  %ternary1085 = select i1 %cast_bool1084, i64 %load1082, i64 %load1083
  %r342 = alloca i64, align 8
  store i64 %ternary1085, i64* %r342, align 4
  %load1086 = load i64, i64* %r23, align 4
  %lt1087 = icmp slt i64 68, %load1086
  %r343 = alloca i64, align 8
  %zext1088 = zext i1 %lt1087 to i64
  store i64 %zext1088, i64* %r343, align 4
  %load1089 = load i64, i64* %r342, align 4
  %load1090 = load i64, i64* %r12, align 4
  %mul1091 = mul i64 %load1089, %load1090
  %r344 = alloca i64, align 8
  store i64 %mul1091, i64* %r344, align 4
  %load1092 = load i64, i64* %r344, align 4
  %div1093 = sdiv i64 %load1092, 10000
  %r345 = alloca i64, align 8
  store i64 %div1093, i64* %r345, align 4
  %load1094 = load i64, i64* %r342, align 4
  %load1095 = load i64, i64* %r345, align 4
  %add1096 = add i64 %load1094, %load1095
  %r346 = alloca i64, align 8
  store i64 %add1096, i64* %r346, align 4
  %load1097 = load i64, i64* %r343, align 4
  %load1098 = load i64, i64* %r346, align 4
  %load1099 = load i64, i64* %r342, align 4
  %cast_bool1100 = icmp ne i64 %load1097, 0
  %ternary1101 = select i1 %cast_bool1100, i64 %load1098, i64 %load1099
  %r347 = alloca i64, align 8
  store i64 %ternary1101, i64* %r347, align 4
  %load1102 = load i64, i64* %r23, align 4
  %lt1103 = icmp slt i64 69, %load1102
  %r348 = alloca i64, align 8
  %zext1104 = zext i1 %lt1103 to i64
  store i64 %zext1104, i64* %r348, align 4
  %load1105 = load i64, i64* %r347, align 4
  %load1106 = load i64, i64* %r12, align 4
  %mul1107 = mul i64 %load1105, %load1106
  %r349 = alloca i64, align 8
  store i64 %mul1107, i64* %r349, align 4
  %load1108 = load i64, i64* %r349, align 4
  %div1109 = sdiv i64 %load1108, 10000
  %r350 = alloca i64, align 8
  store i64 %div1109, i64* %r350, align 4
  %load1110 = load i64, i64* %r347, align 4
  %load1111 = load i64, i64* %r350, align 4
  %add1112 = add i64 %load1110, %load1111
  %r351 = alloca i64, align 8
  store i64 %add1112, i64* %r351, align 4
  %load1113 = load i64, i64* %r348, align 4
  %load1114 = load i64, i64* %r351, align 4
  %load1115 = load i64, i64* %r347, align 4
  %cast_bool1116 = icmp ne i64 %load1113, 0
  %ternary1117 = select i1 %cast_bool1116, i64 %load1114, i64 %load1115
  %r352 = alloca i64, align 8
  store i64 %ternary1117, i64* %r352, align 4
  %load1118 = load i64, i64* %r23, align 4
  %lt1119 = icmp slt i64 70, %load1118
  %r353 = alloca i64, align 8
  %zext1120 = zext i1 %lt1119 to i64
  store i64 %zext1120, i64* %r353, align 4
  %load1121 = load i64, i64* %r352, align 4
  %load1122 = load i64, i64* %r12, align 4
  %mul1123 = mul i64 %load1121, %load1122
  %r354 = alloca i64, align 8
  store i64 %mul1123, i64* %r354, align 4
  %load1124 = load i64, i64* %r354, align 4
  %div1125 = sdiv i64 %load1124, 10000
  %r355 = alloca i64, align 8
  store i64 %div1125, i64* %r355, align 4
  %load1126 = load i64, i64* %r352, align 4
  %load1127 = load i64, i64* %r355, align 4
  %add1128 = add i64 %load1126, %load1127
  %r356 = alloca i64, align 8
  store i64 %add1128, i64* %r356, align 4
  %load1129 = load i64, i64* %r353, align 4
  %load1130 = load i64, i64* %r356, align 4
  %load1131 = load i64, i64* %r352, align 4
  %cast_bool1132 = icmp ne i64 %load1129, 0
  %ternary1133 = select i1 %cast_bool1132, i64 %load1130, i64 %load1131
  %r357 = alloca i64, align 8
  store i64 %ternary1133, i64* %r357, align 4
  %load1134 = load i64, i64* %r23, align 4
  %lt1135 = icmp slt i64 71, %load1134
  %r358 = alloca i64, align 8
  %zext1136 = zext i1 %lt1135 to i64
  store i64 %zext1136, i64* %r358, align 4
  %load1137 = load i64, i64* %r357, align 4
  %load1138 = load i64, i64* %r12, align 4
  %mul1139 = mul i64 %load1137, %load1138
  %r359 = alloca i64, align 8
  store i64 %mul1139, i64* %r359, align 4
  %load1140 = load i64, i64* %r359, align 4
  %div1141 = sdiv i64 %load1140, 10000
  %r360 = alloca i64, align 8
  store i64 %div1141, i64* %r360, align 4
  %load1142 = load i64, i64* %r357, align 4
  %load1143 = load i64, i64* %r360, align 4
  %add1144 = add i64 %load1142, %load1143
  %r361 = alloca i64, align 8
  store i64 %add1144, i64* %r361, align 4
  %load1145 = load i64, i64* %r358, align 4
  %load1146 = load i64, i64* %r361, align 4
  %load1147 = load i64, i64* %r357, align 4
  %cast_bool1148 = icmp ne i64 %load1145, 0
  %ternary1149 = select i1 %cast_bool1148, i64 %load1146, i64 %load1147
  %r362 = alloca i64, align 8
  store i64 %ternary1149, i64* %r362, align 4
  %load1150 = load i64, i64* %r23, align 4
  %lt1151 = icmp slt i64 72, %load1150
  %r363 = alloca i64, align 8
  %zext1152 = zext i1 %lt1151 to i64
  store i64 %zext1152, i64* %r363, align 4
  %load1153 = load i64, i64* %r362, align 4
  %load1154 = load i64, i64* %r12, align 4
  %mul1155 = mul i64 %load1153, %load1154
  %r364 = alloca i64, align 8
  store i64 %mul1155, i64* %r364, align 4
  %load1156 = load i64, i64* %r364, align 4
  %div1157 = sdiv i64 %load1156, 10000
  %r365 = alloca i64, align 8
  store i64 %div1157, i64* %r365, align 4
  %load1158 = load i64, i64* %r362, align 4
  %load1159 = load i64, i64* %r365, align 4
  %add1160 = add i64 %load1158, %load1159
  %r366 = alloca i64, align 8
  store i64 %add1160, i64* %r366, align 4
  %load1161 = load i64, i64* %r363, align 4
  %load1162 = load i64, i64* %r366, align 4
  %load1163 = load i64, i64* %r362, align 4
  %cast_bool1164 = icmp ne i64 %load1161, 0
  %ternary1165 = select i1 %cast_bool1164, i64 %load1162, i64 %load1163
  %r367 = alloca i64, align 8
  store i64 %ternary1165, i64* %r367, align 4
  %load1166 = load i64, i64* %r23, align 4
  %lt1167 = icmp slt i64 73, %load1166
  %r368 = alloca i64, align 8
  %zext1168 = zext i1 %lt1167 to i64
  store i64 %zext1168, i64* %r368, align 4
  %load1169 = load i64, i64* %r367, align 4
  %load1170 = load i64, i64* %r12, align 4
  %mul1171 = mul i64 %load1169, %load1170
  %r369 = alloca i64, align 8
  store i64 %mul1171, i64* %r369, align 4
  %load1172 = load i64, i64* %r369, align 4
  %div1173 = sdiv i64 %load1172, 10000
  %r370 = alloca i64, align 8
  store i64 %div1173, i64* %r370, align 4
  %load1174 = load i64, i64* %r367, align 4
  %load1175 = load i64, i64* %r370, align 4
  %add1176 = add i64 %load1174, %load1175
  %r371 = alloca i64, align 8
  store i64 %add1176, i64* %r371, align 4
  %load1177 = load i64, i64* %r368, align 4
  %load1178 = load i64, i64* %r371, align 4
  %load1179 = load i64, i64* %r367, align 4
  %cast_bool1180 = icmp ne i64 %load1177, 0
  %ternary1181 = select i1 %cast_bool1180, i64 %load1178, i64 %load1179
  %r372 = alloca i64, align 8
  store i64 %ternary1181, i64* %r372, align 4
  %load1182 = load i64, i64* %r23, align 4
  %lt1183 = icmp slt i64 74, %load1182
  %r373 = alloca i64, align 8
  %zext1184 = zext i1 %lt1183 to i64
  store i64 %zext1184, i64* %r373, align 4
  %load1185 = load i64, i64* %r372, align 4
  %load1186 = load i64, i64* %r12, align 4
  %mul1187 = mul i64 %load1185, %load1186
  %r374 = alloca i64, align 8
  store i64 %mul1187, i64* %r374, align 4
  %load1188 = load i64, i64* %r374, align 4
  %div1189 = sdiv i64 %load1188, 10000
  %r375 = alloca i64, align 8
  store i64 %div1189, i64* %r375, align 4
  %load1190 = load i64, i64* %r372, align 4
  %load1191 = load i64, i64* %r375, align 4
  %add1192 = add i64 %load1190, %load1191
  %r376 = alloca i64, align 8
  store i64 %add1192, i64* %r376, align 4
  %load1193 = load i64, i64* %r373, align 4
  %load1194 = load i64, i64* %r376, align 4
  %load1195 = load i64, i64* %r372, align 4
  %cast_bool1196 = icmp ne i64 %load1193, 0
  %ternary1197 = select i1 %cast_bool1196, i64 %load1194, i64 %load1195
  %r377 = alloca i64, align 8
  store i64 %ternary1197, i64* %r377, align 4
  %load1198 = load i64, i64* %r23, align 4
  %lt1199 = icmp slt i64 75, %load1198
  %r378 = alloca i64, align 8
  %zext1200 = zext i1 %lt1199 to i64
  store i64 %zext1200, i64* %r378, align 4
  %load1201 = load i64, i64* %r377, align 4
  %load1202 = load i64, i64* %r12, align 4
  %mul1203 = mul i64 %load1201, %load1202
  %r379 = alloca i64, align 8
  store i64 %mul1203, i64* %r379, align 4
  %load1204 = load i64, i64* %r379, align 4
  %div1205 = sdiv i64 %load1204, 10000
  %r380 = alloca i64, align 8
  store i64 %div1205, i64* %r380, align 4
  %load1206 = load i64, i64* %r377, align 4
  %load1207 = load i64, i64* %r380, align 4
  %add1208 = add i64 %load1206, %load1207
  %r381 = alloca i64, align 8
  store i64 %add1208, i64* %r381, align 4
  %load1209 = load i64, i64* %r378, align 4
  %load1210 = load i64, i64* %r381, align 4
  %load1211 = load i64, i64* %r377, align 4
  %cast_bool1212 = icmp ne i64 %load1209, 0
  %ternary1213 = select i1 %cast_bool1212, i64 %load1210, i64 %load1211
  %r382 = alloca i64, align 8
  store i64 %ternary1213, i64* %r382, align 4
  %load1214 = load i64, i64* %r23, align 4
  %lt1215 = icmp slt i64 76, %load1214
  %r383 = alloca i64, align 8
  %zext1216 = zext i1 %lt1215 to i64
  store i64 %zext1216, i64* %r383, align 4
  %load1217 = load i64, i64* %r382, align 4
  %load1218 = load i64, i64* %r12, align 4
  %mul1219 = mul i64 %load1217, %load1218
  %r384 = alloca i64, align 8
  store i64 %mul1219, i64* %r384, align 4
  %load1220 = load i64, i64* %r384, align 4
  %div1221 = sdiv i64 %load1220, 10000
  %r385 = alloca i64, align 8
  store i64 %div1221, i64* %r385, align 4
  %load1222 = load i64, i64* %r382, align 4
  %load1223 = load i64, i64* %r385, align 4
  %add1224 = add i64 %load1222, %load1223
  %r386 = alloca i64, align 8
  store i64 %add1224, i64* %r386, align 4
  %load1225 = load i64, i64* %r383, align 4
  %load1226 = load i64, i64* %r386, align 4
  %load1227 = load i64, i64* %r382, align 4
  %cast_bool1228 = icmp ne i64 %load1225, 0
  %ternary1229 = select i1 %cast_bool1228, i64 %load1226, i64 %load1227
  %r387 = alloca i64, align 8
  store i64 %ternary1229, i64* %r387, align 4
  %load1230 = load i64, i64* %r23, align 4
  %lt1231 = icmp slt i64 77, %load1230
  %r388 = alloca i64, align 8
  %zext1232 = zext i1 %lt1231 to i64
  store i64 %zext1232, i64* %r388, align 4
  %load1233 = load i64, i64* %r387, align 4
  %load1234 = load i64, i64* %r12, align 4
  %mul1235 = mul i64 %load1233, %load1234
  %r389 = alloca i64, align 8
  store i64 %mul1235, i64* %r389, align 4
  %load1236 = load i64, i64* %r389, align 4
  %div1237 = sdiv i64 %load1236, 10000
  %r390 = alloca i64, align 8
  store i64 %div1237, i64* %r390, align 4
  %load1238 = load i64, i64* %r387, align 4
  %load1239 = load i64, i64* %r390, align 4
  %add1240 = add i64 %load1238, %load1239
  %r391 = alloca i64, align 8
  store i64 %add1240, i64* %r391, align 4
  %load1241 = load i64, i64* %r388, align 4
  %load1242 = load i64, i64* %r391, align 4
  %load1243 = load i64, i64* %r387, align 4
  %cast_bool1244 = icmp ne i64 %load1241, 0
  %ternary1245 = select i1 %cast_bool1244, i64 %load1242, i64 %load1243
  %r392 = alloca i64, align 8
  store i64 %ternary1245, i64* %r392, align 4
  %load1246 = load i64, i64* %r23, align 4
  %lt1247 = icmp slt i64 78, %load1246
  %r393 = alloca i64, align 8
  %zext1248 = zext i1 %lt1247 to i64
  store i64 %zext1248, i64* %r393, align 4
  %load1249 = load i64, i64* %r392, align 4
  %load1250 = load i64, i64* %r12, align 4
  %mul1251 = mul i64 %load1249, %load1250
  %r394 = alloca i64, align 8
  store i64 %mul1251, i64* %r394, align 4
  %load1252 = load i64, i64* %r394, align 4
  %div1253 = sdiv i64 %load1252, 10000
  %r395 = alloca i64, align 8
  store i64 %div1253, i64* %r395, align 4
  %load1254 = load i64, i64* %r392, align 4
  %load1255 = load i64, i64* %r395, align 4
  %add1256 = add i64 %load1254, %load1255
  %r396 = alloca i64, align 8
  store i64 %add1256, i64* %r396, align 4
  %load1257 = load i64, i64* %r393, align 4
  %load1258 = load i64, i64* %r396, align 4
  %load1259 = load i64, i64* %r392, align 4
  %cast_bool1260 = icmp ne i64 %load1257, 0
  %ternary1261 = select i1 %cast_bool1260, i64 %load1258, i64 %load1259
  %r397 = alloca i64, align 8
  store i64 %ternary1261, i64* %r397, align 4
  %load1262 = load i64, i64* %r23, align 4
  %lt1263 = icmp slt i64 79, %load1262
  %r398 = alloca i64, align 8
  %zext1264 = zext i1 %lt1263 to i64
  store i64 %zext1264, i64* %r398, align 4
  %load1265 = load i64, i64* %r397, align 4
  %load1266 = load i64, i64* %r12, align 4
  %mul1267 = mul i64 %load1265, %load1266
  %r399 = alloca i64, align 8
  store i64 %mul1267, i64* %r399, align 4
  %load1268 = load i64, i64* %r399, align 4
  %div1269 = sdiv i64 %load1268, 10000
  %r400 = alloca i64, align 8
  store i64 %div1269, i64* %r400, align 4
  %load1270 = load i64, i64* %r397, align 4
  %load1271 = load i64, i64* %r400, align 4
  %add1272 = add i64 %load1270, %load1271
  %r401 = alloca i64, align 8
  store i64 %add1272, i64* %r401, align 4
  %load1273 = load i64, i64* %r398, align 4
  %load1274 = load i64, i64* %r401, align 4
  %load1275 = load i64, i64* %r397, align 4
  %cast_bool1276 = icmp ne i64 %load1273, 0
  %ternary1277 = select i1 %cast_bool1276, i64 %load1274, i64 %load1275
  %r402 = alloca i64, align 8
  store i64 %ternary1277, i64* %r402, align 4
  %load1278 = load i64, i64* %r23, align 4
  %lt1279 = icmp slt i64 80, %load1278
  %r403 = alloca i64, align 8
  %zext1280 = zext i1 %lt1279 to i64
  store i64 %zext1280, i64* %r403, align 4
  %load1281 = load i64, i64* %r402, align 4
  %load1282 = load i64, i64* %r12, align 4
  %mul1283 = mul i64 %load1281, %load1282
  %r404 = alloca i64, align 8
  store i64 %mul1283, i64* %r404, align 4
  %load1284 = load i64, i64* %r404, align 4
  %div1285 = sdiv i64 %load1284, 10000
  %r405 = alloca i64, align 8
  store i64 %div1285, i64* %r405, align 4
  %load1286 = load i64, i64* %r402, align 4
  %load1287 = load i64, i64* %r405, align 4
  %add1288 = add i64 %load1286, %load1287
  %r406 = alloca i64, align 8
  store i64 %add1288, i64* %r406, align 4
  %load1289 = load i64, i64* %r403, align 4
  %load1290 = load i64, i64* %r406, align 4
  %load1291 = load i64, i64* %r402, align 4
  %cast_bool1292 = icmp ne i64 %load1289, 0
  %ternary1293 = select i1 %cast_bool1292, i64 %load1290, i64 %load1291
  %r407 = alloca i64, align 8
  store i64 %ternary1293, i64* %r407, align 4
  %load1294 = load i64, i64* %r23, align 4
  %lt1295 = icmp slt i64 81, %load1294
  %r408 = alloca i64, align 8
  %zext1296 = zext i1 %lt1295 to i64
  store i64 %zext1296, i64* %r408, align 4
  %load1297 = load i64, i64* %r407, align 4
  %load1298 = load i64, i64* %r12, align 4
  %mul1299 = mul i64 %load1297, %load1298
  %r409 = alloca i64, align 8
  store i64 %mul1299, i64* %r409, align 4
  %load1300 = load i64, i64* %r409, align 4
  %div1301 = sdiv i64 %load1300, 10000
  %r410 = alloca i64, align 8
  store i64 %div1301, i64* %r410, align 4
  %load1302 = load i64, i64* %r407, align 4
  %load1303 = load i64, i64* %r410, align 4
  %add1304 = add i64 %load1302, %load1303
  %r411 = alloca i64, align 8
  store i64 %add1304, i64* %r411, align 4
  %load1305 = load i64, i64* %r408, align 4
  %load1306 = load i64, i64* %r411, align 4
  %load1307 = load i64, i64* %r407, align 4
  %cast_bool1308 = icmp ne i64 %load1305, 0
  %ternary1309 = select i1 %cast_bool1308, i64 %load1306, i64 %load1307
  %r412 = alloca i64, align 8
  store i64 %ternary1309, i64* %r412, align 4
  %load1310 = load i64, i64* %r23, align 4
  %lt1311 = icmp slt i64 82, %load1310
  %r413 = alloca i64, align 8
  %zext1312 = zext i1 %lt1311 to i64
  store i64 %zext1312, i64* %r413, align 4
  %load1313 = load i64, i64* %r412, align 4
  %load1314 = load i64, i64* %r12, align 4
  %mul1315 = mul i64 %load1313, %load1314
  %r414 = alloca i64, align 8
  store i64 %mul1315, i64* %r414, align 4
  %load1316 = load i64, i64* %r414, align 4
  %div1317 = sdiv i64 %load1316, 10000
  %r415 = alloca i64, align 8
  store i64 %div1317, i64* %r415, align 4
  %load1318 = load i64, i64* %r412, align 4
  %load1319 = load i64, i64* %r415, align 4
  %add1320 = add i64 %load1318, %load1319
  %r416 = alloca i64, align 8
  store i64 %add1320, i64* %r416, align 4
  %load1321 = load i64, i64* %r413, align 4
  %load1322 = load i64, i64* %r416, align 4
  %load1323 = load i64, i64* %r412, align 4
  %cast_bool1324 = icmp ne i64 %load1321, 0
  %ternary1325 = select i1 %cast_bool1324, i64 %load1322, i64 %load1323
  %r417 = alloca i64, align 8
  store i64 %ternary1325, i64* %r417, align 4
  %load1326 = load i64, i64* %r23, align 4
  %lt1327 = icmp slt i64 83, %load1326
  %r418 = alloca i64, align 8
  %zext1328 = zext i1 %lt1327 to i64
  store i64 %zext1328, i64* %r418, align 4
  %load1329 = load i64, i64* %r417, align 4
  %load1330 = load i64, i64* %r12, align 4
  %mul1331 = mul i64 %load1329, %load1330
  %r419 = alloca i64, align 8
  store i64 %mul1331, i64* %r419, align 4
  %load1332 = load i64, i64* %r419, align 4
  %div1333 = sdiv i64 %load1332, 10000
  %r420 = alloca i64, align 8
  store i64 %div1333, i64* %r420, align 4
  %load1334 = load i64, i64* %r417, align 4
  %load1335 = load i64, i64* %r420, align 4
  %add1336 = add i64 %load1334, %load1335
  %r421 = alloca i64, align 8
  store i64 %add1336, i64* %r421, align 4
  %load1337 = load i64, i64* %r418, align 4
  %load1338 = load i64, i64* %r421, align 4
  %load1339 = load i64, i64* %r417, align 4
  %cast_bool1340 = icmp ne i64 %load1337, 0
  %ternary1341 = select i1 %cast_bool1340, i64 %load1338, i64 %load1339
  %r422 = alloca i64, align 8
  store i64 %ternary1341, i64* %r422, align 4
  %load1342 = load i64, i64* %r23, align 4
  %lt1343 = icmp slt i64 84, %load1342
  %r423 = alloca i64, align 8
  %zext1344 = zext i1 %lt1343 to i64
  store i64 %zext1344, i64* %r423, align 4
  %load1345 = load i64, i64* %r422, align 4
  %load1346 = load i64, i64* %r12, align 4
  %mul1347 = mul i64 %load1345, %load1346
  %r424 = alloca i64, align 8
  store i64 %mul1347, i64* %r424, align 4
  %load1348 = load i64, i64* %r424, align 4
  %div1349 = sdiv i64 %load1348, 10000
  %r425 = alloca i64, align 8
  store i64 %div1349, i64* %r425, align 4
  %load1350 = load i64, i64* %r422, align 4
  %load1351 = load i64, i64* %r425, align 4
  %add1352 = add i64 %load1350, %load1351
  %r426 = alloca i64, align 8
  store i64 %add1352, i64* %r426, align 4
  %load1353 = load i64, i64* %r423, align 4
  %load1354 = load i64, i64* %r426, align 4
  %load1355 = load i64, i64* %r422, align 4
  %cast_bool1356 = icmp ne i64 %load1353, 0
  %ternary1357 = select i1 %cast_bool1356, i64 %load1354, i64 %load1355
  %r427 = alloca i64, align 8
  store i64 %ternary1357, i64* %r427, align 4
  %load1358 = load i64, i64* %r23, align 4
  %lt1359 = icmp slt i64 85, %load1358
  %r428 = alloca i64, align 8
  %zext1360 = zext i1 %lt1359 to i64
  store i64 %zext1360, i64* %r428, align 4
  %load1361 = load i64, i64* %r427, align 4
  %load1362 = load i64, i64* %r12, align 4
  %mul1363 = mul i64 %load1361, %load1362
  %r429 = alloca i64, align 8
  store i64 %mul1363, i64* %r429, align 4
  %load1364 = load i64, i64* %r429, align 4
  %div1365 = sdiv i64 %load1364, 10000
  %r430 = alloca i64, align 8
  store i64 %div1365, i64* %r430, align 4
  %load1366 = load i64, i64* %r427, align 4
  %load1367 = load i64, i64* %r430, align 4
  %add1368 = add i64 %load1366, %load1367
  %r431 = alloca i64, align 8
  store i64 %add1368, i64* %r431, align 4
  %load1369 = load i64, i64* %r428, align 4
  %load1370 = load i64, i64* %r431, align 4
  %load1371 = load i64, i64* %r427, align 4
  %cast_bool1372 = icmp ne i64 %load1369, 0
  %ternary1373 = select i1 %cast_bool1372, i64 %load1370, i64 %load1371
  %r432 = alloca i64, align 8
  store i64 %ternary1373, i64* %r432, align 4
  %load1374 = load i64, i64* %r23, align 4
  %lt1375 = icmp slt i64 86, %load1374
  %r433 = alloca i64, align 8
  %zext1376 = zext i1 %lt1375 to i64
  store i64 %zext1376, i64* %r433, align 4
  %load1377 = load i64, i64* %r432, align 4
  %load1378 = load i64, i64* %r12, align 4
  %mul1379 = mul i64 %load1377, %load1378
  %r434 = alloca i64, align 8
  store i64 %mul1379, i64* %r434, align 4
  %load1380 = load i64, i64* %r434, align 4
  %div1381 = sdiv i64 %load1380, 10000
  %r435 = alloca i64, align 8
  store i64 %div1381, i64* %r435, align 4
  %load1382 = load i64, i64* %r432, align 4
  %load1383 = load i64, i64* %r435, align 4
  %add1384 = add i64 %load1382, %load1383
  %r436 = alloca i64, align 8
  store i64 %add1384, i64* %r436, align 4
  %load1385 = load i64, i64* %r433, align 4
  %load1386 = load i64, i64* %r436, align 4
  %load1387 = load i64, i64* %r432, align 4
  %cast_bool1388 = icmp ne i64 %load1385, 0
  %ternary1389 = select i1 %cast_bool1388, i64 %load1386, i64 %load1387
  %r437 = alloca i64, align 8
  store i64 %ternary1389, i64* %r437, align 4
  %load1390 = load i64, i64* %r23, align 4
  %lt1391 = icmp slt i64 87, %load1390
  %r438 = alloca i64, align 8
  %zext1392 = zext i1 %lt1391 to i64
  store i64 %zext1392, i64* %r438, align 4
  %load1393 = load i64, i64* %r437, align 4
  %load1394 = load i64, i64* %r12, align 4
  %mul1395 = mul i64 %load1393, %load1394
  %r439 = alloca i64, align 8
  store i64 %mul1395, i64* %r439, align 4
  %load1396 = load i64, i64* %r439, align 4
  %div1397 = sdiv i64 %load1396, 10000
  %r440 = alloca i64, align 8
  store i64 %div1397, i64* %r440, align 4
  %load1398 = load i64, i64* %r437, align 4
  %load1399 = load i64, i64* %r440, align 4
  %add1400 = add i64 %load1398, %load1399
  %r441 = alloca i64, align 8
  store i64 %add1400, i64* %r441, align 4
  %load1401 = load i64, i64* %r438, align 4
  %load1402 = load i64, i64* %r441, align 4
  %load1403 = load i64, i64* %r437, align 4
  %cast_bool1404 = icmp ne i64 %load1401, 0
  %ternary1405 = select i1 %cast_bool1404, i64 %load1402, i64 %load1403
  %r442 = alloca i64, align 8
  store i64 %ternary1405, i64* %r442, align 4
  %load1406 = load i64, i64* %r23, align 4
  %lt1407 = icmp slt i64 88, %load1406
  %r443 = alloca i64, align 8
  %zext1408 = zext i1 %lt1407 to i64
  store i64 %zext1408, i64* %r443, align 4
  %load1409 = load i64, i64* %r442, align 4
  %load1410 = load i64, i64* %r12, align 4
  %mul1411 = mul i64 %load1409, %load1410
  %r444 = alloca i64, align 8
  store i64 %mul1411, i64* %r444, align 4
  %load1412 = load i64, i64* %r444, align 4
  %div1413 = sdiv i64 %load1412, 10000
  %r445 = alloca i64, align 8
  store i64 %div1413, i64* %r445, align 4
  %load1414 = load i64, i64* %r442, align 4
  %load1415 = load i64, i64* %r445, align 4
  %add1416 = add i64 %load1414, %load1415
  %r446 = alloca i64, align 8
  store i64 %add1416, i64* %r446, align 4
  %load1417 = load i64, i64* %r443, align 4
  %load1418 = load i64, i64* %r446, align 4
  %load1419 = load i64, i64* %r442, align 4
  %cast_bool1420 = icmp ne i64 %load1417, 0
  %ternary1421 = select i1 %cast_bool1420, i64 %load1418, i64 %load1419
  %r447 = alloca i64, align 8
  store i64 %ternary1421, i64* %r447, align 4
  %load1422 = load i64, i64* %r23, align 4
  %lt1423 = icmp slt i64 89, %load1422
  %r448 = alloca i64, align 8
  %zext1424 = zext i1 %lt1423 to i64
  store i64 %zext1424, i64* %r448, align 4
  %load1425 = load i64, i64* %r447, align 4
  %load1426 = load i64, i64* %r12, align 4
  %mul1427 = mul i64 %load1425, %load1426
  %r449 = alloca i64, align 8
  store i64 %mul1427, i64* %r449, align 4
  %load1428 = load i64, i64* %r449, align 4
  %div1429 = sdiv i64 %load1428, 10000
  %r450 = alloca i64, align 8
  store i64 %div1429, i64* %r450, align 4
  %load1430 = load i64, i64* %r447, align 4
  %load1431 = load i64, i64* %r450, align 4
  %add1432 = add i64 %load1430, %load1431
  %r451 = alloca i64, align 8
  store i64 %add1432, i64* %r451, align 4
  %load1433 = load i64, i64* %r448, align 4
  %load1434 = load i64, i64* %r451, align 4
  %load1435 = load i64, i64* %r447, align 4
  %cast_bool1436 = icmp ne i64 %load1433, 0
  %ternary1437 = select i1 %cast_bool1436, i64 %load1434, i64 %load1435
  %r452 = alloca i64, align 8
  store i64 %ternary1437, i64* %r452, align 4
  %load1438 = load i64, i64* %r23, align 4
  %lt1439 = icmp slt i64 90, %load1438
  %r453 = alloca i64, align 8
  %zext1440 = zext i1 %lt1439 to i64
  store i64 %zext1440, i64* %r453, align 4
  %load1441 = load i64, i64* %r452, align 4
  %load1442 = load i64, i64* %r12, align 4
  %mul1443 = mul i64 %load1441, %load1442
  %r454 = alloca i64, align 8
  store i64 %mul1443, i64* %r454, align 4
  %load1444 = load i64, i64* %r454, align 4
  %div1445 = sdiv i64 %load1444, 10000
  %r455 = alloca i64, align 8
  store i64 %div1445, i64* %r455, align 4
  %load1446 = load i64, i64* %r452, align 4
  %load1447 = load i64, i64* %r455, align 4
  %add1448 = add i64 %load1446, %load1447
  %r456 = alloca i64, align 8
  store i64 %add1448, i64* %r456, align 4
  %load1449 = load i64, i64* %r453, align 4
  %load1450 = load i64, i64* %r456, align 4
  %load1451 = load i64, i64* %r452, align 4
  %cast_bool1452 = icmp ne i64 %load1449, 0
  %ternary1453 = select i1 %cast_bool1452, i64 %load1450, i64 %load1451
  %r457 = alloca i64, align 8
  store i64 %ternary1453, i64* %r457, align 4
  %load1454 = load i64, i64* %r23, align 4
  %lt1455 = icmp slt i64 91, %load1454
  %r458 = alloca i64, align 8
  %zext1456 = zext i1 %lt1455 to i64
  store i64 %zext1456, i64* %r458, align 4
  %load1457 = load i64, i64* %r457, align 4
  %load1458 = load i64, i64* %r12, align 4
  %mul1459 = mul i64 %load1457, %load1458
  %r459 = alloca i64, align 8
  store i64 %mul1459, i64* %r459, align 4
  %load1460 = load i64, i64* %r459, align 4
  %div1461 = sdiv i64 %load1460, 10000
  %r460 = alloca i64, align 8
  store i64 %div1461, i64* %r460, align 4
  %load1462 = load i64, i64* %r457, align 4
  %load1463 = load i64, i64* %r460, align 4
  %add1464 = add i64 %load1462, %load1463
  %r461 = alloca i64, align 8
  store i64 %add1464, i64* %r461, align 4
  %load1465 = load i64, i64* %r458, align 4
  %load1466 = load i64, i64* %r461, align 4
  %load1467 = load i64, i64* %r457, align 4
  %cast_bool1468 = icmp ne i64 %load1465, 0
  %ternary1469 = select i1 %cast_bool1468, i64 %load1466, i64 %load1467
  %r462 = alloca i64, align 8
  store i64 %ternary1469, i64* %r462, align 4
  %load1470 = load i64, i64* %r23, align 4
  %lt1471 = icmp slt i64 92, %load1470
  %r463 = alloca i64, align 8
  %zext1472 = zext i1 %lt1471 to i64
  store i64 %zext1472, i64* %r463, align 4
  %load1473 = load i64, i64* %r462, align 4
  %load1474 = load i64, i64* %r12, align 4
  %mul1475 = mul i64 %load1473, %load1474
  %r464 = alloca i64, align 8
  store i64 %mul1475, i64* %r464, align 4
  %load1476 = load i64, i64* %r464, align 4
  %div1477 = sdiv i64 %load1476, 10000
  %r465 = alloca i64, align 8
  store i64 %div1477, i64* %r465, align 4
  %load1478 = load i64, i64* %r462, align 4
  %load1479 = load i64, i64* %r465, align 4
  %add1480 = add i64 %load1478, %load1479
  %r466 = alloca i64, align 8
  store i64 %add1480, i64* %r466, align 4
  %load1481 = load i64, i64* %r463, align 4
  %load1482 = load i64, i64* %r466, align 4
  %load1483 = load i64, i64* %r462, align 4
  %cast_bool1484 = icmp ne i64 %load1481, 0
  %ternary1485 = select i1 %cast_bool1484, i64 %load1482, i64 %load1483
  %r467 = alloca i64, align 8
  store i64 %ternary1485, i64* %r467, align 4
  %load1486 = load i64, i64* %r23, align 4
  %lt1487 = icmp slt i64 93, %load1486
  %r468 = alloca i64, align 8
  %zext1488 = zext i1 %lt1487 to i64
  store i64 %zext1488, i64* %r468, align 4
  %load1489 = load i64, i64* %r467, align 4
  %load1490 = load i64, i64* %r12, align 4
  %mul1491 = mul i64 %load1489, %load1490
  %r469 = alloca i64, align 8
  store i64 %mul1491, i64* %r469, align 4
  %load1492 = load i64, i64* %r469, align 4
  %div1493 = sdiv i64 %load1492, 10000
  %r470 = alloca i64, align 8
  store i64 %div1493, i64* %r470, align 4
  %load1494 = load i64, i64* %r467, align 4
  %load1495 = load i64, i64* %r470, align 4
  %add1496 = add i64 %load1494, %load1495
  %r471 = alloca i64, align 8
  store i64 %add1496, i64* %r471, align 4
  %load1497 = load i64, i64* %r468, align 4
  %load1498 = load i64, i64* %r471, align 4
  %load1499 = load i64, i64* %r467, align 4
  %cast_bool1500 = icmp ne i64 %load1497, 0
  %ternary1501 = select i1 %cast_bool1500, i64 %load1498, i64 %load1499
  %r472 = alloca i64, align 8
  store i64 %ternary1501, i64* %r472, align 4
  %load1502 = load i64, i64* %r23, align 4
  %lt1503 = icmp slt i64 94, %load1502
  %r473 = alloca i64, align 8
  %zext1504 = zext i1 %lt1503 to i64
  store i64 %zext1504, i64* %r473, align 4
  %load1505 = load i64, i64* %r472, align 4
  %load1506 = load i64, i64* %r12, align 4
  %mul1507 = mul i64 %load1505, %load1506
  %r474 = alloca i64, align 8
  store i64 %mul1507, i64* %r474, align 4
  %load1508 = load i64, i64* %r474, align 4
  %div1509 = sdiv i64 %load1508, 10000
  %r475 = alloca i64, align 8
  store i64 %div1509, i64* %r475, align 4
  %load1510 = load i64, i64* %r472, align 4
  %load1511 = load i64, i64* %r475, align 4
  %add1512 = add i64 %load1510, %load1511
  %r476 = alloca i64, align 8
  store i64 %add1512, i64* %r476, align 4
  %load1513 = load i64, i64* %r473, align 4
  %load1514 = load i64, i64* %r476, align 4
  %load1515 = load i64, i64* %r472, align 4
  %cast_bool1516 = icmp ne i64 %load1513, 0
  %ternary1517 = select i1 %cast_bool1516, i64 %load1514, i64 %load1515
  %r477 = alloca i64, align 8
  store i64 %ternary1517, i64* %r477, align 4
  %load1518 = load i64, i64* %r23, align 4
  %lt1519 = icmp slt i64 95, %load1518
  %r478 = alloca i64, align 8
  %zext1520 = zext i1 %lt1519 to i64
  store i64 %zext1520, i64* %r478, align 4
  %load1521 = load i64, i64* %r477, align 4
  %load1522 = load i64, i64* %r12, align 4
  %mul1523 = mul i64 %load1521, %load1522
  %r479 = alloca i64, align 8
  store i64 %mul1523, i64* %r479, align 4
  %load1524 = load i64, i64* %r479, align 4
  %div1525 = sdiv i64 %load1524, 10000
  %r480 = alloca i64, align 8
  store i64 %div1525, i64* %r480, align 4
  %load1526 = load i64, i64* %r477, align 4
  %load1527 = load i64, i64* %r480, align 4
  %add1528 = add i64 %load1526, %load1527
  %r481 = alloca i64, align 8
  store i64 %add1528, i64* %r481, align 4
  %load1529 = load i64, i64* %r478, align 4
  %load1530 = load i64, i64* %r481, align 4
  %load1531 = load i64, i64* %r477, align 4
  %cast_bool1532 = icmp ne i64 %load1529, 0
  %ternary1533 = select i1 %cast_bool1532, i64 %load1530, i64 %load1531
  %r482 = alloca i64, align 8
  store i64 %ternary1533, i64* %r482, align 4
  %load1534 = load i64, i64* %r23, align 4
  %lt1535 = icmp slt i64 96, %load1534
  %r483 = alloca i64, align 8
  %zext1536 = zext i1 %lt1535 to i64
  store i64 %zext1536, i64* %r483, align 4
  %load1537 = load i64, i64* %r482, align 4
  %load1538 = load i64, i64* %r12, align 4
  %mul1539 = mul i64 %load1537, %load1538
  %r484 = alloca i64, align 8
  store i64 %mul1539, i64* %r484, align 4
  %load1540 = load i64, i64* %r484, align 4
  %div1541 = sdiv i64 %load1540, 10000
  %r485 = alloca i64, align 8
  store i64 %div1541, i64* %r485, align 4
  %load1542 = load i64, i64* %r482, align 4
  %load1543 = load i64, i64* %r485, align 4
  %add1544 = add i64 %load1542, %load1543
  %r486 = alloca i64, align 8
  store i64 %add1544, i64* %r486, align 4
  %load1545 = load i64, i64* %r483, align 4
  %load1546 = load i64, i64* %r486, align 4
  %load1547 = load i64, i64* %r482, align 4
  %cast_bool1548 = icmp ne i64 %load1545, 0
  %ternary1549 = select i1 %cast_bool1548, i64 %load1546, i64 %load1547
  %r487 = alloca i64, align 8
  store i64 %ternary1549, i64* %r487, align 4
  %load1550 = load i64, i64* %r23, align 4
  %lt1551 = icmp slt i64 97, %load1550
  %r488 = alloca i64, align 8
  %zext1552 = zext i1 %lt1551 to i64
  store i64 %zext1552, i64* %r488, align 4
  %load1553 = load i64, i64* %r487, align 4
  %load1554 = load i64, i64* %r12, align 4
  %mul1555 = mul i64 %load1553, %load1554
  %r489 = alloca i64, align 8
  store i64 %mul1555, i64* %r489, align 4
  %load1556 = load i64, i64* %r489, align 4
  %div1557 = sdiv i64 %load1556, 10000
  %r490 = alloca i64, align 8
  store i64 %div1557, i64* %r490, align 4
  %load1558 = load i64, i64* %r487, align 4
  %load1559 = load i64, i64* %r490, align 4
  %add1560 = add i64 %load1558, %load1559
  %r491 = alloca i64, align 8
  store i64 %add1560, i64* %r491, align 4
  %load1561 = load i64, i64* %r488, align 4
  %load1562 = load i64, i64* %r491, align 4
  %load1563 = load i64, i64* %r487, align 4
  %cast_bool1564 = icmp ne i64 %load1561, 0
  %ternary1565 = select i1 %cast_bool1564, i64 %load1562, i64 %load1563
  %r492 = alloca i64, align 8
  store i64 %ternary1565, i64* %r492, align 4
  %load1566 = load i64, i64* %r23, align 4
  %lt1567 = icmp slt i64 98, %load1566
  %r493 = alloca i64, align 8
  %zext1568 = zext i1 %lt1567 to i64
  store i64 %zext1568, i64* %r493, align 4
  %load1569 = load i64, i64* %r492, align 4
  %load1570 = load i64, i64* %r12, align 4
  %mul1571 = mul i64 %load1569, %load1570
  %r494 = alloca i64, align 8
  store i64 %mul1571, i64* %r494, align 4
  %load1572 = load i64, i64* %r494, align 4
  %div1573 = sdiv i64 %load1572, 10000
  %r495 = alloca i64, align 8
  store i64 %div1573, i64* %r495, align 4
  %load1574 = load i64, i64* %r492, align 4
  %load1575 = load i64, i64* %r495, align 4
  %add1576 = add i64 %load1574, %load1575
  %r496 = alloca i64, align 8
  store i64 %add1576, i64* %r496, align 4
  %load1577 = load i64, i64* %r493, align 4
  %load1578 = load i64, i64* %r496, align 4
  %load1579 = load i64, i64* %r492, align 4
  %cast_bool1580 = icmp ne i64 %load1577, 0
  %ternary1581 = select i1 %cast_bool1580, i64 %load1578, i64 %load1579
  %r497 = alloca i64, align 8
  store i64 %ternary1581, i64* %r497, align 4
  %load1582 = load i64, i64* %r23, align 4
  %lt1583 = icmp slt i64 99, %load1582
  %r498 = alloca i64, align 8
  %zext1584 = zext i1 %lt1583 to i64
  store i64 %zext1584, i64* %r498, align 4
  %load1585 = load i64, i64* %r497, align 4
  %load1586 = load i64, i64* %r12, align 4
  %mul1587 = mul i64 %load1585, %load1586
  %r499 = alloca i64, align 8
  store i64 %mul1587, i64* %r499, align 4
  %load1588 = load i64, i64* %r499, align 4
  %div1589 = sdiv i64 %load1588, 10000
  %r500 = alloca i64, align 8
  store i64 %div1589, i64* %r500, align 4
  %load1590 = load i64, i64* %r497, align 4
  %load1591 = load i64, i64* %r500, align 4
  %add1592 = add i64 %load1590, %load1591
  %r501 = alloca i64, align 8
  store i64 %add1592, i64* %r501, align 4
  %load1593 = load i64, i64* %r498, align 4
  %load1594 = load i64, i64* %r501, align 4
  %load1595 = load i64, i64* %r497, align 4
  %cast_bool1596 = icmp ne i64 %load1593, 0
  %ternary1597 = select i1 %cast_bool1596, i64 %load1594, i64 %load1595
  %r502 = alloca i64, align 8
  store i64 %ternary1597, i64* %r502, align 4
  br label %exit

exit:                                             ; preds = %body
  %load1598 = load i64, i64* %r502, align 4
  ret i64 %load1598
}

define %Token @issue(i128 %self.caller, i128 %r0, i64 %r1) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i128, align 8
  store i128 %r0, i128* %r02, align 4
  %r13 = alloca i64, align 8
  store i64 %r1, i64* %r13, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %self.caller1, align 4
  call void @aleo.assert.eq.i128.i128(i128 %load, i128 0)
  %load4 = load i128, i128* %r02, align 4
  %load5 = load i64, i64* %r13, align 4
  %struct = alloca %Token, align 8
  %struct_gep = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 0
  store i128 %load4, i128* %struct_gep, align 4
  %struct_gep6 = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 1
  store i64 0, i64* %struct_gep6, align 4
  %struct_gep7 = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 2
  store i64 %load5, i64* %struct_gep7, align 4
  %r2 = alloca %Token, align 8
  %struct8 = load %Token, %Token* %struct, align 4
  store %Token %struct8, %Token* %r2, align 4
  br label %exit

exit:                                             ; preds = %body
  %load9 = load %Token, %Token* %r2, align 4
  ret %Token %load9
}

declare void @aleo.assert.eq.i128.i128(i128, i128)

define void @deposit.finalize(i128 %r0, i64 %r1) {
entry:
  %r01 = alloca i128, align 8
  store i128 %r0, i128* %r01, align 4
  %r12 = alloca i64, align 8
  store i64 %r1, i64* %r12, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %r01, align 4
  %r2 = alloca i64, align 8
  %array_gep = getelementptr [512 x i64], [512 x i64]* @balances, i32 0, i128 %load
  %load3 = load i64, i64* %array_gep, align 4
  %is_null = icmp eq i64 %load3, 0
  br i1 %is_null, label %then, label %else

then:                                             ; preds = %body
  store i64 0, i64* %array_gep, align 4
  store i64 0, i64* %r2, align 4
  br label %merge

else:                                             ; preds = %body
  store i64 %load3, i64* %r2, align 4
  br label %merge

merge:                                            ; preds = %else, %then
  %load4 = load i64, i64* %r2, align 4
  %load5 = load i64, i64* %r12, align 4
  %add = add i64 %load4, %load5
  %r3 = alloca i64, align 8
  store i64 %add, i64* %r3, align 4
  %load6 = load i128, i128* %r01, align 4
  %load7 = load i64, i64* %r3, align 4
  %array_gep8 = getelementptr [512 x i64], [512 x i64]* @balances, i32 0, i128 %load6
  store i64 %load7, i64* %array_gep8, align 4
  ret void
}

define %Token @deposit(i128 %self.caller, %Token %r0, i64 %r1) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca %Token, align 8
  store %Token %r0, %Token* %r02, align 4
  %r13 = alloca i64, align 8
  store i64 %r1, i64* %r13, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load %Token, %Token* %r02, align 4
  %gep = getelementptr inbounds %Token, %Token* %r02, i32 0, i32 2
  %load4 = load i64, i64* %gep, align 4
  %load5 = load i64, i64* %r13, align 4
  %sub = sub i64 %load4, %load5
  %r2 = alloca i64, align 8
  store i64 %sub, i64* %r2, align 4
  %load6 = load %Token, %Token* %r02, align 4
  %gep7 = getelementptr inbounds %Token, %Token* %r02, i32 0, i32 0
  %load8 = load i128, i128* %gep7, align 4
  %load9 = load %Token, %Token* %r02, align 4
  %gep10 = getelementptr inbounds %Token, %Token* %r02, i32 0, i32 1
  %load11 = load i64, i64* %gep10, align 4
  %load12 = load i64, i64* %r2, align 4
  %struct = alloca %Token, align 8
  %struct_gep = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 0
  store i128 %load8, i128* %struct_gep, align 4
  %struct_gep13 = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 1
  store i64 %load11, i64* %struct_gep13, align 4
  %struct_gep14 = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 2
  store i64 %load12, i64* %struct_gep14, align 4
  %r3 = alloca %Token, align 8
  %struct15 = load %Token, %Token* %struct, align 4
  store %Token %struct15, %Token* %r3, align 4
  %load16 = load %Token, %Token* %r02, align 4
  %gep17 = getelementptr inbounds %Token, %Token* %r02, i32 0, i32 0
  %load18 = load i128, i128* %gep17, align 4
  %hash.bhp256 = call i128 @aleo.hash.bhp256.i128(i128 %load18)
  %r4 = alloca i128, align 8
  store i128 %hash.bhp256, i128* %r4, align 4
  br label %exit

exit:                                             ; preds = %body
  %load19 = load i128, i128* %r4, align 4
  %load20 = load i64, i64* %r13, align 4
  call void @deposit.finalize(i128 %load19, i64 %load20)
  %load21 = load %Token, %Token* %r3, align 4
  ret %Token %load21
}

declare i128 @aleo.hash.bhp256.i128(i128)

define void @withdraw.finalize(i128 %r0, i64 %r1) {
entry:
  %r01 = alloca i128, align 8
  store i128 %r0, i128* %r01, align 4
  %r12 = alloca i64, align 8
  store i64 %r1, i64* %r12, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %r01, align 4
  %r2 = alloca i64, align 8
  %array_gep = getelementptr [512 x i64], [512 x i64]* @balances, i32 0, i128 %load
  %load3 = load i64, i64* %array_gep, align 4
  %is_null = icmp eq i64 %load3, 0
  br i1 %is_null, label %then, label %else

then:                                             ; preds = %body
  store i64 0, i64* %array_gep, align 4
  store i64 0, i64* %r2, align 4
  br label %merge

else:                                             ; preds = %body
  store i64 %load3, i64* %r2, align 4
  br label %merge

merge:                                            ; preds = %else, %then
  %load4 = load i64, i64* %r2, align 4
  %load5 = load i64, i64* %r12, align 4
  %sub = sub i64 %load4, %load5
  %r3 = alloca i64, align 8
  store i64 %sub, i64* %r3, align 4
  %load6 = load i128, i128* %r01, align 4
  %load7 = load i64, i64* %r3, align 4
  %array_gep8 = getelementptr [512 x i64], [512 x i64]* @balances, i32 0, i128 %load6
  store i64 %load7, i64* %array_gep8, align 4
  ret void
}

define %Token @withdraw(i128 %self.caller, i128 %r0, i64 %r1, i64 %r2, i64 %r3) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i128, align 8
  store i128 %r0, i128* %r02, align 4
  %r13 = alloca i64, align 8
  store i64 %r1, i64* %r13, align 4
  %r24 = alloca i64, align 8
  store i64 %r2, i64* %r24, align 4
  %r35 = alloca i64, align 8
  store i64 %r3, i64* %r35, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %self.caller1, align 4
  call void @aleo.assert.eq.i128.i128(i128 %load, i128 0)
  %load6 = load i128, i128* %r02, align 4
  %hash.bhp256 = call i128 @aleo.hash.bhp256.i128(i128 %load6)
  %r4 = alloca i128, align 8
  store i128 %hash.bhp256, i128* %r4, align 4
  %load7 = load i64, i64* %r13, align 4
  %load8 = load i64, i64* %r24, align 4
  %load9 = load i64, i64* %r35, align 4
  %r5 = call i64 @calculate_interest(i64 %load7, i64 %load8, i64 %load9)
  %r510 = alloca i64, align 8
  store i64 %r5, i64* %r510, align 4
  %load11 = load i128, i128* %r02, align 4
  %load12 = load i64, i64* %r510, align 4
  %struct = alloca %Token, align 8
  %struct_gep = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 0
  store i128 %load11, i128* %struct_gep, align 4
  %struct_gep13 = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 1
  store i64 0, i64* %struct_gep13, align 4
  %struct_gep14 = getelementptr inbounds %Token, %Token* %struct, i32 0, i32 2
  store i64 %load12, i64* %struct_gep14, align 4
  %r6 = alloca %Token, align 8
  %struct15 = load %Token, %Token* %struct, align 4
  store %Token %struct15, %Token* %r6, align 4
  br label %exit

exit:                                             ; preds = %body
  %load16 = load i128, i128* %r4, align 4
  %load17 = load i64, i64* %r13, align 4
  call void @withdraw.finalize(i128 %load16, i64 %load17)
  %load18 = load %Token, %Token* %r6, align 4
  ret %Token %load18
}

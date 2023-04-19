# Copyright (c) 2022 Lowell D. Thomas, all rights reserved
# BSD-2-Clause (https://opensource.org/licenses/BSD-2-Clause)
#

# SUMMARY
#      rules = 107
#       udts = 0
#    opcodes = 797
#        ---   ABNF original opcodes
#        ALT = 55
#        CAT = 85
#        REP = 48
#        RNM = 336
#        TLS = 85
#        TBS = 163
#        TRG = 25
#        ---   SABNF super set opcodes
#        UDT = 0
#        AND = 0
#        NOT = 0
#        BKA = 0
#        BKN = 0
#        BKR = 0
#        ABG = 0
#        AEN = 0
# characters = [0 - 1114111]
#

# RULES
rules = ({'name': 'ht',
  'lower': 'ht',
  'index': 0,
  'line': 58,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (9,)},)},
 {'name': 'lf',
  'lower': 'lf',
  'index': 1,
  'line': 60,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (10,)},)},
 {'name': 'cr',
  'lower': 'cr',
  'index': 2,
  'line': 62,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (13,)},)},
 {'name': 'sp',
  'lower': 'sp',
  'index': 3,
  'line': 64,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (32,)},)},
 {'name': 'dq',
  'lower': 'dq',
  'index': 4,
  'line': 66,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (34,)},)},
 {'name': 'visible-ascii',
  'lower': 'visible-ascii',
  'index': 5,
  'line': 70,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 5, 'min': 33, 'max': 126},)},
 {'name': 'other-ascii',
  'lower': 'other-ascii',
  'index': 6,
  'line': 72,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 5, 'min': 0, 'max': 8},
              {'type': 5, 'min': 11, 'max': 12},
              {'type': 5, 'min': 14, 'max': 31},
              {'type': 6, 'string': (127,)})},
 {'name': 'ascii',
  'lower': 'ascii',
  'index': 7,
  'line': 74,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4, 5, 6)},
              {'type': 4, 'index': 5},
              {'type': 4, 'index': 0},
              {'type': 4, 'index': 3},
              {'type': 4, 'index': 1},
              {'type': 4, 'index': 2},
              {'type': 4, 'index': 6})},
 {'name': 'safe-nonascii',
  'lower': 'safe-nonascii',
  'index': 8,
  'line': 76,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 5, 'min': 128, 'max': 8233},
              {'type': 5, 'min': 8239, 'max': 8293},
              {'type': 5, 'min': 8298, 'max': 55295},
              {'type': 5, 'min': 57344, 'max': 1114111})},
 {'name': 'bidi',
  'lower': 'bidi',
  'index': 9,
  'line': 80,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 5, 'min': 8234, 'max': 8238},
              {'type': 5, 'min': 8294, 'max': 8297})},
 {'name': 'surrogate',
  'lower': 'surrogate',
  'index': 10,
  'line': 82,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 5, 'min': 55296, 'max': 57343},)},
 {'name': 'nonascii',
  'lower': 'nonascii',
  'index': 11,
  'line': 84,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3)},
              {'type': 4, 'index': 8},
              {'type': 4, 'index': 9},
              {'type': 4, 'index': 10})},
 {'name': 'character',
  'lower': 'character',
  'index': 12,
  'line': 86,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 4, 'index': 7},
              {'type': 4, 'index': 11})},
 {'name': 'escaped-lf',
  'lower': 'escaped-lf',
  'index': 13,
  'line': 90,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 7, 'string': (92,)},
              {'type': 4, 'index': 1})},
 {'name': 'plain-ws',
  'lower': 'plain-ws',
  'index': 14,
  'line': 92,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 4, 'index': 0},
              {'type': 4, 'index': 3},
              {'type': 4, 'index': 1},
              {'type': 4, 'index': 2})},
 {'name': 'ws',
  'lower': 'ws',
  'index': 15,
  'line': 94,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 1, 'children': (2, 4)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 14},
              {'type': 4, 'index': 13})},
 {'name': 'comment',
  'lower': 'comment',
  'index': 16,
  'line': 100,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 4, 'index': 17},
              {'type': 4, 'index': 19})},
 {'name': 'line-comment',
  'lower': 'line-comment',
  'index': 17,
  'line': 102,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 7, 'string': (47, 47)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 1, 'children': (4, 5)},
              {'type': 4, 'index': 13},
              {'type': 4, 'index': 18})},
 {'name': 'not-lf-or-cr',
  'lower': 'not-lf-or-cr',
  'index': 18,
  'line': 104,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3)},
              {'type': 5, 'min': 0, 'max': 9},
              {'type': 5, 'min': 11, 'max': 12},
              {'type': 5, 'min': 14, 'max': 1114111})},
 {'name': 'block-comment',
  'lower': 'block-comment',
  'index': 19,
  'line': 106,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 7, 'string': (47, 42)},
              {'type': 4, 'index': 20})},
 {'name': 'rest-of-block-comment',
  'lower': 'rest-of-block-comment',
  'index': 20,
  'line': 108,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 4)},
              {'type': 2, 'children': (2, 3)},
              {'type': 7, 'string': (42,)},
              {'type': 4, 'index': 22},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 21},
              {'type': 4, 'index': 20})},
 {'name': 'not-star',
  'lower': 'not-star',
  'index': 21,
  'line': 111,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 5, 'min': 0, 'max': 41},
              {'type': 5, 'min': 43, 'max': 1114111})},
 {'name': 'rest-of-block-comment-after-star',
  'lower': 'rest-of-block-comment-after-star',
  'index': 22,
  'line': 113,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 5)},
              {'type': 7, 'string': (47,)},
              {'type': 2, 'children': (3, 4)},
              {'type': 7, 'string': (42,)},
              {'type': 4, 'index': 22},
              {'type': 2, 'children': (6, 7)},
              {'type': 4, 'index': 23},
              {'type': 4, 'index': 20})},
 {'name': 'not-star-or-slash',
  'lower': 'not-star-or-slash',
  'index': 23,
  'line': 117,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3)},
              {'type': 5, 'min': 0, 'max': 41},
              {'type': 5, 'min': 43, 'max': 46},
              {'type': 5, 'min': 48, 'max': 1114111})},
 {'name': 'cws',
  'lower': 'cws',
  'index': 24,
  'line': 121,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 4, 'index': 15},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 1, 'children': (4, 5)},
              {'type': 4, 'index': 16},
              {'type': 4, 'index': 15})},
 {'name': 'uppercase-letter',
  'lower': 'uppercase-letter',
  'index': 25,
  'line': 125,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 5, 'min': 65, 'max': 90},)},
 {'name': 'lowercase-letter',
  'lower': 'lowercase-letter',
  'index': 26,
  'line': 127,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 5, 'min': 97, 'max': 122},)},
 {'name': 'letter',
  'lower': 'letter',
  'index': 27,
  'line': 129,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 4, 'index': 25},
              {'type': 4, 'index': 26})},
 {'name': 'digit',
  'lower': 'digit',
  'index': 28,
  'line': 133,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 5, 'min': 48, 'max': 57},)},
 {'name': 'hex-digit',
  'lower': 'hex-digit',
  'index': 29,
  'line': 135,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4, 5, 6, 7)},
              {'type': 4, 'index': 28},
              {'type': 7, 'string': (97,)},
              {'type': 7, 'string': (98,)},
              {'type': 7, 'string': (99,)},
              {'type': 7, 'string': (100,)},
              {'type': 7, 'string': (101,)},
              {'type': 7, 'string': (102,)})},
 {'name': 'identifier',
  'lower': 'identifier',
  'index': 30,
  'line': 139,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 27},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 1, 'children': (5, 6, 7)},
              {'type': 4, 'index': 27},
              {'type': 4, 'index': 28},
              {'type': 7, 'string': (95,)})},
 {'name': 'program-id',
  'lower': 'program-id',
  'index': 31,
  'line': 141,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3)},
              {'type': 4, 'index': 30},
              {'type': 7, 'string': (46,)},
              {'type': 4, 'index': 30})},
 {'name': 'locator',
  'lower': 'locator',
  'index': 32,
  'line': 143,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3)},
              {'type': 4, 'index': 31},
              {'type': 7, 'string': (47,)},
              {'type': 4, 'index': 30})},
 {'name': 'register',
  'lower': 'register',
  'index': 33,
  'line': 147,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 6, 'string': (114,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 28})},
 {'name': 'register-access',
  'lower': 'register-access',
  'index': 34,
  'line': 149,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 4, 'index': 33},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 2, 'children': (4, 5)},
              {'type': 7, 'string': (46,)},
              {'type': 4, 'index': 30})},
 {'name': 'signed-literal',
  'lower': 'signed-literal',
  'index': 35,
  'line': 153,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3, 8)},
              {'type': 3, 'min': 0, 'max': 1},
              {'type': 7, 'string': (45,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 28},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 7, 'string': (95,)},
              {'type': 4, 'index': 53})},
 {'name': 'unsigned-literal',
  'lower': 'unsigned-literal',
  'index': 36,
  'line': 155,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3, 8)},
              {'type': 3, 'min': 0, 'max': 1},
              {'type': 7, 'string': (45,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 28},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 7, 'string': (95,)},
              {'type': 4, 'index': 52})},
 {'name': 'integer-literal',
  'lower': 'integer-literal',
  'index': 37,
  'line': 157,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 4, 'index': 35},
              {'type': 4, 'index': 36})},
 {'name': 'field-literal',
  'lower': 'field-literal',
  'index': 38,
  'line': 159,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3, 8)},
              {'type': 3, 'min': 0, 'max': 1},
              {'type': 7, 'string': (45,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 28},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 7, 'string': (95,)},
              {'type': 4, 'index': 55})},
 {'name': 'group-literal',
  'lower': 'group-literal',
  'index': 39,
  'line': 161,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3, 8)},
              {'type': 3, 'min': 0, 'max': 1},
              {'type': 7, 'string': (45,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 28},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 7, 'string': (95,)},
              {'type': 4, 'index': 56})},
 {'name': 'scalar-literal',
  'lower': 'scalar-literal',
  'index': 40,
  'line': 163,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3, 8)},
              {'type': 3, 'min': 0, 'max': 1},
              {'type': 7, 'string': (45,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 28},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 7, 'string': (95,)},
              {'type': 4, 'index': 57})},
 {'name': 'arithmetic-literal',
  'lower': 'arithmetic-literal',
  'index': 41,
  'line': 165,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 4, 'index': 37},
              {'type': 4, 'index': 38},
              {'type': 4, 'index': 39},
              {'type': 4, 'index': 40})},
 {'name': 'address-literal',
  'lower': 'address-literal',
  'index': 42,
  'line': 172,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 6, 'string': (97, 108, 101, 111, 49)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (4, 5)},
              {'type': 4, 'index': 43},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 7, 'string': (95,)})},
 {'name': 'address-char',
  'lower': 'address-char',
  'index': 43,
  'line': 174,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1,
               'children': (1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            10,
                            11,
                            12,
                            13,
                            14,
                            15,
                            16,
                            17,
                            18,
                            19,
                            20,
                            21,
                            22,
                            23,
                            24,
                            25,
                            26,
                            27,
                            28,
                            29,
                            30,
                            31,
                            32)},
              {'type': 7, 'string': (48,)},
              {'type': 7, 'string': (50,)},
              {'type': 7, 'string': (51,)},
              {'type': 7, 'string': (52,)},
              {'type': 7, 'string': (53,)},
              {'type': 7, 'string': (54,)},
              {'type': 7, 'string': (55,)},
              {'type': 7, 'string': (56,)},
              {'type': 7, 'string': (57,)},
              {'type': 6, 'string': (97,)},
              {'type': 6, 'string': (99,)},
              {'type': 6, 'string': (100,)},
              {'type': 6, 'string': (101,)},
              {'type': 6, 'string': (102,)},
              {'type': 6, 'string': (103,)},
              {'type': 6, 'string': (104,)},
              {'type': 6, 'string': (106,)},
              {'type': 6, 'string': (107,)},
              {'type': 6, 'string': (108,)},
              {'type': 6, 'string': (109,)},
              {'type': 6, 'string': (110,)},
              {'type': 6, 'string': (112,)},
              {'type': 6, 'string': (113,)},
              {'type': 6, 'string': (114,)},
              {'type': 6, 'string': (115,)},
              {'type': 6, 'string': (116,)},
              {'type': 6, 'string': (117,)},
              {'type': 6, 'string': (118,)},
              {'type': 6, 'string': (119,)},
              {'type': 6, 'string': (120,)},
              {'type': 6, 'string': (121,)},
              {'type': 6, 'string': (122,)})},
 {'name': 'boolean-literal',
  'lower': 'boolean-literal',
  'index': 44,
  'line': 181,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 6, 'string': (116, 114, 117, 101)},
              {'type': 6, 'string': (102, 97, 108, 115, 101)})},
 {'name': 'string-literal',
  'lower': 'string-literal',
  'index': 45,
  'line': 185,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 4)},
              {'type': 4, 'index': 4},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 46},
              {'type': 4, 'index': 4})},
 {'name': 'string-element',
  'lower': 'string-element',
  'index': 46,
  'line': 187,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3)},
              {'type': 4, 'index': 47},
              {'type': 4, 'index': 48},
              {'type': 4, 'index': 49})},
 {'name': 'not-dq-or-backslash',
  'lower': 'not-dq-or-backslash',
  'index': 47,
  'line': 191,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3)},
              {'type': 5, 'min': 0, 'max': 33},
              {'type': 5, 'min': 35, 'max': 91},
              {'type': 5, 'min': 93, 'max': 1114111})},
 {'name': 'escaped-char',
  'lower': 'escaped-char',
  'index': 48,
  'line': 193,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 7, 'string': (92,)},
              {'type': 1, 'children': (3, 4, 5, 6, 7, 8, 9, 10, 11)},
              {'type': 4, 'index': 4},
              {'type': 7, 'string': (92,)},
              {'type': 7, 'string': (47,)},
              {'type': 6, 'string': (110,)},
              {'type': 6, 'string': (114,)},
              {'type': 6, 'string': (116,)},
              {'type': 6, 'string': (98,)},
              {'type': 6, 'string': (102,)},
              {'type': 2, 'children': (12, 13, 14, 16)},
              {'type': 6, 'string': (117,)},
              {'type': 7, 'string': (123,)},
              {'type': 3, 'min': 1, 'max': 6},
              {'type': 4, 'index': 29},
              {'type': 7, 'string': (125,)})},
 {'name': 'escaped-ws',
  'lower': 'escaped-ws',
  'index': 49,
  'line': 203,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 7, 'string': (92,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 14})},
 {'name': 'literal',
  'lower': 'literal',
  'index': 50,
  'line': 207,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 4, 'index': 41},
              {'type': 4, 'index': 42},
              {'type': 4, 'index': 44},
              {'type': 4, 'index': 45})},
 {'name': 'operand',
  'lower': 'operand',
  'index': 51,
  'line': 214,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 4, 'index': 50},
              {'type': 4, 'index': 34},
              {'type': 6,
               'string': (115, 101, 108, 102, 46, 99, 97, 108, 108, 101, 114)},
              {'type': 4, 'index': 31})},
 {'name': 'unsigned-type',
  'lower': 'unsigned-type',
  'index': 52,
  'line': 218,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4, 5)},
              {'type': 6, 'string': (117, 56)},
              {'type': 6, 'string': (117, 49, 54)},
              {'type': 6, 'string': (117, 51, 50)},
              {'type': 6, 'string': (117, 54, 52)},
              {'type': 6, 'string': (117, 49, 50, 56)})},
 {'name': 'signed-type',
  'lower': 'signed-type',
  'index': 53,
  'line': 220,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4, 5)},
              {'type': 6, 'string': (105, 56)},
              {'type': 6, 'string': (105, 49, 54)},
              {'type': 6, 'string': (105, 51, 50)},
              {'type': 6, 'string': (105, 54, 52)},
              {'type': 6, 'string': (105, 49, 50, 56)})},
 {'name': 'integer-type',
  'lower': 'integer-type',
  'index': 54,
  'line': 222,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 4, 'index': 52},
              {'type': 4, 'index': 53})},
 {'name': 'field-type',
  'lower': 'field-type',
  'index': 55,
  'line': 224,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (102, 105, 101, 108, 100)},)},
 {'name': 'group-type',
  'lower': 'group-type',
  'index': 56,
  'line': 226,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (103, 114, 111, 117, 112)},)},
 {'name': 'scalar-type',
  'lower': 'scalar-type',
  'index': 57,
  'line': 228,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (115, 99, 97, 108, 97, 114)},)},
 {'name': 'arithmetic-type',
  'lower': 'arithmetic-type',
  'index': 58,
  'line': 230,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 4, 'index': 54},
              {'type': 4, 'index': 55},
              {'type': 4, 'index': 56},
              {'type': 4, 'index': 57})},
 {'name': 'address-type',
  'lower': 'address-type',
  'index': 59,
  'line': 232,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (97, 100, 100, 114, 101, 115, 115)},)},
 {'name': 'boolean-type',
  'lower': 'boolean-type',
  'index': 60,
  'line': 234,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (98, 111, 111, 108, 101, 97, 110)},)},
 {'name': 'string-type',
  'lower': 'string-type',
  'index': 61,
  'line': 236,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (115, 116, 114, 105, 110, 103)},)},
 {'name': 'literal-type',
  'lower': 'literal-type',
  'index': 62,
  'line': 238,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4)},
              {'type': 4, 'index': 58},
              {'type': 4, 'index': 59},
              {'type': 4, 'index': 60},
              {'type': 4, 'index': 61})},
 {'name': 'plaintext-type',
  'lower': 'plaintext-type',
  'index': 63,
  'line': 240,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 4, 'index': 62},
              {'type': 4, 'index': 30})},
 {'name': 'value-type',
  'lower': 'value-type',
  'index': 64,
  'line': 242,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 4, 7, 10, 13)},
              {'type': 2, 'children': (2, 3)},
              {'type': 4, 'index': 63},
              {'type': 6, 'string': (46, 99, 111, 110, 115, 116, 97, 110, 116)},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 63},
              {'type': 6, 'string': (46, 112, 117, 98, 108, 105, 99)},
              {'type': 2, 'children': (8, 9)},
              {'type': 4, 'index': 63},
              {'type': 6, 'string': (46, 112, 114, 105, 118, 97, 116, 101)},
              {'type': 2, 'children': (11, 12)},
              {'type': 4, 'index': 30},
              {'type': 6, 'string': (46, 114, 101, 99, 111, 114, 100)},
              {'type': 2, 'children': (14, 15)},
              {'type': 4, 'index': 32},
              {'type': 6, 'string': (46, 114, 101, 99, 111, 114, 100)})},
 {'name': 'finalize-type',
  'lower': 'finalize-type',
  'index': 65,
  'line': 248,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 4, 7)},
              {'type': 2, 'children': (2, 3)},
              {'type': 4, 'index': 63},
              {'type': 6, 'string': (46, 112, 117, 98, 108, 105, 99)},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 30},
              {'type': 6, 'string': (46, 114, 101, 99, 111, 114, 100)},
              {'type': 2, 'children': (8, 9)},
              {'type': 4, 'index': 32},
              {'type': 6, 'string': (46, 114, 101, 99, 111, 114, 100)})},
 {'name': 'entry-type',
  'lower': 'entry-type',
  'index': 66,
  'line': 252,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2)},
              {'type': 4, 'index': 63},
              {'type': 1, 'children': (3, 4, 5)},
              {'type': 6, 'string': (46, 99, 111, 110, 115, 116, 97, 110, 116)},
              {'type': 6, 'string': (46, 112, 117, 98, 108, 105, 99)},
              {'type': 6, 'string': (46, 112, 114, 105, 118, 97, 116, 101)})},
 {'name': 'register-type',
  'lower': 'register-type',
  'index': 67,
  'line': 254,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 4, 7)},
              {'type': 2, 'children': (2, 3)},
              {'type': 4, 'index': 32},
              {'type': 6, 'string': (46, 114, 101, 99, 111, 114, 100)},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 30},
              {'type': 6, 'string': (46, 114, 101, 99, 111, 114, 100)},
              {'type': 4, 'index': 63})},
 {'name': 'import',
  'lower': 'import',
  'index': 68,
  'line': 260,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (105, 109, 112, 111, 114, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 31},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'mapping',
  'lower': 'mapping',
  'index': 69,
  'line': 264,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (109, 97, 112, 112, 105, 110, 103)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (58,)},
              {'type': 4, 'index': 70},
              {'type': 4, 'index': 71})},
 {'name': 'mapping-key',
  'lower': 'mapping-key',
  'index': 70,
  'line': 268,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (107, 101, 121)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 65},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'mapping-value',
  'lower': 'mapping-value',
  'index': 71,
  'line': 270,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (118, 97, 108, 117, 101)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 65},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'struct',
  'lower': 'struct',
  'index': 72,
  'line': 274,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (115, 116, 114, 117, 99, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (58,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 73})},
 {'name': 'tuple',
  'lower': 'tuple',
  'index': 73,
  'line': 276,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8)},
              {'type': 4, 'index': 24},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 63},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'record',
  'lower': 'record',
  'index': 74,
  'line': 280,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2,
               'children': (1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            10,
                            11,
                            12,
                            13,
                            16,
                            17,
                            18,
                            19,
                            20,
                            21,
                            22,
                            23,
                            24,
                            27,
                            28,
                            29)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (114, 101, 99, 111, 114, 100)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (58,)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (111, 119, 110, 101, 114)},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 24},
              {'type': 1, 'children': (14, 15)},
              {'type': 6,
               'string': (97,
                          100,
                          100,
                          114,
                          101,
                          115,
                          115,
                          46,
                          112,
                          117,
                          98,
                          108,
                          105,
                          99)},
              {'type': 6,
               'string': (97,
                          100,
                          100,
                          114,
                          101,
                          115,
                          115,
                          46,
                          112,
                          114,
                          105,
                          118,
                          97,
                          116,
                          101)},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (103, 97, 116, 101, 115)},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 24},
              {'type': 1, 'children': (25, 26)},
              {'type': 6,
               'string': (117, 54, 52, 46, 112, 117, 98, 108, 105, 99)},
              {'type': 6,
               'string': (117, 54, 52, 46, 112, 114, 105, 118, 97, 116, 101)},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 75})},
 {'name': 'entry',
  'lower': 'entry',
  'index': 75,
  'line': 287,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8)},
              {'type': 4, 'index': 24},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 66},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'unary-op',
  'lower': 'unary-op',
  'index': 76,
  'line': 291,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3, 4, 5, 6, 7, 8)},
              {'type': 6, 'string': (97, 98, 115)},
              {'type': 6, 'string': (97, 98, 115, 46, 119)},
              {'type': 6, 'string': (100, 111, 117, 98, 108, 101)},
              {'type': 6, 'string': (105, 110, 118)},
              {'type': 6, 'string': (110, 101, 103)},
              {'type': 6, 'string': (110, 111, 116)},
              {'type': 6, 'string': (115, 113, 117, 97, 114, 101)},
              {'type': 6, 'string': (115, 113, 114, 116)})},
 {'name': 'binary-op',
  'lower': 'binary-op',
  'index': 77,
  'line': 299,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1,
               'children': (1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            10,
                            11,
                            12,
                            13,
                            14,
                            15,
                            16,
                            17,
                            18,
                            19,
                            20,
                            21,
                            22,
                            23,
                            24,
                            25,
                            26)},
              {'type': 6, 'string': (97, 100, 100)},
              {'type': 6, 'string': (97, 100, 100, 46, 119)},
              {'type': 6, 'string': (115, 117, 98)},
              {'type': 6, 'string': (115, 117, 98, 46, 119)},
              {'type': 6, 'string': (109, 117, 108)},
              {'type': 6, 'string': (109, 117, 108, 46, 119)},
              {'type': 6, 'string': (100, 105, 118)},
              {'type': 6, 'string': (100, 105, 118, 46, 119)},
              {'type': 6, 'string': (114, 101, 109)},
              {'type': 6, 'string': (114, 101, 109, 46, 119)},
              {'type': 6, 'string': (109, 111, 100)},
              {'type': 6, 'string': (112, 111, 119)},
              {'type': 6, 'string': (112, 111, 119, 46, 119)},
              {'type': 6, 'string': (115, 104, 108)},
              {'type': 6, 'string': (115, 104, 108, 46, 119)},
              {'type': 6, 'string': (115, 104, 114)},
              {'type': 6, 'string': (115, 104, 114, 46, 119)},
              {'type': 6, 'string': (97, 110, 100)},
              {'type': 6, 'string': (111, 114)},
              {'type': 6, 'string': (120, 111, 114)},
              {'type': 6, 'string': (110, 97, 110, 100)},
              {'type': 6, 'string': (110, 111, 114)},
              {'type': 6, 'string': (103, 116)},
              {'type': 6, 'string': (103, 116, 101)},
              {'type': 6, 'string': (108, 116)},
              {'type': 6, 'string': (108, 116, 101)})},
 {'name': 'ternary-op',
  'lower': 'ternary-op',
  'index': 78,
  'line': 318,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 6, 'string': (116, 101, 114, 110, 97, 114, 121)},)},
 {'name': 'is-op',
  'lower': 'is-op',
  'index': 79,
  'line': 320,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 6, 'string': (105, 115, 46, 101, 113)},
              {'type': 6, 'string': (105, 115, 46, 110, 101, 113)})},
 {'name': 'assert-op',
  'lower': 'assert-op',
  'index': 80,
  'line': 322,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2)},
              {'type': 6,
               'string': (97, 115, 115, 101, 114, 116, 46, 101, 113)},
              {'type': 6,
               'string': (97, 115, 115, 101, 114, 116, 46, 110, 101, 113)})},
 {'name': 'commit-op',
  'lower': 'commit-op',
  'index': 81,
  'line': 324,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 8)},
              {'type': 2, 'children': (2, 3)},
              {'type': 6,
               'string': (99, 111, 109, 109, 105, 116, 46, 98, 104, 112)},
              {'type': 1, 'children': (4, 5, 6, 7)},
              {'type': 7, 'string': (50, 53, 54)},
              {'type': 7, 'string': (53, 49, 50)},
              {'type': 7, 'string': (55, 54, 56)},
              {'type': 7, 'string': (49, 48, 50, 52)},
              {'type': 2, 'children': (9, 10)},
              {'type': 6,
               'string': (99, 111, 109, 109, 105, 116, 46, 112, 101, 100)},
              {'type': 1, 'children': (11, 12)},
              {'type': 7, 'string': (54, 52)},
              {'type': 7, 'string': (49, 50, 56)})},
 {'name': 'hash-op',
  'lower': 'hash-op',
  'index': 82,
  'line': 327,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 8, 13)},
              {'type': 2, 'children': (2, 3)},
              {'type': 6, 'string': (104, 97, 115, 104, 46, 98, 104, 112)},
              {'type': 1, 'children': (4, 5, 6, 7)},
              {'type': 7, 'string': (50, 53, 54)},
              {'type': 7, 'string': (53, 49, 50)},
              {'type': 7, 'string': (55, 54, 56)},
              {'type': 7, 'string': (49, 48, 50, 52)},
              {'type': 2, 'children': (9, 10)},
              {'type': 6, 'string': (104, 97, 115, 104, 46, 112, 101, 100)},
              {'type': 1, 'children': (11, 12)},
              {'type': 7, 'string': (54, 52)},
              {'type': 7, 'string': (49, 50, 56)},
              {'type': 2, 'children': (14, 15)},
              {'type': 6, 'string': (104, 97, 115, 104, 46, 112, 115, 100)},
              {'type': 1, 'children': (16, 17, 18)},
              {'type': 7, 'string': (50,)},
              {'type': 7, 'string': (52,)},
              {'type': 7, 'string': (56,)})},
 {'name': 'unary',
  'lower': 'unary',
  'index': 83,
  'line': 331,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 6, 7, 8)},
              {'type': 4, 'index': 76},
              {'type': 4, 'index': 15},
              {'type': 2, 'children': (4, 5)},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'binary',
  'lower': 'binary',
  'index': 84,
  'line': 333,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 7, 8, 9)},
              {'type': 4, 'index': 77},
              {'type': 4, 'index': 15},
              {'type': 3, 'min': 2, 'max': 2},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'ternary',
  'lower': 'ternary',
  'index': 85,
  'line': 335,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 7, 8, 9)},
              {'type': 4, 'index': 78},
              {'type': 4, 'index': 15},
              {'type': 3, 'min': 3, 'max': 3},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'is',
  'lower': 'is',
  'index': 86,
  'line': 337,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9)},
              {'type': 4, 'index': 79},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'assert',
  'lower': 'assert',
  'index': 87,
  'line': 339,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5)},
              {'type': 4, 'index': 80},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51})},
 {'name': 'commit',
  'lower': 'commit',
  'index': 88,
  'line': 341,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9)},
              {'type': 4, 'index': 81},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'hash',
  'lower': 'hash',
  'index': 89,
  'line': 343,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7)},
              {'type': 4, 'index': 82},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'cast',
  'lower': 'cast',
  'index': 90,
  'line': 345,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 6, 7, 8, 9, 10, 11, 12, 13)},
              {'type': 6, 'string': (99, 97, 115, 116)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (4, 5)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 67})},
 {'name': 'call',
  'lower': 'call',
  'index': 91,
  'line': 348,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 6, 7, 11, 12, 13, 14)},
              {'type': 6, 'string': (99, 97, 108, 108)},
              {'type': 4, 'index': 15},
              {'type': 1, 'children': (4, 5)},
              {'type': 4, 'index': 32},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (9, 10)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (105, 110, 116, 111)},
              {'type': 4, 'index': 15},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 2, 'children': (16, 17)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33})},
 {'name': 'instruction',
  'lower': 'instruction',
  'index': 92,
  'line': 351,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 12, 13)},
              {'type': 4, 'index': 24},
              {'type': 1, 'children': (3, 4, 5, 6, 7, 8, 9, 10, 11)},
              {'type': 4, 'index': 83},
              {'type': 4, 'index': 84},
              {'type': 4, 'index': 85},
              {'type': 4, 'index': 86},
              {'type': 4, 'index': 87},
              {'type': 4, 'index': 88},
              {'type': 4, 'index': 89},
              {'type': 4, 'index': 90},
              {'type': 4, 'index': 91},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'decrement',
  'lower': 'decrement',
  'index': 93,
  'line': 363,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2,
               'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)},
              {'type': 4, 'index': 24},
              {'type': 6,
               'string': (100, 101, 99, 114, 101, 109, 101, 110, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 7, 'string': (91,)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (93,)},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (98, 121)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'increment',
  'lower': 'increment',
  'index': 94,
  'line': 367,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2,
               'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)},
              {'type': 4, 'index': 24},
              {'type': 6,
               'string': (105, 110, 99, 114, 101, 109, 101, 110, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 7, 'string': (91,)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (93,)},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (98, 121)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'command',
  'lower': 'command',
  'index': 95,
  'line': 371,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 1, 'children': (1, 2, 3)},
              {'type': 4, 'index': 93},
              {'type': 4, 'index': 94},
              {'type': 4, 'index': 92})},
 {'name': 'finalize-command',
  'lower': 'finalize-command',
  'index': 96,
  'line': 373,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 7, 8)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (102, 105, 110, 97, 108, 105, 122, 101)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 2, 'children': (5, 6)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 51},
              {'type': 4, 'index': 24},
              {'type': 7, 'string': (59,)})},
 {'name': 'function',
  'lower': 'function',
  'index': 97,
  'line': 377,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 9, 11)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (102, 117, 110, 99, 116, 105, 111, 110)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (58,)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 98},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 92},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 99})},
 {'name': 'function-input',
  'lower': 'function-input',
  'index': 98,
  'line': 382,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (105, 110, 112, 117, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 67},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'function-output',
  'lower': 'function-output',
  'index': 99,
  'line': 385,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (111, 117, 116, 112, 117, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 34},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 67},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'transition',
  'lower': 'transition',
  'index': 100,
  'line': 390,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 9, 11, 13, 14)},
              {'type': 4, 'index': 24},
              {'type': 6,
               'string': (116, 114, 97, 110, 115, 105, 116, 105, 111, 110)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (58,)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 101},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 92},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 102},
              {'type': 4, 'index': 24},
              {'type': 3, 'min': 0, 'max': 1},
              {'type': 2, 'children': (16, 17)},
              {'type': 4, 'index': 96},
              {'type': 4, 'index': 103})},
 {'name': 'transition-input',
  'lower': 'transition-input',
  'index': 101,
  'line': 396,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (105, 110, 112, 117, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 64},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'transition-output',
  'lower': 'transition-output',
  'index': 102,
  'line': 399,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (111, 117, 116, 112, 117, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 34},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 64},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'finalize',
  'lower': 'finalize',
  'index': 103,
  'line': 402,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 9, 11)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (102, 105, 110, 97, 108, 105, 122, 101)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 30},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (58,)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 104},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 4, 'index': 95},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 105})},
 {'name': 'finalize-input',
  'lower': 'finalize-input',
  'index': 104,
  'line': 407,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (105, 110, 112, 117, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 33},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 65},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'finalize-output',
  'lower': 'finalize-output',
  'index': 105,
  'line': 410,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (111, 117, 116, 112, 117, 116)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 34},
              {'type': 4, 'index': 15},
              {'type': 6, 'string': (97, 115)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 65},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)})},
 {'name': 'program',
  'lower': 'program',
  'index': 106,
  'line': 415,
  'is_bkru': False,
  'is_bkrr': False,
  'has_bkrr': False,
  'opcodes': ({'type': 2, 'children': (1, 3, 4, 5, 6, 7, 8, 9, 16)},
              {'type': 3, 'min': 0, 'max': 9223372036854775807},
              {'type': 4, 'index': 68},
              {'type': 4, 'index': 24},
              {'type': 6, 'string': (112, 114, 111, 103, 114, 97, 109)},
              {'type': 4, 'index': 15},
              {'type': 4, 'index': 31},
              {'type': 4, 'index': 15},
              {'type': 7, 'string': (59,)},
              {'type': 3, 'min': 1, 'max': 9223372036854775807},
              {'type': 1, 'children': (11, 12, 13, 14, 15)},
              {'type': 4, 'index': 69},
              {'type': 4, 'index': 72},
              {'type': 4, 'index': 74},
              {'type': 4, 'index': 97},
              {'type': 4, 'index': 100},
              {'type': 4, 'index': 24})})

# UDTS
udts = ()

has_bkru = False
has_bkrr = False


def to_string():
    '''Displays the original SABNF syntax.'''
    sabnf = ""
    sabnf += "; Copyright (C) 2022 Aleo Systems Inc.\n"
    sabnf += "; This file is part of the Aleo library.\n"
    sabnf += "\n"
    sabnf += "; The Leo library is free software: you can redistribute it and/or modify\n"
    sabnf += "; it under the terms of the GNU General Public License as published by\n"
    sabnf += "; the Free Software Foundation, either version 3 of the License, or\n"
    sabnf += "; (at your option) any later version.\n"
    sabnf += "\n"
    sabnf += "; The Leo library is distributed in the hope that it will be useful,\n"
    sabnf += "; but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
    sabnf += "; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\n"
    sabnf += "; GNU General Public License for more details.\n"
    sabnf += "\n"
    sabnf += "; You should have received a copy of the GNU General Public License\n"
    sabnf += "; along with the Leo library. If not, see <https://www.gnu.org/licenses/>.\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "; This grammar is derived from the current implementation of\n"
    sabnf += "; the nom parser of Aleo instructions in snarkVM.\n"
    sabnf += "\n"
    sabnf += "; The grammar should recognize exactly the same language as the parser.\n"
    sabnf += "; The formulation of the rules for some constructs may not correspond\n"
    sabnf += "; to the parser implementation exactly;\n"
    sabnf += "; this is to highlight more structure to facilitate future changes,\n"
    sabnf += "; or because of inherent differences between\n"
    sabnf += "; the declarative nature of the grammar\n"
    sabnf += "; and the operational nature of the parser.\n"
    sabnf += "\n"
    sabnf += "; This grammar currently consists of one level,\n"
    sabnf += "; as opposed to two levels (lexical and syntactic).\n"
    sabnf += "; While two levels are typical for higher-level languages like Leo,\n"
    sabnf += "; one level is workable for lower-level languages like Aleo instructions.\n"
    sabnf += "; By not throwing away whitespace and comment\n"
    sabnf += "; when moving between the two levels,\n"
    sabnf += "; we can (as the current rules do) enforce requirements\n"
    sabnf += "; on where comments and whitespace may occur.\n"
    sabnf += "; The parser also is written according to a single level.\n"
    sabnf += "; All of this may be revisited in the future, if needed.\n"
    sabnf += "\n"
    sabnf += "; The grammar should be unambiguous\n"
    sabnf += "; if we take into account the extra-grammatical requirement\n"
    sabnf += "; that the longest match is used,\n"
    sabnf += "; which is a common extra-grammatical requirement,\n"
    sabnf += "; at least in lexical grammars of two-level grammars,\n"
    sabnf += "; but should also work for this one-level grammar.\n"
    sabnf += "; We plan to formally prove this eventually.\n"
    sabnf += "\n"
    sabnf += "; The rules below are separated into sections delimited by 40 semicolons.\n"
    sabnf += "; The sections do not have a very deep significance,\n"
    sabnf += "; but are meant to group related rules.\n"
    sabnf += "; For instance, the first section gives names to characters\n"
    sabnf += "; that could not be otherwise denoted in ABNF strings;\n"
    sabnf += "; the second section categorizes the allowed characters;\n"
    sabnf += "; and so on.\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "ht = %x9 ; horizontal tab\n"
    sabnf += "\n"
    sabnf += "lf = %xA ; line feed\n"
    sabnf += "\n"
    sabnf += "cr = %xD ; carriage return\n"
    sabnf += "\n"
    sabnf += "sp = %x20 ; space\n"
    sabnf += "\n"
    sabnf += "dq = %x22 ; \"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "visible-ascii = %x21-7E\n"
    sabnf += "\n"
    sabnf += "other-ascii = %x0-8 / %xB-C / %xE-1F / %x7F ; we should disallow these\n"
    sabnf += "\n"
    sabnf += "ascii = visible-ascii / ht / sp / lf / cr / other-ascii\n"
    sabnf += "\n"
    sabnf += "safe-nonascii = %x80-2029 / %x202F-2065 / %x206A-D7FF / %xE000-10FFFF\n"
    sabnf += "                ; excludes bidi embeddings/overrides/isolates\n"
    sabnf += "                ; and excludes high/low surrogates\n"
    sabnf += "\n"
    sabnf += "bidi = %x202A-202E / %x2066-2069 ; we should disallow these\n"
    sabnf += "\n"
    sabnf += "surrogate = %xD800-DFFF ; these are disallowed via UTF-8 decoding\n"
    sabnf += "\n"
    sabnf += "nonascii = safe-nonascii / bidi / surrogate\n"
    sabnf += "\n"
    sabnf += "character = ascii / nonascii\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "escaped-lf = \"\\\" lf ; escaped line feed -- we should disallow this\n"
    sabnf += "\n"
    sabnf += "plain-ws = ht / sp / lf / cr ; plain (i.e. without escaped-lf) whitespace\n"
    sabnf += "\n"
    sabnf += "ws = *( 1*plain-ws / escaped-lf ) ; whitespace\n"
    sabnf += "\n"
    sabnf += "; we should add and use an explicit notion of line terminator\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "comment = line-comment / block-comment\n"
    sabnf += "\n"
    sabnf += "line-comment = \"//\" *( escaped-lf / not-lf-or-cr )\n"
    sabnf += "\n"
    sabnf += "not-lf-or-cr = %x0-9 / %xB-C / %xE-10FFFF ; anything but lf or cr\n"
    sabnf += "\n"
    sabnf += "block-comment = \"/*\" rest-of-block-comment\n"
    sabnf += "\n"
    sabnf += "rest-of-block-comment = \"*\" rest-of-block-comment-after-star\n"
    sabnf += "                      / not-star rest-of-block-comment\n"
    sabnf += "\n"
    sabnf += "not-star = %x0-29 / %x2B-10FFFF ; anything but *\n"
    sabnf += "\n"
    sabnf += "rest-of-block-comment-after-star = \"/\"\n"
    sabnf += "                                 / \"*\" rest-of-block-comment-after-star\n"
    sabnf += "                                 / not-star-or-slash rest-of-block-comment\n"
    sabnf += "\n"
    sabnf += "not-star-or-slash = %x0-29 / %x2B-2E / %x30-10FFFF ; anything but * or /\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "cws = ws *( comment / ws ) ; comments and/or whitespace -- optimize this rule\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "uppercase-letter = %x41-5A ; A-Z\n"
    sabnf += "\n"
    sabnf += "lowercase-letter = %x61-7A ; a-z\n"
    sabnf += "\n"
    sabnf += "letter = uppercase-letter / lowercase-letter\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "digit = %x30-39 ; 0-9\n"
    sabnf += "\n"
    sabnf += "hex-digit = digit / \"a\" / \"b\" / \"c\" / \"d\" / \"e\" / \"f\" ; 0-9 A-F a-f\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "identifier = 1*letter *( letter / digit / \"_\" )\n"
    sabnf += "\n"
    sabnf += "program-id = identifier \".\" identifier\n"
    sabnf += "\n"
    sabnf += "locator = program-id \"/\" identifier\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "register = %s\"r\" 1*digit\n"
    sabnf += "\n"
    sabnf += "register-access = register *( \".\" identifier )\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "signed-literal = [ \"-\" ] 1*( digit *\"_\" ) signed-type\n"
    sabnf += "\n"
    sabnf += "unsigned-literal = [ \"-\" ] 1*( digit *\"_\" ) unsigned-type ; remove [ \"-\" ]\n"
    sabnf += "\n"
    sabnf += "integer-literal = signed-literal / unsigned-literal\n"
    sabnf += "\n"
    sabnf += "field-literal = [ \"-\" ] 1*( digit *\"_\" ) field-type\n"
    sabnf += "\n"
    sabnf += "group-literal = [ \"-\" ] 1*( digit *\"_\" ) group-type\n"
    sabnf += "\n"
    sabnf += "scalar-literal = [ \"-\" ] 1*( digit *\"_\" ) scalar-type\n"
    sabnf += "\n"
    sabnf += "arithmetic-literal = integer-literal\n"
    sabnf += "                   / field-literal\n"
    sabnf += "                   / group-literal\n"
    sabnf += "                   / scalar-literal\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "address-literal = %s\"aleo1\" 1*( address-char *\"_\" )\n"
    sabnf += "\n"
    sabnf += "address-char = \"0\" / \"2\" / \"3\" / \"4\" / \"5\" / \"6\" / \"7\" / \"8\" / \"9\"\n"
    sabnf += "             / %s\"a\" / %s\"c\" / %s\"d\" / %s\"e\" / %s\"f\" / %s\"g\" / %s\"h\" / %s\"j\"\n"
    sabnf += "             / %s\"k\" / %s\"l\" / %s\"m\" / %s\"n\" / %s\"p\" / %s\"q\" / %s\"r\" / %s\"s\"\n"
    sabnf += "             / %s\"t\" / %s\"u\" / %s\"v\" / %s\"w\" / %s\"x\" / %s\"y\" / %s\"z\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "boolean-literal = %s\"true\" / %s\"false\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "string-literal = dq *string-element dq\n"
    sabnf += "\n"
    sabnf += "string-element = not-dq-or-backslash\n"
    sabnf += "               / escaped-char\n"
    sabnf += "               / escaped-ws\n"
    sabnf += "\n"
    sabnf += "not-dq-or-backslash = %x0-21 / %x23-5B / %x5D-10FFFF ; anything but \" or \\\n"
    sabnf += "\n"
    sabnf += "escaped-char = \"\\\" ( dq\n"
    sabnf += "                   / \"\\\"\n"
    sabnf += "                   / \"/\"\n"
    sabnf += "                   / %s\"n\"\n"
    sabnf += "                   / %s\"r\"\n"
    sabnf += "                   / %s\"t\"\n"
    sabnf += "                   / %s\"b\"\n"
    sabnf += "                   / %s\"f\"\n"
    sabnf += "                   / %s\"u\" \"{\" 1*6hex-digit \"}\" )\n"
    sabnf += "\n"
    sabnf += "escaped-ws = \"\\\" 1*plain-ws ; should the ws here start with a line terminator?\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "literal = arithmetic-literal\n"
    sabnf += "        / address-literal\n"
    sabnf += "        / boolean-literal\n"
    sabnf += "        / string-literal\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "operand = literal / register-access / %s\"self.caller\" / program-id\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "unsigned-type = %s\"u8\" / %s\"u16\" / %s\"u32\" / %s\"u64\" / %s\"u128\"\n"
    sabnf += "\n"
    sabnf += "signed-type = %s\"i8\" / %s\"i16\" / %s\"i32\" / %s\"i64\" / %s\"i128\"\n"
    sabnf += "\n"
    sabnf += "integer-type = unsigned-type / signed-type\n"
    sabnf += "\n"
    sabnf += "field-type = %s\"field\"\n"
    sabnf += "\n"
    sabnf += "group-type = %s\"group\"\n"
    sabnf += "\n"
    sabnf += "scalar-type = %s\"scalar\"\n"
    sabnf += "\n"
    sabnf += "arithmetic-type = integer-type / field-type / group-type / scalar-type\n"
    sabnf += "\n"
    sabnf += "address-type = %s\"address\"\n"
    sabnf += "\n"
    sabnf += "boolean-type = %s\"boolean\"\n"
    sabnf += "\n"
    sabnf += "string-type = %s\"string\"\n"
    sabnf += "\n"
    sabnf += "literal-type = arithmetic-type / address-type / boolean-type / string-type\n"
    sabnf += "\n"
    sabnf += "plaintext-type = literal-type / identifier\n"
    sabnf += "\n"
    sabnf += "value-type = ( plaintext-type %s\".constant\"\n"
    sabnf += "             / plaintext-type %s\".public\"\n"
    sabnf += "             / plaintext-type %s\".private\"\n"
    sabnf += "             / identifier %s\".record\"\n"
    sabnf += "             / locator %s\".record\" )\n"
    sabnf += "\n"
    sabnf += "finalize-type = ( plaintext-type %s\".public\"\n"
    sabnf += "                / identifier %s\".record\"\n"
    sabnf += "                / locator %s\".record\" )\n"
    sabnf += "\n"
    sabnf += "entry-type = plaintext-type ( %s\".constant\" / %s\".public\" / %s\".private\" )\n"
    sabnf += "\n"
    sabnf += "register-type = ( locator %s\".record\"\n"
    sabnf += "                / identifier %s\".record\"\n"
    sabnf += "                / plaintext-type )\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "import = cws %s\"import\" ws program-id ws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "mapping = cws %s\"mapping\" ws identifier ws \":\"\n"
    sabnf += "          mapping-key\n"
    sabnf += "          mapping-value\n"
    sabnf += "\n"
    sabnf += "mapping-key = cws %s\"key\" ws identifier ws %s\"as\" ws finalize-type ws \";\"\n"
    sabnf += "\n"
    sabnf += "mapping-value = cws %s\"value\" ws identifier ws %s\"as\" ws finalize-type ws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "struct = cws %s\"struct\"  ws identifier ws \":\" 1*tuple\n"
    sabnf += "\n"
    sabnf += "tuple = cws identifier ws %s\"as\" ws plaintext-type ws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "record = cws %s\"record\" ws identifier ws \":\"\n"
    sabnf += "         cws %s\"owner\" ws %s\"as\" ws\n"
    sabnf += "         cws ( %s\"address.public\" / %s\"address.private\" ) ws \";\"\n"
    sabnf += "         cws %s\"gates\" ws %s\"as\" ws\n"
    sabnf += "         cws ( %s\"u64.public\" / %s\"u64.private\" ) ws \";\"\n"
    sabnf += "         *entry\n"
    sabnf += "\n"
    sabnf += "entry = cws identifier ws %s\"as\" ws entry-type ws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "unary-op = %s\"abs\" / %s\"abs.w\"\n"
    sabnf += "         / %s\"double\"\n"
    sabnf += "         / %s\"inv\"\n"
    sabnf += "         / %s\"neg\"\n"
    sabnf += "         / %s\"not\"\n"
    sabnf += "         / %s\"square\"\n"
    sabnf += "         / %s\"sqrt\"\n"
    sabnf += "\n"
    sabnf += "binary-op = %s\"add\" / %s\"add.w\"\n"
    sabnf += "          / %s\"sub\" / %s\"sub.w\"\n"
    sabnf += "          / %s\"mul\" / %s\"mul.w\"\n"
    sabnf += "          / %s\"div\" / %s\"div.w\"\n"
    sabnf += "          / %s\"rem\" / %s\"rem.w\"\n"
    sabnf += "          / %s\"mod\"\n"
    sabnf += "          / %s\"pow\" / %s\"pow.w\"\n"
    sabnf += "          / %s\"shl\" / %s\"shl.w\"\n"
    sabnf += "          / %s\"shr\" / %s\"shr.w\"\n"
    sabnf += "          / %s\"and\"\n"
    sabnf += "          / %s\"or\"\n"
    sabnf += "          / %s\"xor\"\n"
    sabnf += "          / %s\"nand\"\n"
    sabnf += "          / %s\"nor\"\n"
    sabnf += "          / %s\"gt\"\n"
    sabnf += "          / %s\"gte\"\n"
    sabnf += "          / %s\"lt\"\n"
    sabnf += "          / %s\"lte\"\n"
    sabnf += "\n"
    sabnf += "ternary-op = %s\"ternary\"\n"
    sabnf += "\n"
    sabnf += "is-op = %s\"is.eq\" / %s\"is.neq\"\n"
    sabnf += "\n"
    sabnf += "assert-op = %s\"assert.eq\" / %s\"assert.neq\"\n"
    sabnf += "\n"
    sabnf += "commit-op = %s\"commit.bhp\" ( \"256\" / \"512\" / \"768\" / \"1024\" )\n"
    sabnf += "          / %s\"commit.ped\" ( \"64\" / \"128\" )\n"
    sabnf += "\n"
    sabnf += "hash-op = %s\"hash.bhp\" ( \"256\" / \"512\" / \"768\" / \"1024\" )\n"
    sabnf += "         / %s\"hash.ped\" ( \"64\" / \"128\" )\n"
    sabnf += "         / %s\"hash.psd\" ( \"2\" / \"4\" / \"8\" )\n"
    sabnf += "\n"
    sabnf += "unary = unary-op ws ( operand ws ) %s\"into\" ws register\n"
    sabnf += "\n"
    sabnf += "binary = binary-op ws 2( operand ws ) %s\"into\" ws register\n"
    sabnf += "\n"
    sabnf += "ternary = ternary-op ws 3( operand ws ) %s\"into\" ws register\n"
    sabnf += "\n"
    sabnf += "is = is-op ws operand ws operand ws %s\"into\" ws register\n"
    sabnf += "\n"
    sabnf += "assert = assert-op ws operand ws operand\n"
    sabnf += "\n"
    sabnf += "commit = commit-op ws operand ws operand ws %s\"into\" ws register\n"
    sabnf += "\n"
    sabnf += "hash = hash-op ws operand ws %s\"into\" ws register\n"
    sabnf += "\n"
    sabnf += "cast = %s\"cast\" 1*( ws operand )\n"
    sabnf += "       ws %s\"into\" ws register ws %s\"as\" ws register-type\n"
    sabnf += "\n"
    sabnf += "call = %s\"call\" ws ( locator / identifier ) ws 1*( ws operand )\n"
    sabnf += "       ws %s\"into\" ws 1*( ws register )\n"
    sabnf += "\n"
    sabnf += "instruction = cws\n"
    sabnf += "              ( unary\n"
    sabnf += "              / binary\n"
    sabnf += "              / ternary\n"
    sabnf += "              / is\n"
    sabnf += "              / assert\n"
    sabnf += "              / commit\n"
    sabnf += "              / hash\n"
    sabnf += "              / cast\n"
    sabnf += "              / call )\n"
    sabnf += "              ws \";\"\n"
    sabnf += "\n"
    sabnf += "decrement = cws %s\"decrement\"\n"
    sabnf += "            ws identifier \"[\" ws operand ws \"]\"\n"
    sabnf += "            ws %s\"by\" ws operand ws \";\"\n"
    sabnf += "\n"
    sabnf += "increment = cws %s\"increment\"\n"
    sabnf += "            ws identifier \"[\" ws operand ws \"]\"\n"
    sabnf += "            ws %s\"by\" ws operand ws \";\"\n"
    sabnf += "\n"
    sabnf += "command = decrement / increment / instruction\n"
    sabnf += "\n"
    sabnf += "finalize-command = cws %s\"finalize\" *( ws operand ) cws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "function = cws %s\"function\" ws identifier ws \":\"\n"
    sabnf += "           *function-input\n"
    sabnf += "           1*instruction\n"
    sabnf += "           *function-output\n"
    sabnf += "\n"
    sabnf += "function-input = cws %s\"input\" ws register\n"
    sabnf += "                 ws %s\"as\" ws register-type ws \";\"\n"
    sabnf += "\n"
    sabnf += "function-output = cws %s\"output\" ws register-access\n"
    sabnf += "                  ws %s\"as\" ws register-type ws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "transition = cws %s\"transition\" ws identifier ws \":\"\n"
    sabnf += "           *transition-input\n"
    sabnf += "           *instruction\n"
    sabnf += "           *transition-output\n"
    sabnf += "           cws [ finalize-command finalize ]\n"
    sabnf += "\n"
    sabnf += "transition-input = cws %s\"input\" ws register\n"
    sabnf += "                   ws %s\"as\" ws value-type ws \";\"\n"
    sabnf += "\n"
    sabnf += "transition-output = cws %s\"output\" ws register-access\n"
    sabnf += "                    ws %s\"as\" ws value-type ws \";\"\n"
    sabnf += "\n"
    sabnf += "finalize = cws %s\"finalize\" ws identifier ws \":\"\n"
    sabnf += "           *finalize-input\n"
    sabnf += "           1*command\n"
    sabnf += "           *finalize-output\n"
    sabnf += "\n"
    sabnf += "finalize-input = cws %s\"input\" ws register\n"
    sabnf += "                 ws %s\"as\" ws finalize-type ws \";\"\n"
    sabnf += "\n"
    sabnf += "finalize-output = cws %s\"output\" ws register-access\n"
    sabnf += "                  ws %s\"as\" ws finalize-type ws \";\"\n"
    sabnf += "\n"
    sabnf += ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
    sabnf += "\n"
    sabnf += "program = *import\n"
    sabnf += "          cws %s\"program\" ws program-id ws \";\"\n"
    sabnf += "          1*( mapping / struct / record / function / transition )\n"
    sabnf += "          cws\n"
    return sabnf


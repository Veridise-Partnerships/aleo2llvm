from apg_py.lib import utilities as utils
from apg_py.lib.parser import Parser
import aleo
import sys

path = sys.argv[1]
input = open(path, 'r').read()
parser = Parser(aleo)
result = parser.parse(utils.string_to_tuple(input), start_rule='program')
print('\n1) Parser Result')
print(result)
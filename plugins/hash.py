"""
Hashing algorithms.

Usage:

  Ybot hash md5 some_string
  Ybot hash sha1 some_string
  Ybot hash sha224 some_string
  Ybot hash sha256 some_string
  Ybot hash sha384 some_string
  Ybot hash sha512 some_string

"""

import sys
import hashlib

# check args
if len(sys.argv) != 2:
	# print log
	print 'Wrong usage.\nUsage:\n    Ybot md5 some_string'
	# exit
	sys.exit()

# get hashing algorithm
alg = sys.argv[1].split(' ')[0].lower()
# check alg
if alg in hashlib.algorithms:
	"""
	hash
	"""
	string_to_hash = sys.argv[1][len(alg): ].lstrip(' ')
	if alg == 'md5':
		print hashlib.md5(string_to_hash).hexdigest()
	elif alg == 'sha1':
		print hashlib.sha1(string_to_hash).hexdigest()
	elif alg == 'sha224':
		print hashlib.sha224(string_to_hash).hexdigest()
	elif alg == 'sha256':
		print hashlib.sha256(string_to_hash).hexdigest()
	elif alg == 'sha384':
		print hashlib.sha384(string_to_hash).hexdigest()
	elif alg == 'sha512':
		print hashlib.sha512(string_to_hash).hexdigest()
	else: 
		print 'Wrong hashing algorithm. Supports only:\n' + str(hashlib.algorithms)		
else:
	# return error
	print 'Wrong hashing algorithm. Supports only:\n' + str(hashlib.algorithms)
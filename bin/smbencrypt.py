'''
Created on Mar 23, 2014

@author: tamer
'''
from sys import argv
import hashlib
import binascii

def ntlm_hash(passwd):
    '''
    Generates the NTLM Hash of a given string
    '''
    return binascii.hexlify(hashlib.new('md4', passwd.encode('utf-16le')).digest()).upper()

if __name__ == '__main__':
    if len(argv) > 1:
        script, filename = argv
        passwds = open(filename, "r").split()
        for passwd in passwds:
            print passwd
            print ntlm_hash(passwd)
    else:
        while True:
            passwd = raw_input("password (q to quit)> ")
            if passwd == "q":
                break
            print ntlm_hash(passwd)
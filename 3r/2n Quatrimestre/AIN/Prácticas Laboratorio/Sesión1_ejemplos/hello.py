import argparse

from spade import quit_spade

from spade_bdi.bdi import BDIAgent

parser = argparse.ArgumentParser(description='spade bdi hello example')
parser.add_argument('--login', type=str, default="basicagent", help='your UPV login.')
parser.add_argument('--server', type=str, default="localhost", help='XMPP server address.')
parser.add_argument('--password', type=str, default="bdipassword", help='XMPP password for the agents.')
args = parser.parse_args()

a = BDIAgent("HelloAgent_{}@{}".format(args.login,args.server), args.password, "hello.asl")

a.start()

import time
time.sleep(1)

a.stop().result()

quit_spade()
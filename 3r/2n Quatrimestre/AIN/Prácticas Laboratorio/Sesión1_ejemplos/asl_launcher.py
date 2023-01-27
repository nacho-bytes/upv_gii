import argparse

from spade import quit_spade

from spade_bdi.bdi import BDIAgent

parser = argparse.ArgumentParser(description='spade bdi launcher example')
parser.add_argument('--login', type=str, default="basicagent", help='your UPV login.')
parser.add_argument('--server', type=str, default="localhost", help='XMPP server address.')
parser.add_argument('--password', type=str, default="bdipassword", help='XMPP password for the agents.')
parser.add_argument('--asl', type=str, default="default.asl", help='asl file with JASON code.')
parser.add_argument('--time', type=int, default=1, help='duration time (in seconds) of the execution.')
args = parser.parse_args()

a = BDIAgent("Agent_{}@{}".format(args.login,args.server), args.password, args.asl)

a.start()

import time
time.sleep(args.time)

a.stop().result()

quit_spade()
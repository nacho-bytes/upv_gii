import argparse

import agentspeak
from spade import quit_spade

from spade_bdi.bdi import BDIAgent

parser = argparse.ArgumentParser(description='spade bdi basic example')
parser.add_argument('--login', type=str, default="basicagent", help='your UPV login.')
parser.add_argument('--server', type=str, default="localhost", help='XMPP server address.')
parser.add_argument('--password', type=str, default="bdipassword", help='XMPP password for the agent.')
arguments = parser.parse_args()


class MyCustomBDIAgent(BDIAgent):
    def add_custom_actions(self, actions):
        @actions.add_function(".my_function", (int,))
        def _my_function(x):
            return x * x

        @actions.add(".my_action", 1)
        def _my_action(agent, term, intention):
            arg = agentspeak.grounded(term.args[0], intention.scope)
            print(arg)
            yield


a = MyCustomBDIAgent("{}@{}".format(arguments.login, arguments.server), arguments.password, "actions.asl")

a.start()

import time

time.sleep(2)
a.stop().result()

quit_spade()

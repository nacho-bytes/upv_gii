import json
import numpy as np
import math
from loguru import logger
from spade.behaviour import OneShotBehaviour
from spade.template import Template
from spade.message import Message
from pygomas.bditroop import BDITroop
from pygomas.bdisoldier import BDISoldier
from agentspeak import Actions
from agentspeak import grounded
from agentspeak.stdlib import actions as asp_action
from pygomas.ontology import HEALTH

from pygomas.agent import LONG_RECEIVE_WAIT

class BDIAitSoldier(BDISoldier):

      def add_custom_actions(self, actions):
        super().add_custom_actions(actions)
        
        @actions.add_function(".get_esquina", (tuple,tuple,))
        def _get_esquina(pos,esq):
            minim = 1000; idx = -1
            pos = list(pos)
            esq = [list(esq[0]),list(esq[1]),list(esq[2]),list(esq[3])]
            for i in range(4):
                dist = np.sum(np.absolute(np.subtract(pos,esq[i])))
                if minim > dist: 
                    minim = dist
                    idx = i
            return idx
        
        @actions.add_function(".cuarto_vuelta", ())
        def _cuarto_vuelta():
            res = math.pi / 2;
            return float(res)
            
 #       super().__init__(actions=example_agent_actions, *args, **kwargs)

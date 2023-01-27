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

class BDIDeaSoldier(BDISoldier):

      def add_custom_actions(self, actions):
        super().add_custom_actions(actions)
        
        @actions.add_function(".get_esquina", (tuple,tuple,))
        def _get_esquina(pos,esq):
            min = 1000
            pos = list(pos)
            esq = [list(esq[0]),list(esq[1]),list(esq[2]),list(esq[3])]
            for i in range(4):
                d = np.sum(np.absolute(np.subtract(pos,esq[i])))
                if d < min: 
                    min = d
                    minI = i
            return minI
        
        @actions.add_function(".calculo_giro", (int,))
        def _calculo_giro(G):
            res = (math.pi / 2) * G;
            return float(res)
            

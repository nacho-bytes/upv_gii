import json
import numpy as np
import math
import random
from loguru import logger
from spade.behaviour import OneShotBehaviour
from spade.template import Template
from spade.message import Message
from pygomas.bditroop import BDITroop
from pygomas.bdisoldier import BDISoldier
from pygomas.bdimedic import BDIMedic
from pygomas.bdifieldop import BDIFieldOp
from agentspeak import Actions
from agentspeak import grounded
from agentspeak.stdlib import actions as asp_action
from pygomas.ontology import HEALTH

from pygomas.agent import LONG_RECEIVE_WAIT

class MySoldier(BDISoldier):
    def add_custom_actions(self, actions):
        super().add_custom_actions(actions)

        @actions.add_function(".is_friend_in_shoot", (tuple, tuple, tuple, float,))
        def _is_friend_in_shoot(mPos, ePos, fPos, fDist):
            oVec = [0,0];  mVec = [mPos[0], mPos[2]];
            eVec = [ePos[0] - mVec[0], ePos[2] - mVec[1]]; 
            fVec = [fPos[0] - mVec[0], fPos[2] - mVec[1]];
            dFri = dist(oVec, fVec);
            if (dFri < 0.05 * 50): return True;
            cosAlpha = (eVec[0] * fVec[0] + eVec[1] * fVec[1]) / (module(eVec) * module(fVec))
            alpha = math.acos(cosAlpha)
            if (alpha < math.pi / 12): return True;
            else: return False;
        
        @actions.add_function(".return_closer", (tuple, tuple, tuple,))
        def _return_closer(mPos, oPos, rPos):
            mVec = [mPos[0], mPos[2]];
            oVec = [oPos[0], oPos[2]];
            rVec = [rPos[0], rPos[2]];
            mDist = dist(mPos, rPos);
            oDist = dist(oPos, rPos);
            # En caso igual devolvemos la nuestra
            if (mDist <= oDist) : return mPos;
            else: return oPos;
        
        @actions.add_function(".pos_to_int", (tuple,))
        def _pos_to_int(pos):
            return tuple(int(c) for c in list(pos))
        
        @actions.add_function(".mejor_med", (tuple, tuple,))
        def _is_friend_in_shoot(medpos, mipos):
            idx = 0
            distance = -1
            length = len(medpos)
            if length < 2: return 0
            for num,pos in enumerate(medpos):
                print(pos)
                aux = dist(pos, mipos)
                if aux < distance: 
                    distance = aux
                    idx = num
            return idx

        @actions.add_function(".create_circle_points", (tuple, int, int,))
        def _create_circle_points(pcentral,radio,npoints):
            radianes = 2*math.pi
            puntos = []
            for i in range(npoints):
                angle = radianes * (i/npoints)
                x = math.cos(angle) * radio
                y = math.sin(angle) * radio
                puntos.append((pcentral[0] + x,0,pcentral[2] + y))
            puntos = tuple(puntos)
            return puntos

class MyMedic(BDIMedic):
    def add_custom_actions(self, actions):
        super().add_custom_actions(actions)

        @actions.add_function(".is_friend_in_shoot", (tuple, tuple, tuple, float,))
        def _is_friend_in_shoot(mPos, ePos, fPos, fDist):
            oVec = [0,0];  mVec = [mPos[0], mPos[2]];
            eVec = [ePos[0] - mVec[0], ePos[2] - mVec[1]]; 
            fVec = [fPos[0] - mVec[0], fPos[2] - mVec[1]];
            dFri = dist(oVec, fVec);
            if (dFri < 0.05 * 50): return True;
            cosAlpha = (eVec[0] * fVec[0] + eVec[1] * fVec[1]) / (module(eVec) * module(fVec))
            alpha = math.acos(cosAlpha)
            if (alpha < math.pi / 12): return True;
            else: return False;

        @actions.add_function(".create_circle_points", (tuple, int, int,))
        def _create_circle_points(pcentral,radio,npoints):
            radianes = 2*math.pi
            puntos = []
            for i in range(npoints):
                angle = radianes * (i/npoints)
                x = math.cos(angle) * radio
                y = math.sin(angle) * radio
                puntos.append((pcentral[0] + x,0,pcentral[2] + y))
            puntos = tuple(puntos)
            return puntos

class MyFieldOp(BDIFieldOp):
    def add_custom_actions(self, actions):
        super().add_custom_actions(actions)

        @actions.add_function(".is_friend_in_shoot", (tuple, tuple, tuple, float,))
        def _is_friend_in_shoot(mPos, ePos, fPos, fDist):
            oVec = [0,0];  mVec = [mPos[0], mPos[2]];
            eVec = [ePos[0] - mVec[0], ePos[2] - mVec[1]]; 
            fVec = [fPos[0] - mVec[0], fPos[2] - mVec[1]];
            dFri = dist(oVec, fVec);
            if (dFri < 0.05 * 50): return True;
            cosAlpha = (eVec[0] * fVec[0] + eVec[1] * fVec[1]) / (module(eVec) * module(fVec))
            alpha = math.acos(cosAlpha)
            if (alpha < math.pi / 12): return True;
            else: return False;

        @actions.add_function(".create_circle_points", (tuple, int, int,))
        def _create_circle_points(pcentral,radio,npoints):
            radianes = 2*math.pi
            puntos = []
            for i in range(npoints):
                angle = radianes * (i/npoints)
                x = math.cos(angle) * radio
                y = math.sin(angle) * radio
                puntos.append((pcentral[0] + x,0,pcentral[2] + y))
            puntos = tuple(puntos)
            return puntos

def module(vec):
    return math.sqrt(sum(v**2 for v in vec));

def dist(v1, v2):
    return math.sqrt(sum((v1p - v2p)**2 for v1p, v2p in zip(v1, v2)));
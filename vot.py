
import ast
import sys
import os
import dis
from astor.code_gen import to_source
import inspect
from random import randint
from modulefinder import ModuleFinder
from shutil import copyfile
from shutil import rmtree
from operator import itemgetter
import operator

import six

PY3, PY2 = six.PY3, not six.PY3

#testing globals
gSimplicityOn = 0
gSimplicityOn3 = 0
#TODO handler
gClousureList=[]
gRetreat=0
gSource=[]

class template(object):
	def __init__(self):
		self.rootNode = 1
		self.codeArray=[]
		self.isaTable=[]
		
		self.ml = None
		
		self.programName=None
		self.programArray=[]
		self.programVM=[]
		self.programOutput=[]
		self.normalBytes=['POP_TOP','DUP_TOP','DUP_TOPX','DUP_TOP_TWO','ROT_TWO','ROT_THREE','ROT_FOUR']
		self.normalBytes2=[]
		
	def randJunk(self):
		return [-1]
		#x = randint(0, 10)
		#return [x]
	
	def randInt(self):
		return 0
		#return randint(0, 10)
	
	#def makeCodeArray(self,code):codeArray 0:op 1:arg 2:loc
	def initArrays(self,code):
		#print (code.co_cellvars)
		codeInfo=[]
		codeArray2=[[],[],[]]
		tempGen = dis.findlinestarts(code)
		for tp in tempGen:
			codeInfo.append(tp)
		
		for i in range(0,3):
			self.codeArray.append([])
		for i in range(0,7):
			self.isaTable.append([])
		
		loc = 0#current Instruc
		loc2 = 0
		infoCounter = 0
		#dis.dis(code)
		#exit(0)
		
		while True:
			#print(loc)
			if infoCounter+1 < len(codeInfo):
				if loc >= codeInfo[infoCounter+1][0]:
					loc2 = loc
					infoCounter += 1
					for i in range(0,3):
						self.codeArray[i].extend(codeArray2[i])
					codeArray2=[[],[],[]]
			#print (loc,infoCounter)
			byteCode = code.co_code[loc]
			
			if byteCode == 0:
				loc += 1
				continue
			byteName = dis.opname[byteCode]
			codeArray2[0].append(byteName)
			codeArray2[2].append(loc)
			loc += 1
			
			#isa
			if byteName not in self.isaTable[0]:
				self.isaTable[0].append(byteName)
			
			arg = None
			arguments = []
			if byteCode >= dis.HAVE_ARGUMENT:
				intArg = code.co_code[loc]
				loc += 1
				if byteCode in dis.hasconst:
					arg = code.co_consts[intArg]
				elif byteCode in dis.hasfree:
					if intArg < len(code.co_cellvars):
						arg = code.co_cellvars[intArg]
					else:
						var_idx = intArg - len(code.co_cellvars)
						arg = code.co_freevars[var_idx]
				elif byteCode in dis.hasname:
					arg = code.co_names[intArg]
				elif byteCode in dis.hasjrel:
					arg = loc + intArg
				elif byteCode in dis.hasjabs:
					arg = intArg
				elif byteCode in dis.haslocal:
					arg = code.co_varnames[intArg]
				else:
					arg = intArg
				
				if isinstance(arg,type(code)):
					codeee=[]
					firsttt = True
					#print('code object inside LOAD:\n')
					custom = gSource[codeInfo[infoCounter][1] - 1].replace("\t","")
					#print(custom)
					
					
					#loc = codeInfo[infoCounter+1][0]#...
					loc = loc2
					while loc < codeInfo[infoCounter+1][0]:
						#print(dis.opname[code.co_code[loc]])
						if code.co_code[loc] == 124:#load_fast
							ia = code.co_code[loc+1]
							q124 = code.co_varnames[ia]
							if firsttt == True:
								firsttt = False
							else:
								codeee.append('\t\t')
							codeee.append('{} = {}[\'{}\']\n'.format(q124,self.ml,q124))
						elif code.co_code[loc] == 135:#load_closure
							ia = code.co_code[loc+1]
							if ia < len(code.co_cellvars):
								q135 = code.co_cellvars[ia]
							else:
								var_idx = ia - len(code.co_cellvars)
								q135 = code.co_freevars[var_idx]
							if firsttt == True:
								firsttt = False
							else:
								codeee.append('\t\t')
							codeee.append('{} = {}[\'{}\']\n'.format(q135,self.ml,q135))
						elif code.co_code[loc] == 125:
							ia = code.co_code[loc+1]
							q125 = code.co_varnames[ia]
							if firsttt == True:
								firsttt = False
							else:
								codeee.append('\t\t')
							codeee.append(custom)
							codeee.append('\t\t{}[\'{}\'] = locals()[\'{}\']\n'.format(self.ml,q125,q125))
							if loc+2 != codeInfo[infoCounter+1][0]:
								print('gg')
								gRetreat = 1
						loc += 2
					
					custom2 = ''.join(codeee)
					#print(custom2)
					if custom2 not in self.isaTable[0]:
						self.isaTable[0].append(custom2)
					
					codeArray2[0] = [custom2]
					codeArray2[1] = [[]]
					codeArray2[2] = [codeArray2[2][0]]
					continue
					
				arguments = [arg]
			codeArray2[1].append(arguments)
			if len(code.co_code)-1 == loc:
				for i in range(0,3):
					self.codeArray[i].extend(codeArray2[i])
				break

		#print (self.isaTable)
		#print (self.codeArray)
		return
	
	def test2(self):#super op
		mydict=dict()
		#for ch in self.codeArray[0]:
		#	mydict[ch]=mydict.get(ch,0)+1
		#print (mydict)
		
		#print ([self.codeArray[0][i:i+2] for i in range(0,len(self.codeArray[0])-1)])
		mybigram = [self.codeArray[0][i:i+2] for i in range(0,len(self.codeArray[0])-1)]
		for (ch1,ch2) in mybigram:
			if (not self.is_jump(ch1)) and (not self.is_jump(ch2)):
				mydict[(ch1,ch2)]=mydict.get((ch1,ch2),0)+1
		
		bigramfreqsorted=sorted(mydict.items(), key=itemgetter(1), reverse=True)
		#print (bigramfreqsorted)
		
		#how many super ops to make?
		xx=0
		for x,y in bigramfreqsorted:
			if y > 1:
				xx += 1
		
		#for i in bigramfreqsorted[:xx]:
		#	self.isaTable[0].append(i[0])
		
		#xx = len(bigramfreqsorted)//2
		#for i in bigramfreqsorted[:xx]:
		#	self.isaTable[0].append(i[0])
		
	
	def test3(self):#ISA
		y = randint(0, 999)
		for x in self.isaTable[0]:
			while y in self.isaTable[1]:
				y = randint(0, 1000)
			self.isaTable[1].append(y)
			if isinstance(x,tuple):
				for i in range(0,5):
					self.isaTable[i+2].append(-1)
				continue
			
			self.isaTable[4].append(-1)#unused
			tmp3 = 1 + self.randInt()
			self.isaTable[3].append((tmp3,))
			tmp2 = 1 + tmp3 + self.randInt()
			self.isaTable[2].append(tmp2)
			
			#5: pop 6:push
			self.isaTable[5].append(self.pop_lookup(x))
			self.isaTable[6].append(self.pushn_lookup(x))
		
		index = -1
		for x in self.isaTable[0]:
			index += 1
			if not isinstance(x,tuple):
				continue
			tempAr=[]
			temp5=0
			temp6=0
			for i in x:
				idx = self.isaTable[0].index(i)
				temp5 += self.isaTable[5][idx]
				temp6 += self.isaTable[6][idx]
			self.isaTable[5][index] = temp5
			self.isaTable[6][index] = temp6
			
			tmp31 = 1 + self.randInt()
			tmp32 = 1 + tmp31 + self.randInt()
			tmp2 = 1 + tmp32 + self.randInt()
			
			self.isaTable[3][index] = (tmp31,tmp32)
			self.isaTable[2][index] = tmp2
		#print (self.isaTable)
	
	
	def test4(self):#program array
		#print (self.codeArray)
		global gRetreat
		self.codeArray.append([])
		skip = True
		for i in range(len(self.codeArray[0])):
			if skip == True:
				skip = False
				continue
			tt = tuple(val for val in self.codeArray[0][i-1:i+1])
			#print (tt)
			if tt in self.isaTable[0]:
				idx = self.isaTable[0].index(tt)
				self.programArray.append([self.isaTable[1][idx]])#
				for s in range(2):
					self.codeArray[3].append(len(self.programArray)-1)#
				for j in range(self.isaTable[2][idx]-1):
					#self.programArray.append(-1)
					self.programArray.append(self.randJunk())
				skip = True
				
			else:
				idx = self.isaTable[0].index(self.codeArray[0][i-1])
				self.programArray.append([self.isaTable[1][idx]])#
				self.codeArray[3].append(len(self.programArray)-1)#
				for j in range(self.isaTable[2][idx]-1):
					#self.programArray.append(-1)
					self.programArray.append(self.randJunk())
				
				if i == len(self.codeArray[0])-1:
					idx = self.isaTable[0].index(self.codeArray[0][i])
					self.programArray.append([self.isaTable[1][idx]])#
					self.codeArray[3].append(len(self.programArray)-1)#
					for j in range(self.isaTable[2][idx]-1):
						#self.programArray.append(-1)
						self.programArray.append(self.randJunk())
		
		#print (self.codeArray)
		#print (self.programArray)
		for i in range(len(self.programArray)):
			if i not in self.codeArray[3]:
				continue
			#print (i)
			idx = self.isaTable[1].index((self.programArray[i])[0])
			count=len(self.isaTable[3][idx])
			for k in range(len(self.isaTable[3][idx])):
				count -= 1
				idx2 = self.codeArray[3].index(i)#TODO: index same value ok?
				#print (idx2,k)
				if self.is_jump(self.isaTable[0][idx]):
					try:
						idx3 = self.codeArray[2].index((self.codeArray[1][idx2+k])[0])
					except:
						gRetreat = 1
						return
					self.programArray[(self.isaTable[3][idx])[k]+i] = [self.codeArray[3][idx3]]
				else:
					self.programArray[(self.isaTable[3][idx])[k]+i] = self.codeArray[1][idx2+k]
			
				
		#print (self.codeArray)
		#print (self.programArray)
	
	#================
	#isa table: [n][]... 0:bytecode 1:opcode 2:program counter 3:arg offsets 4:reg offset
	#programArray: make program array base on ISA
	#================
	def makeIsaTable(self):
		y = randint(0, 99)
		#z = randint(1, 3)
		currentOp = 'NOP'
		count = -1
		for x in self.codeArray:
			#currentOp = 'NOP'
			count += 1
			if isinstance(x,str):
				currentOp = x
				if x not in self.isaTable[0]:#new bytecode
					self.isaTable[0].append(x)
				
					while y in self.isaTable[1]:
						y = randint(0, 100)
					self.isaTable[1].append(y)
					self.programArray.append([y])
					
					p2 = 1
					self.isaTable[3].append(p2)
					
					p3 = 3
					if x[-1] == '2' or x[-1] == '3':
						while p3 == p2:
							p3 += 1
					else:#pure stack
						p3 = 0
					self.isaTable[4].append(p3)
					
					z = p2 + p3 + 1#randint(5, 6)
					self.isaTable[2].append(z)
					
				else:#old bytecode
					idx = self.isaTable[0].index(x)
					self.programArray.append([self.isaTable[1][idx]])
				
				idx = self.isaTable[0].index(x)
				padding = self.isaTable[2][idx]-1
				counter = 1
				for i in range(0,padding):
					self.programArray.append(-1)
			
			else:#arg
				#self.programArray.append(x)
				idx = self.isaTable[0].index(currentOp)
				self.programArray[self.isaTable[3][idx] - self.isaTable[2][idx]] = x
	
	def generateOutput(self):#!!!
		myLocalsAlias = '_{}_locals'.format(self.programName)
		self.programOutput.append('{} = dict(locals())\n'.format(myLocalsAlias))
		#self.programOutput.append('{} = locals()\n'.format(myLocalsAlias))
		myStackAlias = '_{}_stack'.format(self.programName)
		self.programOutput.append('{} = []\n'.format(myStackAlias))
		mybStackAlias = '_{}_bstack'.format(self.programName)
		self.programOutput.append('{} = []\n'.format(mybStackAlias))
		myPcAlias = '_{}_pc'.format(self.programName)
		self.programOutput.append('{} = 0\n'.format(myPcAlias))
		myCodeAlias = '_{}_myCode'.format(self.programName)
		self.programOutput.append('{} = {}\n'.format(myCodeAlias,self.programArray))
		myWhyAlias = '_{}_why'.format(self.programName)
		self.programOutput.append('{} = None\n'.format(myWhyAlias))
		myRetAlias = '_{}_retVal'.format(self.programName)
		self.programOutput.append('{} = None\n'.format(myRetAlias))
		myLEAlias = '_{}_LE'.format(self.programName)
		self.programOutput.append('{} = None\n'.format(myLEAlias))
		
		reg1 = '_{}_reg'.format(self.programName)
		reg2 = '_{}_reg2'.format(self.programName)
		reg3 = '_{}_reg3'.format(self.programName)
		reg4 = '_{}_reg4'.format(self.programName)
		reg5 = '_{}_reg5'.format(self.programName)
		reg6 = '_{}_reg6'.format(self.programName)
		
		
		if gSimplicityOn or gSimplicityOn2 or gSimplicityOn3:
			self.programOutput.append('{} = lambda i:0 if i>0 else 1\n'.format('signBit'))
		
		if gSimplicityOn:
			#for popn
			sArray = []
			sArray2 = []
			#sArray3 = []
			sArray.append([])
			sArray.append([])
			for opc in self.isaTable[1]:
				sArray[0].append('signBit({}'+' - {})'.format(opc))
				sArray[1].append('signBit({}'.format(opc)+' - {})')
				sArray2.append(self.popn_lookup(opc))
				#sArray3.append(opc)
			#print (sArray)
			self.programOutput.append('{} = {}\n'.format('sArray',sArray))
		
		if gSimplicityOn2 or gSimplicityOn3:
			#for pc
			s3Array = []
			s3Array2 = []
			s3Array3 = []
			s3Array.append([])
			s3Array.append([])
			for opc in self.isaTable[1]:
				s3Array[0].append('signBit({}'+' - {})'.format(opc))
				s3Array[1].append('signBit({}'.format(opc)+' - {})')
				idx = self.isaTable[1].index(opc)
				s3Array2.append(self.isaTable[2][idx])
				#s3Array3.append(opc)
			self.programOutput.append('{} = {}\n'.format('s3Array',s3Array))
			
		
		self.programOutput.append('while 1:\n')
		
		if gSimplicityOn:
			self.programOutput.append('\t{} = 0'.format('popn'))
			for i in range(len(sArray[0])):
				self.programOutput.append(' + ')
				first = True
				for j in range(len(sArray[0])):
					s1 = 'eval(sArray[0][{}].format({}[{}][0]))'.format(j,myCodeAlias,myPcAlias)
					s2 = 'eval(sArray[1][{}].format({}[{}][0]))'.format(j,myCodeAlias,myPcAlias)
					#ss = 'eval(sArray[0][{}]) * eval(sArray[1][{}])'.format(j,j)
					ss = s1 + '*' + s2
					if first == True:
						first = False
					else:
						self.programOutput.append(' * ')
					
					if j != i:
						self.programOutput.append('(1-{})'.format(ss))
					else:
						self.programOutput.append('{}'.format(ss))
					
				self.programOutput.append(' * {}'.format(sArray2[i]))
			self.programOutput.append('\n')
			
			self.programOutput.append('\t{} = []'.format('popItems'))
			self.programOutput.append('\n')
			#self.programOutput.append('\t{} = [None,None,None,None]'.format('pushItems'))
			#self.programOutput.append('\n')
			self.programOutput.append('\tfor ite in range({}):\n'.format('popn'))
			self.programOutput.append('\t\t{}.append({}.pop())'.format('popItems',myStackAlias))
			self.programOutput.append('\n')
			
		first = True
		for bytecode in self.isaTable[0]:
			idx = self.isaTable[0].index(bytecode)
			if gSimplicityOn2:
				#self.programOutput.append('\t{} = [None,None,None,None]'.format('pushItems'))
				#self.programOutput.append('\n')
				if (bytecode not in self.normalBytes) and (bytecode.startswith(tuple(self.normalBytes2)) == False):
					self.programOutput.append('\tif {}[{}][0] == {}:\n'.format(myCodeAlias,myPcAlias,self.isaTable[1][idx]))
			elif first:
				first = False
				self.programOutput.append('\tif {}[{}][0] == {}:\n'.format(myCodeAlias,myPcAlias,self.isaTable[1][idx]))
			else:
				self.programOutput.append('\telif {}[{}][0] == {}:\n'.format(myCodeAlias,myPcAlias,self.isaTable[1][idx]))
			
			if isinstance(bytecode,tuple):
				count = -1
				for bt in bytecode:
					count += 1
					self.handlerGenerator3(bt,self.isaTable[2][idx],(self.isaTable[3][idx])[count],self.isaTable[4][idx])
			else:
				self.handlerGenerator3(bytecode,self.isaTable[2][idx],(self.isaTable[3][idx])[0],self.isaTable[4][idx])
			
			
			
			
			if gSimplicityOn2 and (bytecode in self.normalBytes or bytecode.startswith(tuple(self.normalBytes2))):#handle stack push
				mytestAlias = '_{}_test'.format(self.programName)
				mytestAlias2 = '_{}_test2'.format(self.programName)
				self.programOutput.append('\t{} = {}[{}][0]\n'.format(mytestAlias,myCodeAlias,myPcAlias))
				self.programOutput.append('\t{} = dict()\n'.format(mytestAlias2))
				self.programOutput.append('\t{}[\'signBit\'] = signBit\n'.format(mytestAlias2))
				
				self.programOutput.append('\t{} = '.format('pushn'))
				first = True
				for j in range(len(s3Array[0])):
					if first == True:
						first = False
					else:
						self.programOutput.append(' * ')
					s1 = 'eval(s3Array[0][{}].format({}),{},{})'.format(j,mytestAlias,mytestAlias2,mytestAlias2)
					s2 = 'eval(s3Array[1][{}].format({}),{},{})'.format(j,mytestAlias,mytestAlias2,mytestAlias2)
					ss = s1 + '*' + s2
					if j != idx:
						self.programOutput.append('(1-{})'.format(ss))
					else:
						self.programOutput.append('{}'.format(ss))
				self.programOutput.append(' * {}'.format(1))
				self.programOutput.append('\n')
				
				mycstackAlias = '_{}_cstack'.format(self.programName)
				self.programOutput.append('\tif not pushn:\n'.format('pushItems'))#go back...
				self.programOutput.append('\t\t{} = {}\n'.format(myStackAlias,mycstackAlias))
				#self.programOutput.append('\telse:\n')
				#self.programOutput.append('\t\t{} += {}\n'.format(myPcAlias,self.isaTable[2][idx]))
			elif (not gSimplicityOn3) and (not gSimplicityOn2):
				self.programOutput.append('\t\t{} += {}\n'.format(myPcAlias,self.isaTable[2][idx]))
				
		
		#setup pc for sp2
		
		if (not gSimplicityOn3) and gSimplicityOn2:
			first = True
			for bytecode in self.isaTable[0]:
				idx = self.isaTable[0].index(bytecode)
				if first:
					first = False
					self.programOutput.append('\tif {}[{}][0] == {}:\n'.format(myCodeAlias,myPcAlias,self.isaTable[1][idx]))
				else:
					self.programOutput.append('\telif {}[{}][0] == {}:\n'.format(myCodeAlias,myPcAlias,self.isaTable[1][idx]))
				self.programOutput.append('\t\t{} += {}\n'.format(myPcAlias,self.isaTable[2][idx]))
		
		if gSimplicityOn3:
			#ss program counter
			mytestAlias = '_{}_test'.format(self.programName)
			mytestAlias2 = '_{}_test2'.format(self.programName)
			self.programOutput.append('\t{} = {}[{}][0]\n'.format(mytestAlias,myCodeAlias,myPcAlias))
			self.programOutput.append('\t{} = dict()\n'.format(mytestAlias2))
			self.programOutput.append('\t{}[\'signBit\'] = signBit\n'.format(mytestAlias2))
			self.programOutput.append('\t{} += '.format(myPcAlias))
			first2 = True
			for i in range(len(s3Array[0])):
				first = True
				if first2 == True:
					first2 = False
				else:
					self.programOutput.append(' + ')
				for j in range(len(s3Array[0])):
					s1 = 'eval(s3Array[0][{}].format({}),{},{})'.format(j,mytestAlias,mytestAlias2,mytestAlias2)
					s2 = 'eval(s3Array[1][{}].format({}),{},{})'.format(j,mytestAlias,mytestAlias2,mytestAlias2)
					ss = s1 + '*' + s2
					if first == True:
						first = False
					else:
						self.programOutput.append(' * ')
					
					if j != i:
						self.programOutput.append('(1-{})'.format(ss))
					else:
						self.programOutput.append('{}'.format(ss))
					
				self.programOutput.append(' * {}'.format(s3Array2[i]))
			self.programOutput.append('\n')
		
		self.programOutput.append('\tif {} == \'reraise\':\n'.format(myWhyAlias))
		self.programOutput.append('\t\t{} = \'exception\'\n'.format(myWhyAlias))
		
		#block manager
		#self.programOutput.append('\t\n'.format())
		self.programOutput.append('\twhile {} and {}:\n'.format(mybStackAlias,myWhyAlias))
		self.programOutput.append('\t\t{} = {}[-1]\n'.format(reg1,mybStackAlias))#reg1->block
		self.programOutput.append('\t\tif {}[0] == \'loop\' and {} == \'continue\':\n'.format(reg1,myWhyAlias))
		self.programOutput.append('\t\t\t{} = {}\n'.format(myPcAlias,myRetAlias))
		self.programOutput.append('\t\t\t{} = None\n'.format(myWhyAlias))
		self.programOutput.append('\t\t\tcontinue\n'.format())
		
		self.programOutput.append('\t\t{}.pop()\n'.format(mybStackAlias))
		#unwind block
		self.programOutput.append('\t\tif {}[0] != \'except-handler\':\n'.format(reg1))
		self.programOutput.append('\t\t\twhile len({}) > {}[2]:\n'.format(myStackAlias,reg1))
		self.programOutput.append('\t\t\t\t{}.pop()\n'.format(myStackAlias))
		self.programOutput.append('\t\telse:\n'.format())
		self.programOutput.append('\t\t\twhile len({}) > {}[2] + 3:\n'.format(myStackAlias,reg1))
		self.programOutput.append('\t\t\t\t{}.pop()\n'.format(myStackAlias))
		self.programOutput.append('\t\t\t{} ,{} ,{} = {}[-3:]\n'.format(reg2,reg3,reg4,myStackAlias))
		self.programOutput.append('\t\t\t{}[-3:] = []\n'.format(myStackAlias))
		self.programOutput.append('\t\t\t{} = {},{},{}\n'.format(myLEAlias,reg4,reg3,reg2))
		
		self.programOutput.append('\t\tif {}[0] == \'loop\' and {} == \'break\':\n'.format(reg1,myWhyAlias))
		self.programOutput.append('\t\t\t{} = None\n'.format(myWhyAlias))
		self.programOutput.append('\t\t\t{} = {}[1]\n'.format(myPcAlias,reg1))
		self.programOutput.append('\t\t\tcontinue\n'.format())
		
		self.programOutput.append('\t\tif({} == \'exception\' and {}[0] in [\'setup-except\',\'finally\']):\n'.format(myWhyAlias,reg1))
		self.programOutput.append('\t\t\t{} = (\'except-handler\',None,len({}))\n'.format(reg5,myStackAlias))
		self.programOutput.append('\t\t\t{}.append({})\n'.format(mybStackAlias,reg5))
		self.programOutput.append('\t\t\t{},{},{} = {}\n'.format(reg2,reg3,reg4,myLEAlias))
		self.programOutput.append('\t\t\t{}.extend(({},{},{}))\n'.format(myStackAlias,reg4,reg3,reg2))
		self.programOutput.append('\t\t\t{}.extend(({},{},{}))\n'.format(myStackAlias,reg4,reg3,reg2))
		self.programOutput.append('\t\t\t{} = None\n'.format(myWhyAlias))
		self.programOutput.append('\t\t\t{} = {}[1]\n'.format(myPcAlias,reg1))
		#self.programOutput.append('\t\t\tcontinue\n'.format())
		
		
		self.programOutput.append('\t\telif {}[0] == \'finally\':\n'.format(reg1))
		self.programOutput.append('\t\t\tif {} in [\'return\',\'continue\']:\n'.format(myWhyAlias))
		self.programOutput.append('\t\t\t\t{}.append({})\n'.format(myStackAlias,myRetAlias))
		self.programOutput.append('\t\t\t{}.append({})\n'.format(myStackAlias,myWhyAlias))
		self.programOutput.append('\t\t\t{} = None\n'.format(myWhyAlias))
		self.programOutput.append('\t\t\t{} = {}[1]\n'.format(myPcAlias,reg1))
		#self.programOutput.append('\t\t\n'.format())
		
		self.programOutput.append('\tif {} != None:\n'.format(myWhyAlias))
		self.programOutput.append('\t\treturn {}\n'.format(myRetAlias))
		
		if gShowVPC:
			self.programOutput.append('\tprint ("{}",{})\n'.format(self.programName,myPcAlias))
		if gShowStack:
			self.programOutput.append('\tprint ("{}",{})\n'.format(self.programName,myStackAlias))
			
			
	
	def popn_lookup(self,opc):#!!!
		idx = self.isaTable[1].index(opc)
		if self.isaTable[0][idx] == 'STORE_FAST' or \
		self.isaTable[0][idx] == 'STORE_NAME' or \
		self.isaTable[0][idx] == 'LOAD_ATTR' or \
		self.isaTable[0][idx] == 'POP_TOP' or \
		self.isaTable[0][idx] == 'RETURN_VALUE':
			return 1
		elif self.isaTable[0][idx] == 'STORE_ATTR' or \
		self.isaTable[0][idx] == 'ROT_TWO':
			return 2
		elif self.isaTable[0][idx].startswith('BINARY_'):
			return 2
		elif self.isaTable[0][idx] == 'ROT_THREE':
			return 3
		elif self.isaTable[0][idx] == 'ROT_FOUR':
			return 4
		else:
			return 0
	
	def pop_lookup(self,bytecode):#!!!
		if bytecode == 'STORE_FAST' or \
		bytecode == 'STORE_NAME' or \
		bytecode == 'LOAD_ATTR' or \
		bytecode == 'POP_TOP' or \
		bytecode == 'RETURN_VALUE':
			return 1
		elif bytecode == 'STORE_ATTR' or \
		bytecode == 'ROT_TWO':
			return 2
		elif bytecode.startswith('BINARY_'):
			return 2
		elif bytecode == 'ROT_THREE':
			return 3
		elif bytecode == 'ROT_FOUR':
			return 4
		else:
			return 0
	
	def is_jump(self,bytecode):#!!!
		if bytecode == 'JUMP_FORWARD' or \
		bytecode == 'JUMP_ABSOLUTE' or \
		bytecode == 'POP_JUMP_IF_TRUE' or \
		bytecode == 'POP_JUMP_IF_FALSE' or \
		bytecode == 'JUMP_IF_TRUE_OR_POP' or \
		bytecode == 'JUMP_IF_FALSE_OR_POP' or \
		bytecode == 'FOR_ITER':
			return 1
		else:
			return 0
	
	def pushn_lookup(self,bytecode):#!!!
		if bytecode == 'LOAD_FAST' or \
		bytecode == 'LOAD_GLOBAL' or \
		bytecode == 'LOAD_ATTR' or \
		bytecode == 'LOAD_CONST' or \
		bytecode == 'LOAD_NAME' or \
		bytecode == 'RETURN':
			return 1
		elif bytecode.startswith('BINARY_'):
			return 1
		elif bytecode == 'ROT_TWO':
			return 2
		elif bytecode == 'ROT_THREE':
			return 3
		elif bytecode == 'ROT_FOUR':
			return 4
		else:
			return 0
	
	def quickGenerator(self,bytecode,myString):
		if bytecode == 'LOAD_FAST':
			myString.join('')
		else:
			return
	
	def handlerGenerator3(self,bytecode,myPadding,myArg,myReg):#!!!
		global gRetreat
		myLocalsAlias = '_{}_locals'.format(self.programName)
		myStackAlias = '_{}_stack'.format(self.programName)
		mybStackAlias = '_{}_bstack'.format(self.programName)
		myPcAlias = '_{}_pc'.format(self.programName)
		myCodeAlias = '_{}_myCode'.format(self.programName)
		
		mta1 = '_{}_tmp'.format(self.programName)
		mta2 = '_{}_tmp2'.format(self.programName)
		mta3 = '_{}_tmp3'.format(self.programName)
		mta4 = '_{}_tmp4'.format(self.programName)
		mta5 = '_{}_tmp5'.format(self.programName)
		mta6 = '_{}_tmp6'.format(self.programName)
		mta7 = '_{}_tmp7'.format(self.programName)
		mta8 = '_{}_tmp8'.format(self.programName)
		
		myWhyAlias = '_{}_why'.format(self.programName)
		myRetAlias = '_{}_retVal'.format(self.programName)
		myLEAlias = '_{}_LE'.format(self.programName)
		
		mycstackAlias = '_{}_cstack'.format(self.programName)
		
		BINARY_OPERATORS = {
			'POWER':	'pow',
			'MULTIPLY': 'operator.mul',
			'DIVIDE':   'getattr(operator, \'div\', lambda x, y: None)',
			'FLOOR_DIVIDE': 'operator.floordiv',
			'TRUE_DIVIDE':  'operator.truediv',
			'MODULO':   'operator.mod',
			'ADD':	  'operator.add',
			'SUBTRACT': 'operator.sub',
			'SUBSCR':   'operator.getitem',
			'LSHIFT':   'operator.lshift',
			'RSHIFT':   'operator.rshift',
			'AND':	  'operator.and_',
			'XOR':	  'operator.xor',
			'OR':	   'operator.or_',
		}
		INPLACE_OPERATORS = {
			'POWER':	'**=',
			'MULTIPLY': '*=',
			'DIVIDE':   '//=',
			'FLOOR_DIVIDE': '//=',
			'TRUE_DIVIDE':  '/=',
			'MODULO':   '%=',
			'ADD':	  '+=',
			'SUBTRACT': '-=',
			'LSHIFT':   '<<=',
			'RSHIFT':   '>>=',
			'AND':	  '&=',
			'XOR':	  '^=',
			'OR':	   '|=',
		}
		UNARY_OPERATORS = {
			'POSITIVE':'operator.pos',
			'NEGATIVE': 'operator.neg',
			'NOT':	  'operator.not_',
			'CONVERT':  'repr',
			'INVERT':   'operator.invert',
		}
		COMPARE_OPERATORS = [
			operator.lt,
			operator.le,
			operator.eq,
			operator.ne,
			operator.gt,
			operator.ge,
			lambda x, y: x in y,
			lambda x, y: x not in y,
			lambda x, y: x is y,
			lambda x, y: x is not y,
			lambda x, y: issubclass(x, Exception) and issubclass(x, y),
		]
		COMPARE_OPERATORS2 = '''[
			operator.lt,
			operator.le,
			operator.eq,
			operator.ne,
			operator.gt,
			operator.ge,
			lambda x, y: x in y,
			lambda x, y: x not in y,
			lambda x, y: x is y,
			lambda x, y: x is not y,
			lambda x, y: issubclass(x, Exception) and issubclass(x, y),
		]'''
		
		if gSimplicityOn2 and (bytecode in self.normalBytes or bytecode.startswith(tuple(self.normalBytes2))):
			self.programOutput.append('\t{} = {}[:]\n'.format(mycstackAlias,myStackAlias))
			self.programOutput.append('\ttry:\n')
			self.programOutput.append('\t\t')
			if bytecode == 'LOAD_FAST':
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_GLOBAL':
				self.programOutput.append('if {}[{}+{}][0] in globals():\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('globals()',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telif hasattr(__builtins__,\'__dict__\'):\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__.__dict__',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__',myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_CONST':
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}+{}][0])\n'.format(myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_NAME':
				self.programOutput.append('if {}[{}+{}][0] in {}:\n'.format(myCodeAlias,myPcAlias,myArg,myLocalsAlias))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telif {}[{}+{}][0] in globals():\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('globals()',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				
				self.programOutput.append('\t\telif hasattr(__builtins__,\'__dict__\'):\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__.__dict__',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__',myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_ATTR':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append(getattr({}, {}[{}+{}][0]))\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
			
			elif bytecode == 'POP_TOP':
				self.programOutput.append('{}.pop()\n'.format(myStackAlias))
			elif bytecode == 'DUP_TOP':
				self.programOutput.append('{}.append({}[-1])\n'.format(myStackAlias,myStackAlias))
			elif bytecode == 'DUP_TOPX':
				self.programOutput.append('{} = []\n'.format(mta1))
				self.programOutput.append('\t\tfor i in range({}[{}+{}][0]):\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta1,myStackAlias,mta1))
				self.programOutput.append('\t\tfor i in [1,2]:\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{}.append(*{})\n'.format(myStackAlias,mta1))
			elif bytecode == 'DUP_TOP_TWO':
				self.programOutput.append('{}, {}= {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{},{},{}))\n'.format(myStackAlias,mta1,mta2,mta1,mta2))
			elif bytecode == 'ROT_TWO':
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{}))\n'.format(myStackAlias,mta2,mta1))
			elif bytecode == 'ROT_THREE':
				self.programOutput.append('{}, {}, {} = {}[-3:]\n'.format(mta1,mta2,mta3,myStackAlias))
				self.programOutput.append('\t\t{}[-3:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{},{}))\n'.format(myStackAlias,mta3,mta1,mta2))
			elif bytecode == 'ROT_FOUR':
				self.programOutput.append('{}, {}, {}, {} = {}[-4:]\n'.format(mta1,mta2,mta3,mta4,myStackAlias))
				self.programOutput.append('\t\t{}[-4:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{},{},{}))\n'.format(myStackAlias,mta4,mta1,mta2,mta3))
			
			#elif bytecode.startswith('BINARY_'):
			#	self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
			#	self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
			#	self.programOutput.append('\t\t{}'.format(myStackAlias))
			#	self.programOutput.append('.append({}({},{}))\n'.format(BINARY_OPERATORS[bytecode[7:]],mta1,mta2))
			elif bytecode == 'COMPARE_OP':
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta3,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = {}\n'.format(mta4,COMPARE_OPERATORS2))
				self.programOutput.append('\t\t{}.append({}[{}]({},{}))\n'.format(myStackAlias,mta4,mta3,mta1,mta2))
			
			elif bytecode == 'CALL_FUNCTION':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = {{}}\n'.format(mta2))
				self.programOutput.append('\t\tfor i in range({}//256):\n'.format(mta1))
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta4,myStackAlias))
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta5,myStackAlias))
				self.programOutput.append('\t\t\t{}[{}] = {}\n'.format(mta2,mta5,mta4))
				
				self.programOutput.append('\t\t{} = []\n'.format(mta3))
				self.programOutput.append('\t\tfor i in range({}%256):\n'.format(mta1))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta3,myStackAlias,mta3))
				self.programOutput.append('\t\t{}.append({}.pop()(*{},**{}))\n'.format(myStackAlias,myStackAlias,mta3,mta2))
			
			
			
			
			self.programOutput.append('\texcept:\n')
			self.programOutput.append('\t\tpass\n')
			#else:
			#	gRetreat=1
			return
		
		else:
			self.programOutput.append('\t\t')
			#self.programOutput.append('\t\t{} += 1\n\t\t'.format(myPcAlias))
			if bytecode == 'STORE_FAST':#self.frame.f_locals[name] = self.pop()
				self.programOutput.append('{}[{}[{}+{}][0]]'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append(' = {}.pop()\n'.format(myStackAlias))
			elif bytecode == 'DELETE_FAST':
				self.programOutput.append('del {}[{}[{}+{}][0]]\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'STORE_NAME':#self.frame.f_locals[name] = self.pop()
				self.programOutput.append('{}[{}[{}+{}][0]]'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append(' = {}.pop()\n'.format(myStackAlias))
			elif bytecode == 'STORE_GLOBAL':#..
				self.programOutput.append('globals()[{}[{}+{}][0]]'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append(' = {}.pop()\n'.format(myStackAlias))
			elif bytecode == 'STORE_ATTR':#val, obj = self.popn(2)...
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\tsetattr({}, {}[{}+{}][0], {})\n'.format(mta2,myCodeAlias,myPcAlias,myArg,mta1))
			elif bytecode == 'LOAD_FAST':#stack.push(self.frame.f_locals[name])
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_GLOBAL':
				self.programOutput.append('if {}[{}+{}][0] in globals():'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('globals()',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telif hasattr(__builtins__,\'__dict__\'):')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__.__dict__',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telse:')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__',myCodeAlias,myPcAlias,myArg))
				#self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				#if sys.version_info >= (3,7):
				#	self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__',myCodeAlias,myPcAlias,myArg))
				#else:
				#	self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__.__dict__',myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_CONST':#stack.push(const)
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}+{}][0])\n'.format(myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_NAME':#? push(frame.f_locals[name])
				self.programOutput.append('if {}[{}+{}][0] in {}:\n'.format(myCodeAlias,myPcAlias,myArg,myLocalsAlias))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telif {}[{}+{}][0] in globals():\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('globals()',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				
				self.programOutput.append('\t\telif hasattr(__builtins__,\'__dict__\'):\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__.__dict__',myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format('__builtins__',myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_ATTR':#self.push(getattr(obj, attr))
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append(getattr({}, {}[{}+{}][0]))\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'BUILD_TUPLE':#builds...?
				self.programOutput.append('{} = []\n'.format(mta1))
				self.programOutput.append('\t\tfor i in range({}[{}+{}][0]):\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta1,myStackAlias,mta1))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append(tuple({}))\n'.format(mta1))
			elif bytecode == 'BUILD_LIST':
				self.programOutput.append('{} = []\n'.format(mta1))
				self.programOutput.append('\t\tfor i in range({}[{}+{}][0]):\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta1,myStackAlias,mta1))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({})\n'.format(mta1))
			elif bytecode == 'BUILD_MAP':
				self.programOutput.append('{} = dict()\n'.format(mta1))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta2,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\tfor i in range({}):\n'.format(mta2))
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta3,myStackAlias))
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta4,myStackAlias))
				self.programOutput.append('\t\t\t{}[{}]={}\n'.format(mta1,mta4,mta3))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({})\n'.format(mta1))
			elif bytecode == 'BUILD_CONST_KEY_MAP':
				self.programOutput.append('{} = dict()\n'.format(mta1))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta2,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = {}.pop()\n'.format(mta3,myStackAlias))
				self.programOutput.append('\t\tfor i in range({}):\n'.format(mta2))
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta4,myStackAlias))
				self.programOutput.append('\t\t\t{}[{}[-1*(i+1)]]={}\n'.format(mta1,mta3,mta4))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({})\n'.format(mta1))
			elif bytecode == 'BUILD_SLICE':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\tif {} == 2:\n'.format(mta1))
				self.programOutput.append('\t\t\t{}, {} = {}[-2:]\n'.format(mta2,mta3,myStackAlias))
				self.programOutput.append('\t\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append(slice({},{}))\n'.format(mta2,mta3))
				self.programOutput.append('\t\telif {} == 3:\n'.format(mta1))
				self.programOutput.append('\t\t\t{},{},{} = {}[-3:]\n'.format(mta2,mta3,mta4,myStackAlias))
				self.programOutput.append('\t\t\t{}[-3:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append(slice({},{},{}))\n'.format(mta2,mta3,mta4))
				
			
			elif bytecode == 'CALL_FUNCTION_KW_old':#???
				self.programOutput.append('tmp = {}.pop()\n'.format(myStackAlias))
				self.programOutput.append('\t\targ = {}[{}+{}][0]\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\ttmp2 = {}\n')
				self.programOutput.append('\t\tfor i in range(arg//256):\n')
				self.programOutput.append('\t\t\tv = {}.pop()\n'.format(myStackAlias))
				self.programOutput.append('\t\t\tk = {}.pop()\n'.format(myStackAlias))
				self.programOutput.append('\t\t\ttmp2[k] = v\n')
				
				self.programOutput.append('\t\ttmp2.update(tmp)\n')
				self.programOutput.append('\t\ttmp3 = []\n')
				self.programOutput.append('\t\tfor i in range(arg%256):\n')
				self.programOutput.append('\t\t\ttmp3 = [{}.pop()] + tmp3\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.append({}.pop()(*tmp3,**tmp2))\n'.format(myStackAlias,myStackAlias))
			
			elif bytecode == 'CALL_FUNCTION_KW':#??? mta1-tmp mta2-arg mta3-tmp2 mta4-tmp4 mta5-tmp3
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta2,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = []\n'.format(mta3))
				self.programOutput.append('\t\tfor i in range(len({})):\n'.format(mta1))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta3,myStackAlias,mta3))
				self.programOutput.append('\t\t{} = {{}}\n'.format(mta4))
				self.programOutput.append('\t\tfor i in range(len({})):\n'.format(mta1))
				self.programOutput.append('\t\t\t{}[{}[i]] = {}[i]\n'.format(mta4,mta1,mta3))
				
				self.programOutput.append('\t\t{} = []\n'.format(mta5))
				self.programOutput.append('\t\tfor i in range({}%256 - len({})):\n'.format(mta2,mta1))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta5,myStackAlias,mta5))
				self.programOutput.append('\t\t{}.append({}.pop()(*{},**{}))\n'.format(myStackAlias,myStackAlias,mta5,mta4))
			elif bytecode == 'CALL_FUNCTION':#retval = func(*posargs, **namedargs) mta1-arg mta4-v mta5-k
				self.programOutput.append('try:\n')
				self.programOutput.append('\t\t\t{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{} = {{}}\n'.format(mta2))
				self.programOutput.append('\t\t\tfor i in range({}//256):\n'.format(mta1))
				self.programOutput.append('\t\t\t\t{} = {}.pop()\n'.format(mta4,myStackAlias))
				self.programOutput.append('\t\t\t\t{} = {}.pop()\n'.format(mta5,myStackAlias))
				self.programOutput.append('\t\t\t\t{}[{}] = {}\n'.format(mta2,mta5,mta4))
				
				self.programOutput.append('\t\t\t{} = []\n'.format(mta3))
				self.programOutput.append('\t\t\tfor i in range({}%256):\n'.format(mta1))
				self.programOutput.append('\t\t\t\t{} = [{}.pop()] + {}\n'.format(mta3,myStackAlias,mta3))
				self.programOutput.append('\t\t\t{}.append({}.pop()(*{},**{}))\n'.format(myStackAlias,myStackAlias,mta3,mta2))
				self.programOutput.append('\t\texcept:\n')
				self.programOutput.append('\t\t\t{} = sys.exc_info()[:2] + (None,)\n'.format(myLEAlias))
				self.programOutput.append('\t\t\t{} = \'exception\'\n'.format(myWhyAlias))
			#...
			elif bytecode == 'POP_JUMP_IF_FALSE':#val = self.pop() ...self.jump(jump)
				self.programOutput.append('if not {}.pop():\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\tcontinue\n'.format())
			elif bytecode == 'POP_JUMP_IF_TRUE':
				self.programOutput.append('if {}.pop():\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\tcontinue\n'.format())
			elif bytecode == 'JUMP_IF_FALSE_OR_POP':
				self.programOutput.append('if not {}[-1]:\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\tcontinue\n'.format())
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}.pop()\n'.format(myStackAlias))
			elif bytecode == 'JUMP_IF_TRUE_OR_POP':
				self.programOutput.append('if {}[-1]:\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\tcontinue\n'.format())
				self.programOutput.append('\t\telse:\n')
				self.programOutput.append('\t\t\t{}.pop()\n'.format(myStackAlias))
			elif bytecode == 'JUMP_ABSOLUTE':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\tcontinue\n'.format())
			elif bytecode == 'JUMP_FORWARD':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\tcontinue\n'.format())
			
			elif bytecode == 'LOAD_METHOD':
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}+{}][0])\n'.format(myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'CALL_METHOD':
				self.programOutput.append('{} = []\n'.format(mta1))
				self.programOutput.append('\t\tfor i in range({}[{}+{}][0]):\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta1,myStackAlias,mta1))
				
				self.programOutput.append('\t\t{} = getattr({}[-2],{}[-1])(*{})\n'.format(mta1,myStackAlias,myStackAlias,mta1))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({})\n'.format(mta1))
			elif bytecode == 'POP_TOP':
				self.programOutput.append('{}.pop()\n'.format(myStackAlias))
			elif bytecode == 'DUP_TOP':
				self.programOutput.append('{}.append({}[-1])\n'.format(myStackAlias,myStackAlias))
			elif bytecode == 'DUP_TOPX':
				self.programOutput.append('{} = []\n'.format(mta1))
				self.programOutput.append('\t\tfor i in range({}[{}+{}][0]):\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{} = [{}.pop()] + {}\n'.format(mta1,myStackAlias,mta1))
				self.programOutput.append('\t\tfor i in [1,2]:\n'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\t{}.append(*{})\n'.format(myStackAlias,mta1))
			elif bytecode == 'DUP_TOP_TWO':
				self.programOutput.append('{}, {}= {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{},{},{}))\n'.format(myStackAlias,mta1,mta2,mta1,mta2))
			elif bytecode == 'ROT_TWO':
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{}))\n'.format(myStackAlias,mta2,mta1))
			elif bytecode == 'ROT_THREE':
				self.programOutput.append('{}, {}, {} = {}[-3:]\n'.format(mta1,mta2,mta3,myStackAlias))
				self.programOutput.append('\t\t{}[-3:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{},{}))\n'.format(myStackAlias,mta3,mta1,mta2))
			elif bytecode == 'ROT_FOUR':
				self.programOutput.append('{}, {}, {}, {} = {}[-4:]\n'.format(mta1,mta2,mta3,mta4,myStackAlias))
				self.programOutput.append('\t\t{}[-4:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}.extend(({},{},{},{}))\n'.format(myStackAlias,mta4,mta1,mta2,mta3))
			
			elif bytecode == 'COMPARE_OP':
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta3,myCodeAlias,myPcAlias,myArg))
				#self.programOutput.append('\t\t{} = {}\n'.format(mta4,dis.cmp_op))
				self.programOutput.append('\t\t{} = {}\n'.format(mta4,COMPARE_OPERATORS2))
				self.programOutput.append('\t\t{}.append({}[{}]({},{}))\n'.format(myStackAlias,mta4,mta3,mta1,mta2))
				#self.programOutput.append('\t\t{}.append(tmp2[tmp](x,y))\n'.format(myStackAlias))
				#self.programOutput.append('\t\t{}.append(eval(\'str({}) {{}} str({})\'.format({}[{}])))\n'.format(myStackAlias,mta1,mta2,mta4,mta3))
				#self.programOutput.append('\t\t{}.append(eval(\'str({}) {{}} str({})\'.format({})))\n'.format(myStackAlias,mta1,mta2,mta3))
			elif bytecode.startswith('BINARY_'):
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}'.format(myStackAlias))
				self.programOutput.append('.append({}({},{}))\n'.format(BINARY_OPERATORS[bytecode[7:]],mta1,mta2))
			elif bytecode.startswith('INPLACE_'):
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}{}{}\n'.format(mta1,INPLACE_OPERATORS[bytecode[8:]],mta2))
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta1))
			elif bytecode.startswith('UNARY_'):
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append({}({}))\n'.format(myStackAlias,UNARY_OPERATORS[bytecode[6:]],mta1))
			#slice
			elif bytecode == 'SLICE+0':
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\t{}[-2:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}[:]={}\n'.format(mta2,mta1))
			
			elif bytecode == 'DELETE_SLICE+0':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\tdel {}[:]\n'.format(mta1))
			elif bytecode == 'STORE_SUBSCR':
				self.programOutput.append('{}, {}, {} = {}[-3:]\n'.format(mta1,mta2,mta3,myStackAlias))
				self.programOutput.append('\t\t{}[-3:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{}[{}] = {}\n'.format(mta2,mta3,mta1))
			elif bytecode == 'DELETE_SUBSCR':
				self.programOutput.append('{}, {} = {}[-2:]\n'.format(mta1,mta2,myStackAlias))
				self.programOutput.append('\t\tdel {}[{}]\n'.format(mta1,mta2))
			
			elif bytecode == 'LOAD_DEREF':#...
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				#self.programOutput.append('.append({}[{}+{}][0])\n'.format(myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LOAD_CLOSURE':#...
				self.programOutput.append('{}'.format(myStackAlias))
				self.programOutput.append('.append({}[{}[{}+{}][0]])\n'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				#self.programOutput.append('.append({}[{}+{}][0])\n'.format(myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'STORE_DEREF':
				#self.programOutput.append('{}[{}+{}][0]'.format(myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('{}[{}[{}+{}][0]]'.format(myLocalsAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append(' = {}.pop()\n'.format(myStackAlias))
			
			elif bytecode == 'GET_ITER':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append(iter({}))\n'.format(myStackAlias,mta1))
			elif bytecode == 'FOR_ITER':
				self.programOutput.append('{} = {}[-1]\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\ttry:\n')
				self.programOutput.append('\t\t\t{}=next({})\n'.format(mta2,mta1))
				self.programOutput.append('\t\t\t{}.append({})\n'.format(myStackAlias,mta2))
				self.programOutput.append('\t\texcept StopIteration:\n')
				self.programOutput.append('\t\t\t{}.pop()\n'.format(myStackAlias))
				
				self.programOutput.append('\t\t\t{} = {}[{}+{}][0]\n'.format(myPcAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t\tcontinue\n'.format())
			
			elif bytecode == 'POP_BLOCK':
				self.programOutput.append('{}.pop()\n'.format(mybStackAlias))
			elif bytecode == 'CONTINUE_LOOP':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(myRetAlias,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = \'continue\'\n'.format(myWhyAlias))
			elif bytecode == 'BREAK_LOOP':
				self.programOutput.append('{} = \'break\'\n'.format(myWhyAlias))
			
			elif bytecode == 'SETUP_WITH':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append({}.__exit__)\n'.format(myStackAlias,mta1))
				self.programOutput.append('\t\t{} = {}.__enter__()\n'.format(mta2,mta1))
				
				self.programOutput.append('\t\t{} = (\'{}\',{}[{}+{}][0],len({}))\n'.format(mta3,'finally',myCodeAlias,myPcAlias,myArg,myStackAlias))
				self.programOutput.append('\t\t{}.append({})\n'.format(mybStackAlias,mta3))
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta2))
			
			elif bytecode == 'WITH_CLEANUP_START':#mta2-u
				self.programOutput.append('{} = {} = None\n'.format(mta4,mta3))
				self.programOutput.append('\t\t{} = {}[-1]\n'.format(mta2,myStackAlias))
				self.programOutput.append('\t\tif {} is None:\n'.format(mta2))
				self.programOutput.append('\t\t\t{} = {}.pop(-2)\n'.format(mta1,myStackAlias))
				
				self.programOutput.append('\t\telif isinstance({}, str):\n'.format(mta2))
				self.programOutput.append('\t\t\tif {} in (\'return\', \'continue\'):\n'.format(mta2))
				self.programOutput.append('\t\t\t\t{} = {}.pop(-3)\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t\telse:\n')
				self.programOutput.append('\t\t\t\t{} = {}.pop(-2)\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t\t{} = None\n'.format(mta2))
				
				self.programOutput.append('\t\telif issubclass({}, BaseException):\n'.format(mta2))
				self.programOutput.append('\t\t\t{},{},{} = {}[-3:]\n'.format(mta4,mta3,mta2,myStackAlias))
				self.programOutput.append('\t\t\t{}[-3:]=[]\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{},{},{} = {}[-3:]\n'.format(mta7,mta6,mta5,myStackAlias))
				self.programOutput.append('\t\t\t{}[-3:]=[]\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t\t{}.extend(({},{},{}))\n'.format(myStackAlias,mta7,mta6,mta5))
				self.programOutput.append('\t\t\t{}.append(None)\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t{}.extend(({},{},{}))\n'.format(myStackAlias,mta4,mta3,mta2))
				
				self.programOutput.append('\t\t\t{} = {}.pop()\n'.format(mta5,mybStackAlias))
				#assert?
				self.programOutput.append('\t\t\t{} = ({}[0],{}[1],{}[2]-1)\n'.format(mta6,mta5,mta5,mta5))
				self.programOutput.append('\t\t\t{}.append({})\n'.format(mybStackAlias,mta6))
				
				
				self.programOutput.append('\t\t{} = {}({},{},{})\n'.format(mta7,mta1,mta2,mta3,mta4))
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta2))
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta7))
			
			elif bytecode == 'WITH_CLEANUP_FINISH':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{} = {}.pop()\n'.format(mta2,myStackAlias))
				self.programOutput.append('\t\t{} = ({} is not None) and bool({})\n'.format(mta3,mta2,mta1))
				self.programOutput.append('\t\tif {}:\n'.format(mta3))
				self.programOutput.append('\t\t\t{}.append(\'silenced\')\n'.format(myStackAlias))
			
			elif bytecode == 'SETUP_LOOP':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = (\'loop\',{},len({}))\n'.format(mta2,mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append({})\n'.format(mybStackAlias,mta2))
			elif bytecode == 'SETUP_FINALLY':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = (\'finally\',{},len({}))\n'.format(mta2,mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append({})\n'.format(mybStackAlias,mta2))
			elif bytecode == 'SETUP_EXCEPT':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = (\'setup-except\',{},len({}))\n'.format(mta2,mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append({})\n'.format(mybStackAlias,mta2))
			
			elif bytecode == 'POP_EXCEPT':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,mybStackAlias))
				# if block.type != 'except-handler':...
				#unwind except
				self.programOutput.append('\t\twhile len({}) > {}[2] + 3:\n'.format(myStackAlias,mta1))
				self.programOutput.append('\t\t\t{}.pop()\n'.format(myStackAlias))
				self.programOutput.append('\t\t{} ,{} ,{} = {}[-3:]\n'.format(mta3,mta4,mta5,myStackAlias))
				self.programOutput.append('\t\t{}[-3:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t{} = {},{},{}\n'.format(myLEAlias,mta5,mta4,mta3))
				
			elif bytecode == 'END_FINALLY':#self.programOutput.append('\t\t\n'.format())
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\tif isinstance({},str):\n'.format(mta1))
				self.programOutput.append('\t\t\t{} = {}\n'.format(myWhyAlias,mta1))
				self.programOutput.append('\t\t\tif {} in (\'return\', \'continue\'):\n'.format(mta1))
				self.programOutput.append('\t\t\t\t{} = {}.pop()\n'.format(myRetAlias,myStackAlias))
				
				self.programOutput.append('\t\t\tif {} == \'silenced\':\n'.format(mta1))
				self.programOutput.append('\t\t\t\t{} = {}.pop()\n'.format(mta2,mybStackAlias))
				self.programOutput.append('\t\t\t\tassert {}[0] == \'except-handler\'\n'.format(mta2,mybStackAlias))
				#unwind
				self.programOutput.append('\t\t\t\twhile len({}) > {}[2] + 3:\n'.format(myStackAlias,mta2))
				self.programOutput.append('\t\t\t\t\t{}.pop()\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t\t{} ,{} ,{} = {}[-3:]\n'.format(mta3,mta4,mta5,myStackAlias))
				self.programOutput.append('\t\t\t\t{}[-3:] = []\n'.format(myStackAlias))
				self.programOutput.append('\t\t\t\t{} = {},{},{}\n'.format(myLEAlias,mta5,mta4,mta3))
				self.programOutput.append('\t\t\t\t{} = None\n'.format(myWhyAlias))
				
				self.programOutput.append('\t\telif {} is None:\n'.format(mta1))
				self.programOutput.append('\t\t\t{} = None\n'.format(myWhyAlias))
				#......
			
			elif bytecode == 'RETURN_VALUE':
				self.programOutput.append('{} = {}.pop()\n'.format(myRetAlias,myStackAlias))
				self.programOutput.append('\t\t{} = \'return\'\n'.format(myWhyAlias))
			
			elif bytecode == 'UNPACK_SEQUENCE':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\tfor i in reversed({}):\n'.format(mta1))
				self.programOutput.append('\t\t\t{}.append(i)\n'.format(myStackAlias))
			elif bytecode == 'IMPORT_NAME':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{} = {}.pop()\n'.format(mta2,myStackAlias))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta3,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = __import__({}, globals(), {}, {}, {})\n'.format(mta4,mta3,myLocalsAlias,mta1,mta2))
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta4))
			elif bytecode == 'IMPORT_FROM':
				self.programOutput.append('{} = {}[-1]\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{}.append(getattr({}, {}[{}+{}][0]))\n'.format(myStackAlias,mta1,myCodeAlias,myPcAlias,myArg))
			elif bytecode == 'LIST_APPEND':
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta2,myCodeAlias,myPcAlias,myArg))
				self.programOutput.append('\t\t{} = {}[-1*{}]\n'.format(mta3,myStackAlias,mta2))
				self.programOutput.append('\t\t{}.append({})\n'.format(mta3,mta1))
				
			#elif bytecode == 'EXTENDED_ARG': self.programOutput.append('\n')
			elif bytecode == 'BUILD_TUPLE_UNPACK':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))#counts
				self.programOutput.append('\t\t{} = []\n'.format(mta2))
				self.programOutput.append('\t\tfor i in range({}):\n'.format(mta1))
				self.programOutput.append('\t\t\t{}.append({}.pop())\n'.format(mta2,myStackAlias))
				
				self.programOutput.append('\t\t{} = []\n'.format(mta3))
				self.programOutput.append('\t\tfor i in reversed({}):\n'.format(mta2))
				self.programOutput.append('\t\t\tfor j in i:\n')
				self.programOutput.append('\t\t\t\t{}.append(j)\n'.format(mta3))
				
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta3))
			elif bytecode == 'BUILD_TUPLE_UNPACK_WITH_CALL':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))#counts
				self.programOutput.append('\t\t{} = []\n'.format(mta2))
				self.programOutput.append('\t\tfor i in range({}):\n'.format(mta1))
				self.programOutput.append('\t\t\t{}.append({}.pop())\n'.format(mta2,myStackAlias))
				
				self.programOutput.append('\t\t{} = []\n'.format(mta3))
				self.programOutput.append('\t\tfor i in reversed({}):\n'.format(mta2))
				self.programOutput.append('\t\t\tfor j in i:\n')
				self.programOutput.append('\t\t\t\t{}.append(j)\n'.format(mta3))
				
				self.programOutput.append('\t\t{}.append({})\n'.format(myStackAlias,mta3))
			
			elif bytecode == 'CALL_FUNCTION_EX':
				self.programOutput.append('{} = {}[{}+{}][0]\n'.format(mta1,myCodeAlias,myPcAlias,myArg))#flag
				#TODO: KW
				self.programOutput.append('\t\t{} = {}.pop()\n'.format(mta3,myStackAlias))#tuple
				self.programOutput.append('\t\t{} = {}.pop()\n'.format(mta4,myStackAlias))#function
				
				self.programOutput.append('\t\t{}.append({}(*{}))\n'.format(myStackAlias,mta4,mta3))
			elif bytecode == 'MAKE_FUNCTION':#==
				self.programOutput.append('{} = {}.pop()\n'.format(mta1,myStackAlias))#name
				self.programOutput.append('\t\t{} = {}.pop()\n'.format(mta2,myStackAlias))#code
				self.programOutput.append('\t\t{} = {}[{}+{}][0]\n'.format(mta3,myCodeAlias,myPcAlias,myArg))#defaults
				self.programOutput.append('\t\t{} = compile({},\'<string>\',\'exec\')\n'.format(mta4,mta2))
				self.programOutput.append('\t\texec({},{})\n'.format(mta4,myLocalsAlias))
				self.programOutput.append('\t\t{}.append({}[\'asdf\'])\n'.format(myStackAlias,myLocalsAlias))
			
			elif bytecode.endswith('\n'):
				#self.programOutput.append('locals().update({})\n\t\t'.format(myLocalsAlias))
				self.programOutput.append(bytecode)
				#self.programOutput.append('\t\t{}.update(locals())\n'.format(myLocalsAlias))
			
			else:
				print ('skip bytecode:{}'.format(bytecode))
				gRetreat=1
			#self.programOutput.append('\t\t{} += {}\n'.format(myPcAlias,myPadding)) x
	
	
	def transformNode(self,node):
		global gRetreat
		
		#inspect node
		for j in gClousureList:
			if node.lineno == j:
				return node
		
		self.programName = node.name
		self.ml = '_{}_locals'.format(self.programName)
		#dis.dis(node)
		fake = ast.parse('')
		fake.body.append(node)
		
		code_obj = compile(fake,'<string>','exec')
		for i in code_obj.co_consts:
			if isinstance(i,type(code_obj)):
				coo = i
		#print(code_obj.co_consts)
		self.initArrays(coo)#code_obj.co_consts[0]
		if gRetreat:
			gRetreat=0
			return node
		#print (self.codeArray)
		if gSuperOperatorOn:
			self.test2()
		self.test3()
		self.test4()
		#print (self.isaTable)
		#print (self.programArray)
		
		self.generateOutput()
		if gRetreat:
			gRetreat=0
			return node
		#self.handlerGenerator4()
		#return
		
		vv = ''.join(self.programOutput)
		if gMakeLogFile:
			with open(gMakeLogFileName, "a",encoding="utf-8") as fp:
				fp.write(vv)
		
		#node.body = ast.parse(vv).body
		#return node
		try:
			node.body = ast.parse(vv).body
		except Exception as exception:
			print (exception)
		return node
	def transformCode(self,coo):
		self.initArrays(coo)
		self.test3()
		self.test4()
		
		self.generateOutput()
		
		vv = ''.join(self.programOutput)
		if gMakeLogFile:
			with open(gMakeLogFileName, "a",encoding="utf-8") as fp:
				fp.write(vv)
		
		try:
			ast.parse(vv).body
		except Exception as exception:
			print (exception)
		return vv
	

class FuncLister(ast.NodeVisitor):
	def visit_FunctionDef(self, node):
		for i in node.body:
			if isinstance(i,ast.FunctionDef):
				gClousureList.append(i.lineno)
		self.generic_visit(node)

class FuncRewriter(ast.NodeTransformer):
	def visit_FunctionDef(self, node):
		self.generic_visit(node)
		tt = template()
		#print (node.name)
		return tt.transformNode(node)


def virtualizeMonitor(f):
	#print (p)
	global gSource
	#source=open('{}'.format(f),encoding="utf-8").read()
	
	with open('{}'.format(f),encoding="utf-8") as ff:
		source = ff.read()
	with open('{}'.format(f),encoding="utf-8") as ff:
		gSource = ff.readlines()
	tree = ast.parse(source)
	
	opi = ast.parse('import operator\n').body[0]
	opi2 = ast.parse('import sys\n').body[0]
	opi3 = ast.parse('import copy\n').body[0]
	lasti = 0
	for i in range(len(tree.body)):
		if isinstance(tree.body[i],ast.ImportFrom):
			if tree.body[i].module == '__future__':
				lasti = i+1
	tree.body.insert(lasti,opi)
	tree.body.insert(lasti,opi2)
	#print (tree.body)
	#print (gSource)
	
	gClousureList = []
	FuncLister().visit(tree)
	FuncRewriter().visit(tree)
	#print (to_source(tree))
	return tree
		
def gatherProject(ff):
	files = list(ff)
	for i in files:
		head,tail = os.path.split(i)
		copyfile(i,'test/{}'.format(tail))

def visitProject(input_file,lib_loc,tar_loc,result):
	finder = ModuleFinder()
	finder.run_script('{}'.format(input_file))
	
	for name, mod in finder.modules.items():
		filename = mod.__file__
		if filename is None:
			continue
		
		filename = os.path.normpath(os.path.abspath(filename))
		cp = os.path.relpath(filename,lib_loc)
		
		if cp[0:2] != '..':
			result[filename] = filename.replace(lib_loc,tar_loc,1)
		
def visitFolder(lib_loc,tar_loc,result):
	for dirpath,_,filenames in os.walk(lib_loc):
		dp = os.path.normpath(os.path.abspath(os.path.join(dirpath)))
		os.makedirs(dp.replace(lib_loc,tar_loc,1), exist_ok=True)
		for f in filenames:
			#print(os.path.normpath(os.path.abspath(os.path.join(dirpath, f))))
			filename = os.path.normpath(os.path.abspath(os.path.join(dirpath, f)))
			result[filename] = filename.replace(lib_loc,tar_loc,1)
	
	return
	

#read config
try:
	conf = open('cfg.txt')
except Exception as exception:
	print (exception)
exec(conf.read())

if __name__ == '__main__':
	input_file = ''
	lib_loc = ''
	tar_loc = ''
	for i in range(len(sys.argv)):
		#print i,sys.argv[i]
		if i == 1 and gWorkMode == 1:
			input_file = sys.argv[i]
		elif i == 1 and gWorkMode == 2:
			lib_loc = sys.argv[i]
		elif i == 2:
			tar_loc = sys.argv[i]
	
	if gWorkMode == 1 and len(input_file) == 0:
		print('error :input file unknown\n')
		exit(0)
	elif gWorkMode == 2 and len(lib_loc) == 0:
		print('error :input folder unknown\n')
		exit(0)
	elif len(tar_loc) == 0:
		print('error :output folder unknown\n')
		exit(0)
	
	input_file = os.path.normpath(os.path.abspath(input_file))
	lib_loc = os.path.normpath(os.path.abspath(lib_loc))
	tar_loc = os.path.normpath(os.path.abspath(tar_loc))
	#print lib_loc,input_file
	
	if gMakeLogFile:
		with open(gMakeLogFileName, "w") as fp:
			fp.write('...\n')
	
	targetFileList=dict()
	if gWorkMode == 3:
		visitProject(input_file,lib_loc,tar_loc,targetFileList)
	elif gWorkMode == 2:
		visitFolder(lib_loc,tar_loc,targetFileList)
	elif gWorkMode == 22:
		rmtree(tar_loc)
	elif gWorkMode == 1:
		fileDir ,fileName = os.path.split(input_file)
		ntt = input_file.replace(fileDir,tar_loc,1)
		targetFileList[input_file] = ntt
	
	#print (targetFileList)
	for p,q in targetFileList.items():
		fileNamePre, fileNameExt = os.path.splitext(p)
		tarDir ,tarName = os.path.split(q)
		os.makedirs(tarDir, exist_ok=True)
		if fileNameExt != '.py' and fileNameExt != '.pyx':
			copyfile(p, q)
			continue
		
		#print(q)
		tree = virtualizeMonitor(p)
		with open(q, "w",encoding="utf-8") as fp:
			fp.write(to_source(tree))
		
	#gatherProject(targetFileList)
	
	
